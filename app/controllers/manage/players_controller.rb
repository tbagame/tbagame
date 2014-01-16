module Manage
  class PlayersController < ApplicationController

    def index
      page_info = get_paging_order_info
      @search = Player.search(params[:q])
      @players = @search.result(:distinct => true).paginate(page: page_info[:page], per_page: page_info[:limit])
    end

    def new
      @player = Player.new
      @team = Team.select('id,name')
    end

    def edit
      @player = Player.find(params[:id])
      @team = Team.select('id,name')
    end

    def create
      @player = Player.new
      @player.description = params[:description]
      @player.name = params[:name]
      @player.height = params[:height]
      @player.weight = params[:weight]
      @player.alias = params[:alias]
      @player.birthday = params[:birthday]
      @player.ball_age = params[:ball_age]
      @player.position = params[:position]
      @player.number = params[:number]
      @player.team_id = params[:team_id]
      @player.user_id = params[:user_id]
      @player.status = params[:status]

      begin
        if @player.save!
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
      @player = Player.find(params[:id])
      @player.description = params[:description]
      @player.name = params[:name]
      @player.height = params[:height]
      @player.weight = params[:weight]
      @player.alias = params[:alias]
      @player.birthday = params[:birthday]
      @player.ball_age = params[:ball_age]
      @player.position = params[:position]
      @player.number = params[:number]
      @player.team_id = params[:team_id]
      @player.user_id = params[:user_id]
      @player.status = params[:status]
      begin
        if @player.save!
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
      @player = Player.find(params[:id])
      if @player.destroy
        flash[:success] = Tips::DELETE_SUCCESS
      else
        flash[:error] = Tips::DELETE_ERROR
      end
      redirect_to action: :index
    end
  end
end
