class Proposal < ActiveRecord::Base
  belongs_to :user
  has_many :fees
  has_many :milestones


  def self.mine(proposals)
    proposals
  end

  def self.price_up(proposals)
    proposals.order(budget: :asc)
  end

  def self.price_down(proposals)
    proposals.order(budget: :desc)
  end

  def self.date_up(proposals)
    proposals.order(created_at: :asc)
  end

  def self.date_down(proposals)
    proposals.order(created_at: :desc)
  end

  def self.signed(proposals)
    proposals.where(:proposal_accepted => true)
  end

  def self.unsigned(proposals)
    proposals.where(:proposal_accepted => !true)
  end


  def milestones_attributes=(milestones_attributes)
    milestones_attributes.each do |i, milestone_attributes|
      begin
        if Milestone.find(milestone_attributes[:id].to_i)
          @milestone = Milestone.find(milestone_attributes[:id].to_i)
          @milestone.content = milestone_attributes[:content]
          @milestone.due_date = milestone_attributes[:due_date]
          @milestone.save
        else
          self.milestones.build(milestone_attributes)
        end
      rescue
          self.milestones.build(milestone_attributes)
      end
    end
  end

  def fees_attributes=(fees_attributes)
    fees_attributes.each do |i, fee_attributes|
      begin
        if Milestone.find(fee_attributes[:id].to_i)
          @fee = Fee.find(fee_attributes[:id].to_i)
          @fee.content = fee_attributes[:content]
          @fee.price_breakdown = fee_attributes[:price_breakdown]
          @fee.save
        else
          self.fees.build(fee_attributes)
        end
      rescue
        self.fees.build(fee_attributes)
      end
    end
  end
end
