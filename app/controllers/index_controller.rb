class IndexController < ApplicationController

  def index
    current_user

    @challenges = Challenge.limit(4)
    @teams = Team.limit(6)
    @appointments = Appointment.limit(6)
  end
end
