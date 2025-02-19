require 'swagger_helper'

RSpec.describe 'api/v1/avatars', type: :request do
  path '/api/v1/avatars' do
    post 'Generate an avatar' do
      tags 'Avatars'
      consumes 'application/json'
      parameter name: :user_id, in: :query, type: :integer, required: true, description: 'User ID'

      response '202', 'Avatar generation started' do
        let(:user) { User.create!(name: 'John Doe') }
        let(:user_id) { user.id }
        run_test!
      end

      response '404', 'User not found' do
        let(:user_id) { 999 }
        run_test!
      end
    end
  end
end
