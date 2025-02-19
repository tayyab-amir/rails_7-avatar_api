class AvatarWorkerJob
  include Sidekiq::Worker
  
  def perform(user_id, avatar_data)
    user = User.find(user_id)
    user.avatar.attach(io: StringIO.new(Base64.decode64(avatar_data)), filename: 'avatar.jpg', content_type: 'image/jpeg')
  end
end
