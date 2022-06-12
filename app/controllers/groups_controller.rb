# frozen_string_literal: true

class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.users = [current_user]
    if @group.save
      redirect_to groups_path, notice: 'You have created group successfully.'
    else
      render 'new'
    end
  end

  def index; end

  private

  def group_params
    params.require(:group).permit(:name, :introduction, :group_image).merge(owner_id: current_user.id)
  end
end
