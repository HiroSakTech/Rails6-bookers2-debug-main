# frozen_string_literal: true

class NoticesController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @notice = Notice.new
  end

  def create; end
end
