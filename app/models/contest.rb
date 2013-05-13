class Contest

  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :introduction
  field :start_time, type: Time
  field :end_time, type: Time

  has_many :problems
  has_many :attendances

  def self.active
    now = Time.now
    self.where(:start_time.lte => now, :end_time.gte => now)
  end

  def self.visible
    self.where(:start_time.lte => Time.now)
  end

  def started?
    start_time <= Time.now
  end

  def ended?
    end_time < Time.now
  end

end
