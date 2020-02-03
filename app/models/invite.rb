# represents Invite action, I use this model to track Invite emails delivery status and storing
# error responses from Sendgrid api in DB
class Invite < ApplicationRecord
  belongs_to :member
end
