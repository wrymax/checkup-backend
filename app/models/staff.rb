class Staff < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_many :questionnaires
end
