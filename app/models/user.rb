class User

  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :email
  field :encrypted_password
  field :salt
  field :is_admin, type: Boolean, default: false

  embeds_many :scores

  def self.encrypt_password(password, salt)
    key = '6bgEVBuWqD'
    Digest::SHA1.hexdigest(salt + password + key)
  end

  def self.authenticate(name, password)
    user = User.where(:name => name).first or return nil
    return nil if encrypt_password(password, user.salt)!=user.encrypted_password
    user
  end

end
