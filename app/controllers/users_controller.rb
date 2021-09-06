class UsersController < ApplicationController
  require 'csv'
  def home; end

  def import
    @results = []
    CSV.foreach(params[:file], headers: true) do |row|
      user = User.create(row.to_h)
      @results.push(user.errors.present? ? user.errors.full_messages.join(', ') : "#{user.name} was successfully saved")
    end

    respond_to do |format|
      format.js
    end
  end
end
