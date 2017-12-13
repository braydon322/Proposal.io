class Proposal < ActiveRecord::Base
  belongs_to :user
  has_many :fees
  has_many :milestones

  def milestones_attributes=(milestones_attributes)
    milestones_attributes.each do |i, milestone_attributes|
      self.milestones.build(milestone_attributes)
    end
    # Create new milestones for this proposal based on the passed in Params
      # :milestones_attributes => [
      #   {:content => "Logo Design/Branding"},
      #   {:pricing_breakdown => "$175"}
      # ]
  end

  def fees_attributes=(fees_attributes)
    fees_attributes.each do |i, fee_attributes|
      self.fees.build(fee_attributes)
    end
    # Create new fees for this proposal based on the passed in Params
      # :fees_attributes => [
      #   {:content => "Logo Design/Branding"},
      #   {:pricing_breakdown => "$175"}
      # ]
  end
end
