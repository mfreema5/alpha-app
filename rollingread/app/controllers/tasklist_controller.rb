class TasklistController < ApplicationController

  def index
    @assignments = Assignment.order('due_date')
  end

  private


end
