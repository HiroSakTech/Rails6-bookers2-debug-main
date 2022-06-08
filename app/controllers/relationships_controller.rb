# frozen_string_literal: true

class RelationshipsController < ApplicationController
  def followers
    follower_users = User.find(params[:user_id]).followers
    @target_users = follower_users.map { |follower_user| User.find(follower_user.followed_id) }
  end

  def followed
    followed_users = User.find(params[:user_id]).followed
    @target_users = followed_users.map { |followed_user| User.find(followed_user.follower_id) }
  end

  def create
    relationship = Relationship.new(follower_id: current_user.id, followed_id: params[:user_id])
    relationship.save
    redirect_to request.referer
  end

  def destroy
    relationship = Relationship.find_by(follower_id: current_user.id, followed_id: params[:user_id])
    relationship.destroy
    redirect_to request.referer
  end
end
