class Career < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true
  after_save :clean_careers_cache

  #We keep them all in memory to not query it every time
  def self.all(force_reload=false)
    @@careers = nil if force_reload
    @@careers ||= super()
  end

  def self.find_by_ids(career_ids)
    all.select{|c| career_ids.include?(c.id)}
  end

  def self.find_or_create_by_name(name)
    name = name.to_s.strip
    career = all.find{|c| c.name.strip == name}
    career || Career.create(name: name)
  end

  private

  def clean_careers_cache
    @@careers = nil
  end

end
