class PagesController < ApplicationController
  def resume
  end

  def feeds
  end
  
  def goals
    @goals = Goal.all
  end
end
