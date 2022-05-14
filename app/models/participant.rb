class Participant < ApplicationRecord
  belongs_to :step
  belongs_to :user
end
