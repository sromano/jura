class Graduate < ActiveRecord::Base
  acts_as_paranoid
  serialize :career_ids, Array

  validates :first_name, :last_name, :dni, :career_ids, presence: true
  validate :at_least_one_career
  #Los DNIs con menos números vienen con 0
  validates :dni, length: { is: 8 }, uniqueness_without_deleted: true
  has_many :inscriptions

  def careers
    Career.find_by_ids(career_ids)
  end

  private
  def at_least_one_career
    errors.add(:career_ids,"tiene que tener al menos una carrera") if careers.empty?
  end
end
