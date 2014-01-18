class ApiController < ApplicationController
  before_filter :authenticate, :except => [:week_stats]

  def week_stats
    weeks = {}
    (1..Course.current.current_week).each do |w|
      weeks[w] = Course.current.week_statistics.find_by(week:w).times.map{ |v| v||0 }
    end

    render json: weeks
  end
end