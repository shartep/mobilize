module API
  module V1
    # Controller for API actions related to Invite model
    class InvitesController < ApplicationController
      # POST /members/invites
      # expect :body param with list of email addresses, like ['user@test.com', 'member@mail.com', ...]
      def create
        InviteJob.perform_later(params[:body])

        render json: {status: :ok}, status: :ok
      end
    end
  end
end
