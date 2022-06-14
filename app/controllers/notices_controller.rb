# frozen_string_literal: true

class NoticesController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @notice = Notice.new
  end

  def create
    @group = Group.find(params[:group_id])
    @notice = @group.notices.new(notice_params)
    if @notice.save
      redirect_to group_path(@group.id)
    else
      render 'new'
    end
  end

  private

  def notice_params
    params.require(:notice).permit(:title, :body)
  end
end
