require 'swagger_helper'

RSpec.describe 'api/v1/users', type: :request do
  path '/api/v1/users/{id}/upload_avatar' do
    post 'Upload a user avatar' do
      tags 'Users'
      consumes 'multipart/form-data'
      produces 'application/json'

      parameter name: :id, in: :path, type: :integer, required: true, description: 'User ID'

      parameter name: :user, in: :formData, schema: {
        type: :object,
        properties: {
          avatar: { type: :string, format: :binary, description: 'Avatar image file' }
        },
        required: ['avatar']
      }

      response '200', 'Avatar upload successfully' do
        let(:user) { User.create!(name: 'John Doe', email: 'john@example.com') }
        let(:id) { user.id }
        let(:user) { { avatar: fixture_file_upload(Rails.root.join('spec/fixtures/files/sample_avatar.png'), 'image/png') } }

        run_test!
      end

      response '404', 'User not found' do
        let(:id) { 999 }
        let(:user) { { avatar: fixture_file_upload(Rails.root.join('spec/fixtures/files/sample_avatar.png'), 'image/png') } }

        run_test!
      end

      response '422', 'Avatar file is missing' do
        let(:user) { User.create!(name: 'John Doe', email: 'john@example.com') }
        let(:id) { user.id }
        let(:user) { {} } # Simulate missing file

        run_test!
      end
    end
  end
end