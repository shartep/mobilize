# mobilize
## API Assignment

In this task you need to create an API for adding and inviting members into a platform.

We want to support two main features:
1) The ability to add members to our db. The data we want to save will be their email and name. The data can be received via query params. (no need to upload a file)
2) We want to enable to invite any number of members from the members we added before, by sending them an email. It is ok to allow to invite the same members more than once. The invitation email content will be:  “Hi *name*, welcome to mobilize!” where the *name* should be replaced with the user’s name we added in the first step for each member. Integrate with SendGrid API for sending the email.

## Notes:
Authentication is not needed
The API needs to be restful simple & clean. 
You can create a free account in Sendgrid quickly. You should use the API to the send the email

## The things that matter to us:
Separation of concerns & Clean code
Performance
Scalable API (we would like to be able to support an email list of thousands of members)
The amount of time it took you to implement the assignment

# Result notes
Application deployed to https://mobilize-test.herokuapp.com/
there are  2 endpoints:
- POST `/members`, expect :body param with list of hashes like:
  {body: [{email: 'email@test.com', name: 'Jon'}, ...] }
  
- POST `/invites`, expect :body param with list of email addresses like:
  {body: ['email@test.com', 'user@email.com, ...] }
  
currently my Sendgrid account is under review, so app is not fully functioned

TODO: some specs should be written, but as soon as it is test task, and it was not requested in requirements, I do not write them now
