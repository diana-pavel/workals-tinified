class Company < ApplicationRecord
  has_many :users
  belongs_to :admin
  # before - sign in user, except [index, view]
end
