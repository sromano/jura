class Swear < ActiveRecord::Base
  validates :inscription_date, :swear_date, :quota, :used_quota, presence: true
  validates :quota, :used_quota, numericality: { greater_than_or_equal_to: 0 }
  validate :inscription_date_before_swear

  has_many :inscriptions

  scope :default_order, ->{order("swear_date")}
  scope :enabled, ->{where(enabled:true)}
  scope :open, ->{enabled.where("swear_date >= ?",Date.today)}
  scope :available, ->{open.enabled.where("quota > used_quota")}

  def initialize(attributes={})
    super
    self.quota ||= configatron.swear.quota
  end

  def enabled?
    self.enabled && swear_date >= Date.today
  end

  def status
    if enabled?
      free_quota? ? "Abierta" : "Abierta (sin cupo)"
    else
      "Cerrada"
    end
  end

  def free_quota?
    quota > used_quota
  end

  def available?
    enabled? && free_quota?
  end

  def inscription_date_before_swear
    if inscription_date && swear_date && inscription_date >= swear_date
      errors.add(:inscription_date,"tiene que ser anterior a la fecha de jura")
    end
  end
end
