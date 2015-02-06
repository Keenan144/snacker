require 'bcrypt'

class User < ActiveRecord::Base
  has_many :tweets

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
