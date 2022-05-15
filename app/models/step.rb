class Step < ApplicationRecord
  belongs_to :route
  belongs_to :users
end
