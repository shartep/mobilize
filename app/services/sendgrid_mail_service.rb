# Service responsible for sending emails through Sendgrid app, currently implemented only send_email
# method which accepts model with :email and :name fields, but functionality can be easy expanded
class SendgridMailService
  extend Memoist
  include SendGrid

  def initialize
    @sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    @client = @sg.client
  end

  def send_email(model)
    @client.mail._('send').post(request_body: mail(model.attributes.symbolize_keys).to_json)
      .then { |resp| {status: resp.status_code, body: resp.body} }
  end

  private

  def mail(email:, name:, **)
    Mail.new(from, subject, to(email), content(name))
  end

  memoize def from
    Email.new(email: ENV['FROM_EMAIL'])
  end

  memoize def subject
    'Invitation email'
  end

  def to(email)
    Email.new(email: email)
  end

  def content(name)
    Content.new(type: 'text/plain', value: "Hi #{name}, welcome to mobilize!")
  end
end
