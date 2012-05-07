class User

  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :email
  field :encrypted_password
  field :salt

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

  def solved_time(problem)
    submit = submits.where(:problem_id => problem.id).where(:solved => true).first or return nil
    submit.created_at
  end

  def wrong_count(problem)
    time = solved_time(problem)
    target = time ? submits.where(:created_at.lt => time) : submits
    target.count
  end

end

