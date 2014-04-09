module Center
  class ChallengesController < Center::ApplicationController
    def index
      page_info = get_paging_order_info
      @search = Challenge.where(:team_id => current_user.team.id).search(params[:q])
      @challenges = @search.result(:distinct => true).paginate(page: page_info[:page], per_page: page_info[:limit])
    end

    def join
      page_info = get_paging_order_info
      @search = Challenge.joins(:challenge_replies).where('challenge_replies.team_id' => current_user.team.id).search(params[:q])
      @challenges = @search.result(:distinct => true).paginate(page: page_info[:page], per_page: page_info[:limit])
    end

    def new
      @challenge = Challenge.new
    end

    def create

    end

    def edit

    end

    def update

    end

    def destroy

    end

  end
end