class User

  include Mongoid::Document
  include Mongoid::Timestamps

  field :provider
  field :uid
  field :name # display name
  field :email
  field :encrypted_password
  field :salt
  field :is_admin, type: Boolean, default: false

  validates_uniqueness_of :uid, :scope => :provider, :message => 'was already used'

  belongs_to :group
  has_many :attendances

  after_create :join_default_group

  def self.encrypt_password(password, salt)
    key = '6bgEVBuWqD'
    Digest::SHA1.hexdigest(salt + password + key)
  end

  def self.authenticate(uid, password)
    user = User.where(provider: 'WPCS', uid: uid).first or return nil
    return nil if encrypt_password(password, user.salt)!=user.encrypted_password
    user
  end

  def self.new_with_password(params, raw_password)
    user = User.new(params)
    salt = self.generate_random_token(10)
    encrypted_password = self.encrypt_password(raw_password, salt)

    user.salt = salt
    user.encrypted_password = encrypted_password
    user.provider = 'WPCS'
    user.name ||= user.uid
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

  def attended?(contest)
    attendance_for(contest).present?
  end

  def attend(contest)
    Attendance.create(user: self, contest: contest)
  end

  def attendance_for(contest)
    attendances.where(contest_id: contest.id).first
  end

  def correct_submission_for(problem, problem_type)
    attendance_for(problem.contest).try {|a| a.correct_submission_for(problem, problem_type) }
  end

  def solved?(problem, problem_type)
    correct_submission_for(problem, problem_type).present?
  end

  private
  def self.generate_random_token(length=10)
    [*'a'..'z', *'A'..'Z', *'0'..'9'].sample(length).join
  end

  def join_default_group
    default_group = Group.default
    default_group.users.push(self)
    default_group.save
  end

end
