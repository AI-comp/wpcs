class User

  include Mongoid::Document
  include Mongoid::Timestamps

  field :provider
  field :uid
  field :name # display name
  field :encrypted_password
  field :salt
  field :is_admin, type: Boolean, default: true

  validates_uniqueness_of :uid, :scope => :provider, :message => 'was already used'

  has_many :scores

  def self.encrypt_password(password, salt)
    key = '6bgEVBuWqD'
    Digest::SHA1.hexdigest(salt + password + key)
  end

  def self.authenticate(name, password)
    user = User.where(:name => name).first or return nil
    return nil if encrypt_password(password, user.salt)!=user.encrypted_password
    user
  end

  def self.find_or_create_from_auth_hash(auth_hash)
    provider, uid = auth_hash['provider'], auth_hash['uid']
    user = User.find_or_create_by(
      :provider => provider,
      :uid => uid
    )
    user.name = auth_hash['info']['name'].presence or uid
    user.save
    user
  end

end
