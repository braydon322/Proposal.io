class ProposalsController < ApplicationController
  def new
    @proposal = Proposal.new
    @proposal.milestones.build
    @proposal.fees.build
  end

  def create
    @proposal = Proposal.new(proposal_params)
    if @proposal.save
      redirect_to @proposal
    else
      render :new
    end
  end

  def show
    @proposal = Proposal.find(params[:id])
  end

  private
  def proposal_params
    params.require(:proposal).permit(:email, :title, :budget, :why_me, :milestones_attributes => [:content, :due_date], :fees_attributes => [:content, :pricing_breakdown])
  end
end
