# responsible for processing invite request: fetch members with provided emails list,
# iterate through this list, and sends invite emails using Sendgrid email service
class InviteJob < ApplicationJob
  queue_as :default

  def perform(args)
    email_service = SendgridMailService.new
    Member.where(email: args).find_in_batches(batch_size: 100) do |members|
      threads = members.map do |member|
        Thread.new(member) do |member_|
          invite = member_.invites.create!
          response = email_service.send_email(member_)
          if response[:status] == '202'
            invite.update!(delivered: true)
          else
            invite.update!(response: response[:body])
          end
        end
      end
      threads.each(&:join)
    end
  end
end
