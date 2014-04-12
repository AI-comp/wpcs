class Contest < ActiveRecord::Base

  attr_accessible :name,
    :introduction,
    :start_time,
    :end_time

  has_many :problems
  has_many :attendances

  def self.active
    now = Time.now
    self.where("start_time <= ? AND end_time >= ?", now, now)
  end

  def self.visible
    self.where("start_time <= ?", Time.now)
  end

  def started?
    start_time <= Time.now
  end

  def ended?
    end_time < Time.now
  end

end
