class InvitationsController < ApplicationController
  after_filter :invite

  def create
    render :nothing => true
  end

  private

  def invite
    InvitationMailer.invite(params[:email], current_user).deliver if current_user.coach?
  end
end
