require 'dm-core'
require 'dm-validations'
require 'dm-timestamps'
require 'dm-migrations'
require './helpers/helpers'


DataMapper.setup(:default, "sqlite://#{Dir.pwd}/db/user.db")

class User
  include DataMapper::Resource

  property(:id,               Serial)

  property(:user_name,        String, key: true, length: (3..40), required: true)

  property(:img_url,          String)

  property(:email,            String)

  property(:password,         String)
  property(:salt,             String)
  property(:hashed_password,  String)

  property(:created_at,       DateTime, default: DateTime.now)
  property(:upadted_at,       DateTime)


  def username= new_username
    @username = new_username.downcase
  end

  def password=(pass)
    @password = pass
    self.salt = random_string(10) unless self.salt
    self.hashed_password = User.encrypt(@password, self.salt)
  end

  def self.encrypt(pass, salt)
    Digest::SHA1.hexdigest(pass + salt)
  end
  
  def self.authenticate(login, pass)
    u = User.first(user_name: login)
    return nil if u.nil?
    return u if User.encrypt(pass, u.salt) == u.hashed_password
    nil
  end

  def random_string(len)
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    str = ""
    1.upto(len) { |i| str << chars[rand(chars.size-1)] }
    return str
  end

end

def get_day(record)
  record.created_at.asctime.slice(0..3)
end

def get_month(creation_date)
  record.created_at.asctime.slice(4..6)
end

DataMapper.auto_upgrade!