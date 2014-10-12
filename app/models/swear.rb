class Swear < ActiveRecord::Base
  validates :inscription_date, :swear_date, :quota, :used_quota, presence: true
  validates :quota, :used_quota, numericality: { greater_than_or_equal_to: 0 }
  validate :inscription_date_before_swear

  has_many :inscriptions

  scope :open, ->{where("swear_date >= ?",Date.today)}
  scope :available, ->{open.where(enabled:true).where("quota > used_quota")}

  def initialize(attributes={})
    super
    self.quota ||= configatron.swear.quota
  end

  def enabled?
    self.enabled && swear_date >= Date.today
  end

  def available?
    enabled? && quota > used_quota
  end

  def inscription_date_before_swear
    if inscription_date && swear_date && inscription_date >= swear_date
      errors.add(:inscription_date,"tiene que ser anterior a la fecha de jura")
    end
  end
end
