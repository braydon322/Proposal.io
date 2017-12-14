class ProposalsController < ApplicationController
  def new
    if admin_signed_in?
      @proposal = Proposal.new
      @proposal.milestones.build
      @proposal.fees.build
    else
      redirect_to root_path
      flash[:notice] = "You have to be logged in as a Freelancer to do create a Proposal."
    end
  end

  def create
    if User.find_by(:email => params[:proposal][:email])
      @user = User.find_by(:email => params[:proposal][:email])
      if current_admin.users.include?(@user)
        @user = current_admin.users.find_by(:email => params[:proposal][:email])
        @proposal = @user.proposals.create(proposal_params)
      else
        @user.admin = current_admin
      end
        # current_admin.users << @user
      redirect_to crtv_path
    else
      @user = current_admin.users.create(:email => params[:proposal][:email], :password => "Password123", :password_confirmation => "Password123", :admin_id => current_admin.id)
      @proposal = @user.proposals.create(proposal_params)
      redirect_to crtv_path
    end
  end

  def show
    @proposal = Proposal.find(params[:id])
    if current_admin
      @proposals = current_admin.proposals
    else
      @proposals = current_user.proposals
    end
  end

  def destroy
    @proposal = Proposal.find_by(:id => params[:id])
    @proposal.destroy
    redirect_to crtv_path
  end

  private
  def proposal_params
    params.require(:proposal).permit(:user_id, :email, :title, :budget, :why_me, :milestones_attributes => [:content, :due_date], :fees_attributes => [:content, :price_breakdown])
  end
end
