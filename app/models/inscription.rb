class Inscription < ActiveRecord::Base
  belongs_to :swear
  belongs_to :formula
  belongs_to :graduate, -> { unscope(where: :deleted_at) }

  validates :order, :swear, :formula_id, :formula, :graduate, presence: true
  validates :order, :graduate_id, uniqueness: {scope: :swear_id }

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, allow_nil:true}

  before_validation :set_order

  def expired?
    swear.swear_date < Date.today
  end

  def set_order
    self.order = Inscription.connection.select_value("SELECT MAX(`inscriptions`.`order`) AS max_id FROM `inscriptions`  WHERE `inscriptions`.`swear_id` = #{self.swear_id} FOR UPDATE").to_i
    self.order += 1
    if self.order <= self.swear.quota
      self.swear.update_attribute(:used_quota,self.order)
    else
      return false
    end
  end
end
