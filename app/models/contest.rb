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

  # returns: table[group_id][problem_id][type] => submission
  def all_submissions_table(include_admin = false)
    groups = include_admin ? Group.all : Group.all.reject(&:include_admin?)

    attendance_ids = []
    gid_from_aid = {}
    groups.each do |g|
      atts = Attendance.where(user_id: g.user_ids).select(:id)
      attendance_ids += atts.map { |a| a.id }
      atts.each { |a| gid_from_aid[a.id] = g.id }
    end

    submissions = Submission.where(
      problem_id: problem_ids,
      solved: true,
      attendance_id: attendance_ids
    )

    submissions_table = {}
    submissions.each do |s|
      gid = gid_from_aid[s.attendance_id]
      pid = s.problem_id
      type = s.problem_type
      submissions_table[gid] ||= {}
      submissions_table[gid][pid] ||= {}
      submissions_table[gid][pid][type] = s
    end

    submissions_table
  end

end
