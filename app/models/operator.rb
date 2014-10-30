class Operator < ActiveRecord::Base
  devise :database_authenticatable, :trackable, :validatable, :registerable
end
