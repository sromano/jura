class Formula < ActiveRecord::Base
  validates :name, :text, presence: true
  validates :name, uniqueness: true

  def full_name
    "Fórmula "+name
  end
end
