module Member
  # This operation responsible for creation Member models
  #   @param :members  expect to be Array of Hashes with :email and :name keys like
  #     [{email: 'email@test.com', name: 'Jon'}, {email: 'contact@example.com', name: 'Linda'}, ...]
  class Create < Service::Base
    transaction!
    param(:members) { |val| filter_params(val) }

    private

    def _call
      Member.import!(
        members,
        validate: true,
        on_duplicate_key_update: {conflict_target: [:email], columns: [:name]}
      )
    end

    def filter_params(members)
      members.each { |member_attrs| member_attrs.slice!(:email, :name) }
    end
  end
end
