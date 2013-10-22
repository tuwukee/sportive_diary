class InvitationsController < ApplicationController
  include CoachesHelper
  after_filter :invite
  before_filter :coach_required

  def create
    render :nothing => true
  end

  private

  def invite
    InvitationMailer.invite(params[:email], current_user).deliver
  end
end
