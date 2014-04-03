module Manage
  class ChallengesController < Manage::ApplicationController

    def index
      page_info = get_paging_order_info
      @search = Challenge.search(params[:q])
      @challenges = @search.result(:distinct => true).paginate(page: page_info[:page], per_page: page_info[:limit])
    end

    def new
      @challenge = Challenge.new
    end

    def edit
      @challenge = Challenge.find(params[:id])
    end

    def create
      @challenge = Challenge.new
      @challenge.name = params[:name]
      @challenge.team_id = params[:team_id]
      @challenge.status = params[:status]
      @challenge.start_time = params[:start_time]
      @challenge.end_time = params[:end_time]
      @challenge.place_id = params[:place_id]
      @challenge.challenge_date = params[:challenge_date]
      @challenge.description = params[:description]
      begin
        if @challenge.save!
          flash[:success] = Tips::CREATE_SUCCESS
          redirect_to action: :index
        else
          flash[:error] = Tips::CREATE_ERROR
          redirect_to action: :new
        end
      rescue StandardError => e
        flash[:error] = e.message
        redirect_to action: :new
      end
    end

    def update
      @challenge = Challenge.find(params[:id])
      @challenge.name = params[:name]
      @challenge.team_id = params[:team_id]
      @challenge.status = params[:status]
      @challenge.start_time = params[:start_time]
      @challenge.end_time = params[:end_time]
      @challenge.place_id = params[:place_id]
      @challenge.challenge_date = params[:challenge_date]
      @challenge.description = params[:description]
      begin
        if @challenge.save!
          flash[:success] = Tips::UPDATE_SUCCESS
          redirect_to action: :index
        else
          flash[:error] = Tips::UPDATE_ERROR
          redirect_to action: :edit
        end
      rescue StandardError => e
        flash[:error] = e.message
        redirect_to action: :edit
      end
    end

    def destroy
      @challenge = Challenge.find(params[:id])
      if @challenge.destroy
        flash[:success] = Tips::DELETE_SUCCESS
      else
        flash[:error] = Tips::DELETE_ERROR
      end
      redirect_to action: :index
    end

  end
end
