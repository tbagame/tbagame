module Manage
  class AccountsController < Manage::ApplicationController

    layout 'fancybox'

    before_filter :user_info

    def user_info
      @user = User.find(params[:user_id])
    end

    def index
      page_info = get_paging_order_info
      @search = Account.where(:owner_id => params[:user_id]).search(params[:q])
      @accounts = @search.result(:distinct => true).paginate(page: page_info[:page], per_page: page_info[:limit])
    end

    def new
      @account = Account.new
    end

    def edit
      @account = Account.find(params[:id])
    end

    def create
      @account = Account.new
      @account.password = params[:password]
      @account.name = params[:name]
      @account.owner = @user
      begin
        if @account.save!
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
      @account = Account.find(params[:id])
      @account.password = params[:password]
      @account.name = params[:name]
      begin
        if @account.save!
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
      @account = Account.find(params[:id])
      if @account.destroy
        flash[:success] = Tips::DELETE_SUCCESS
      else
        flash[:error] = Tips::DELETE_ERROR
      end
      redirect_to action: :index
    end
  end
end
