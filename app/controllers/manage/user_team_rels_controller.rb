module Manage
  class UserTeamRelsController < ApplicationController

    layout 'fancybox'

    def index
      page_info = get_paging_order_info
      @search = UserTeamRel.search(params[:q])
      @user_team_rels = @search.result(:distinct => true).paginate(page: page_info[:page], per_page: page_info[:limit])
    end

    def new
      @user = User.find(params[:user_id])
      @user_team_rel = UserTeamRel.new
    end

    def edit
      @user_team_rel = UserTeamRel.find(params[:id])
    end

    def create
      @user_team_rel = UserTeamRel.new
      @user_team_rel.user_id = params[:user_id]
      @user_team_rel.part = params[:part]
      begin
        if @user_team_rel.save!
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
      @user = User.find(params[:id])
      @user.nickname = params[:nickname]
      @user.name = params[:name]
      @user.qq = params[:qq]
      @user.tel = params[:tel]
      @user.address = params[:address]
      @user.status = params[:status]
      begin
        if @user.save!
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
      @user = User.find(params[:id])
      if @user.destroy
        flash[:success] = Tips::DELETE_SUCCESS
      else
        flash[:error] = Tips::DELETE_ERROR
      end
      redirect_to action: :index
    end
  end
end
