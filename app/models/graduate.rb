class Graduate < ActiveRecord::Base
  serialize :career_ids, Array

  validates :first_name, :last_name, :dni, :career_ids, presence: true
  validate :at_least_one_career
  #Los DNIs con menos números vienen con 0
  validates :dni, length: { in: 8..10 }, uniqueness_without_deleted: true
  has_one :inscription

  scope :not_deleted, ->{where(deleted_at:nil)}
  scope :with_dni, ->(dni){where(dni:fix_dni(dni))}
  def careers
    Career.find_by_ids(career_ids)
  end

  private
  def at_least_one_career
    errors.add(:career_ids,"tiene que tener al menos una carrera") if careers.empty?
  end

  def self.fix_dni(dni)
    dni.to_s.rjust(8,'0')
  end
end
