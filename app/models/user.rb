class User < ActiveRecord::Base
	attr_accessor :password

  def self.authenticate(email, password)
    u = find(:first, :conditions => ["email = ?", email])
    return nil if u.nil?
    if User.encrypt(password, u.salt) == u.hashed_password
      return u
    end
    nil
  end

  def password=(password)
    @password = password
    if !@password.blank?
      self.salt = User.random_string(10) if !self.salt?
      self.hashed_password = User.encrypt(@password, self.salt)
    end
  end

  private
  	def self.encrypt(password, salt)
	    Digest::SHA1.hexdigest(password+salt)
	  end
 
  def self.random_string(length)
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    newpass = ""
    1.upto(length) { |i| newpass << chars[rand(chars.size-1)]}
    return newpass
  end
end
