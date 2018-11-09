class Company < ApplicationRecord
  has_many :staffs
  accepts_nested_attributes_for :staffs
end
