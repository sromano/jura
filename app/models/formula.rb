# encoding: utf-8
class Formula < ActiveRecord::Base
  validates :name, :text, :code, presence: true
  validates :name, uniqueness: true

  def full_name
    "Fórmula "+name
  end
end
