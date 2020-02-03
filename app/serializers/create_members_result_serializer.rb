# Responsible for serialization of Result returned from Model.import method,
# which include information about inserting data into DB
class CreateMembersResultSerializer
  def initialize(result)
    @result = result
  end

  def call
    {
      created_ids: @result.ids,
      failed: @result.failed_instances.to_h { |fi| [fi.email, fi.errors.full_messages] }
    }
  end
end
