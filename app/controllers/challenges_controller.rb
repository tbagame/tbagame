class ChallengesController < ApplicationController

  def index
    page_info = get_paging_order_info
    @search = Challenge.search(params[:q])
    #params[:q][:challenge_date_gteq] = datetime_value params[:q][:challenge_date_gteq]
    #params[:q][:challenge_date_lteq] = datetime_value params[:q][:challenge_date_lteq]
    @challenges = @search.result(:distinct => true).paginate(page: page_info[:page], per_page: page_info[:limit])
  end


end