module Manage
  class TeamsController < ApplicationController

    def index
      page_info = get_paging_order_info
      @search = Team.search(params[:q])
      @teams = @search.result(:distinct => true).paginate(page: page_info[:page], per_page: page_info[:limit])
    end

    def new
      @team = Team.new
    end

    def edit
      @team = Team.find(params[:id])
    end

    def create
      @team = Team.new
      @team.description = params[:description]
      @team.name = params[:name]
      @team.notice = params[:notice]
      @team.power = params[:power]
      @team.declarater = params[:declarater]
      @team.region = params[:region]
      @team.area = params[:area]
      @team.level = params[:level]
      @team.status = params[:status]

      begin
        if @team.save!
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
      @team = Team.find(params[:id])
      @team.description = params[:description]
      @team.name = params[:name]
      @team.notice = params[:notice]
      @team.power = params[:power]
      @team.declarater = params[:declarater]
      @team.region = params[:region]
      @team.area = params[:area]
      @team.level = params[:level]
      @team.status = params[:status]
      begin
        if @team.save!
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
      @team = Team.find(params[:id])
      if @team.destroy
        flash[:success] = Tips::DELETE_SUCCESS
      else
        flash[:error] = Tips::DELETE_ERROR
      end
      redirect_to action: :index
    end
  end
end
