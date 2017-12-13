class Proposal < ActiveRecord::Base
  belongs_to :user
  has_many :fees
  has_many :milestones
end
