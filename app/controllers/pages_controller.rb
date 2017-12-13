class PagesController < ApplicationController
  def index
    signed_in?
  end

  def company
    signed_in?
  end

  def creative
    signed_in?
  end

  def sign
  end

  def companydash
    @email = current_user.email
    @id = current_user.id
    @proposals = Proposal.where(:email => @email)
  end

  def creativedash
    @proposals = current_admin.proposals
  end



  private

  def signed_in?
    if user_signed_in?
      redirect_to cmpny_path
      flash[:notice] = "Welcome #{current_user.email}. Thanks for logging in."
    elsif admin_signed_in?
      redirect_to crtv_path
      flash[:notice] = "Welcome #{current_admin.email}. Thanks for logging in."
    end
  end
end
