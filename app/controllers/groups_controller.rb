# frozen_string_literal: true

class GroupsController < ApplicationController
  def index
    @groups = Group.all
    @book = Book.new
  end

  def show
    @group = Group.find(params[:id])
    @book = Book.new
  end

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

  def edit
    @group = Group.find(params[:id])
    redirect_to groups_path unless @group.owner_id == current_user.id
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to groups_path, notice: 'You have updated group successfully.'
    else
      render 'edit'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :introduction, :group_image).merge(owner_id: current_user.id)
  end
end
