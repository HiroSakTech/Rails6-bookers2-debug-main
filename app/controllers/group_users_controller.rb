# frozen_string_literal: true

class GroupUsersController < ApplicationController
  def create
    group_user = GroupUser.new(group_id: params[:group_id], user_id: current_user.id)
    group_user.save
    redirect_to groups_path
  end

  def destroy
    group_user = GroupUser.find_by(group_id: params[:group_id], user_id: current_user.id)
    group_user.destroy
    redirect_to groups_path
  end
end
