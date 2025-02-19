class Api::V1::UsersController < ApplicationController
  def create
    @user = User.create!(user_params)
    render json: { user: @user, message: 'User created successfully' }, status: :created
  end

  def upload_avatar
    @user = User.find(params[:id])
    base64_avatar = Base64.encode64(params[:avatar].read)
    AvatarWorkerJob.perform_async(@user.id, base64_avatar)
    render json: { message: 'Avatar upload successfully' }
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
