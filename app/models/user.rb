class User

  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :email
  field :encrypted_password
  field :salt
  field :score, type: Integer, default: 0
  field :is_admin, type: Boolean, default: false

  has_many :submits

  def self.encrypt_password(password, salt)
    key = '6bgEVBuWqD'
    Digest::SHA1.hexdigest(salt + password + key)
  end

  def self.authenticate(name, password)
    user = User.where(:name => name).first or return nil
    return nil if encrypt_password(password, user.salt)!=user.encrypted_password
    user
  end

  def solved_time(problem, problem_type)
    submit = submits.where(
        problem_id: problem.id,
        problem_type: problem_type,
        solved: true)
      .asc(:updated_at)
      .first or return nil
    submit.updated_at
  end

  def wrong_count(problem, problem_type)
    submits.where(
        problem_id: problem.id,
        problem_type: problem_type,
        solved: false)
      .count
  end

end
