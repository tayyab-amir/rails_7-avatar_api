require 'swagger_helper'

RSpec.describe 'api/v1/users', type: :request do
  path '/api/v1/users' do
    post 'Create a new user' do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string, example: 'John Doe' },
          email: { type: :string, example: 'john@example.com' }
        },
        required: ['name', 'email']
      }

      response '201', 'User created successfully' do
        let(:user) { { name: 'John Doe', email: 'john@example.com' } }
        run_test!
      end

      response '422', 'Invalid request' do
        let(:user) { { name: '' } } # Missing email
        run_test!
      end
    end
  end

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