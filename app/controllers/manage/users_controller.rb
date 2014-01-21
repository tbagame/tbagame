module Manage
  class UsersController < Manage::ApplicationController

    #layout 'fancybox' ,:only => [:pwd,:reset_password]
    def index
      page_info = get_paging_order_info
      @search = User.search(params[:q])
      @users = @search.result(:distinct => true).paginate(page: page_info[:page], per_page: page_info[:limit])
    end

    def new
      @user = User.new
      @team = Team.select('id,name')
    end

    def edit
      @user = User.find(params[:id])
      @team = Team.select('id,name')
    end

    def create
      @user = User.new
      @user.nickname = params[:nickname]
      @user.name = params[:name]
      @user.team_id = params[:team_id]
      @user.qq = params[:qq]
      @user.tel = params[:tel]
      @user.email = params[:email]
      @user.address = params[:address]
      @user.status = params[:status]

      begin
        if @user.save!
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
      @user.team_id = params[:team_id]
      @user.qq = params[:qq]
      @user.tel = params[:tel]
      @user.address = params[:address]
      @user.status = params[:status]
      @user.email = params[:email]
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

    def users_json
      @users = User.where('nickname like ?', "%#{params[:nickname]}%") unless params[:nickname].blank?
      respond_to do |format|
        format.json do
          @users = @users.select('id,nickname').order('LENGTH( nickname )').limit(30)
        end
      end
    end
  end
end
