class User

  include Mongoid::Document
  include Mongoid::Timestamps

  field :provider
  field :uid
  field :name # display name
  field :email
  field :encrypted_password
  field :salt
  field :is_admin, type: Boolean, default: true

  validates_uniqueness_of :uid, :scope => :provider, :message => 'was already used'

  belongs_to :group
  has_many :scores

  after_create :join_default_group

  def self.encrypt_password(password, salt)
    key = '6bgEVBuWqD'
    Digest::SHA1.hexdigest(salt + password + key)
  end

  def self.authenticate(uid, password)
    user = User.where(provider: "WPCS", uid: uid).first or return nil
    return nil if encrypt_password(password, user.salt)!=user.encrypted_password
    user
  end

  def self.find_or_create_from_auth_hash(auth_hash)
    provider, uid = auth_hash['provider'], auth_hash['uid']
    user = User.where(provider: provider, uid: uid).first
    if user.nil?
      user = User.new(provider: provider,
                      uid: uid,
                      name: (auth_hash['info']['name'].presence or uid))
      user.save
    end
    user
  end

  private
  def join_default_group
    default_group = Group.where(name: "").first
    default_group.users.push(self)
    default_group.save
  end

end
