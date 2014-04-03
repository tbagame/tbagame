module Manage
  class PlayStatusesController < Manage::ApplicationController

    def index
      page_info = get_paging_order_info
      @search = PlayStatus.search(params[:q])
      @play_statuses = @search.result(:distinct => true).paginate(page: page_info[:page], per_page: page_info[:limit])
    end

    def new
      @play_status = PlayStatus.new
    end

    def edit
      @play_status = PlayStatus.find(params[:id])
    end

    def create
      @play_status = PlayStatus.new
      @play_status.week_day = params[:week_day]
      @play_status.start_time = params[:start_time]
      @play_status.end_time = params[:end_time]
      @play_status.own = User.find(params[:user_id])
      @play_status.status = params[:status]
      begin
        if @play_status.save!
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
      @play_status = PlayStatus.find(params[:id])
      @play_status.week_day = params[:week_day]
      @play_status.start_time = params[:start_time]
      @play_status.end_time = params[:end_time]
      @play_status.own = User.find(params[:user_id])
      @play_status.status = params[:status]
      begin
        if @play_status.save!
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
      @play_status = PlayStatus.find(params[:id])
      if @play_status.destroy
        flash[:success] = Tips::DELETE_SUCCESS
      else
        flash[:error] = Tips::DELETE_ERROR
      end
      redirect_to action: :index
    end

  end
end
