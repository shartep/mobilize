module API
  module V1
    # Controller for API actions related to Member model
    class MembersController < ApplicationController
      # POST /members/create
      # expect :body param with list of hashes like [{email: 'email@test.com', name: 'Jon'}, ...]
      def create
        result = Member::Create.new(members: param_hash[:body]).call

        render json: CreateMembersResultSerializer.new(result).call, status: :ok
      end
    end
  end
end
