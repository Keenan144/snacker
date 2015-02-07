require 'bcrypt'

class User < ActiveRecord::Base
  has_many :tweets
  has_many :follows, :class_name => "Follow", :foreign_key => "follower_id"
  has_many :users_followed, :through => :follows, :source => :followed
  has_many :followings, :class_name => "Follow", :foreign_key => "followed_id"
  has_many :users_following, :through => :followings, :source => :follower

validates :handle, presence: true
validates :handle, uniqueness: true
validates :handle, format: { with: /\A[a-z0-9_-]{3,20}\z/}
validates :name, presence: true


include BCrypt
  def password
    @password || Password.new(password_hash)
  end

  def password=( new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(password)
    self.password == password
  end

end
