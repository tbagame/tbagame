module Manage
  class InvitesController < Manage::ApplicationController

    def index
      page_info = get_paging_order_info
      @search = Invite.search(params[:q])
      @invites = @search.result(:distinct => true).paginate(page: page_info[:page], per_page: page_info[:limit])
    end

    def new
      @invite = Invite.new
      @team = Team.select('id,name')
    end

    def edit
      @invite = Invite.find(params[:id])
      @team = Team.select('id,name')
    end

    def create
      @invite = Invite.new
      @invite.team_id = params[:team_id]
      @invite.user_id = params[:user_id]
      @invite.invite_type = params[:invite_type]
      @invite.status = params[:status]

      begin
        if @invite.save!
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
      @invite = Invite.find(params[:id])
      @invite.team_id = params[:team_id]
      @invite.user_id = params[:user_id]
      @invite.invite_type = params[:invite_type]
      @invite.status = params[:status]
      begin
        if @invite.save!
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
      @invite = Invite.find(params[:id])
      if @invite.destroy
        flash[:success] = Tips::DELETE_SUCCESS
      else
        flash[:error] = Tips::DELETE_ERROR
      end
      redirect_to action: :index
    end

    def invite_status
      @invite = Invite.find(params[:id])
      if @invite.update_attributes!(:status => params[:status])
        flash[:success] = Tips::DELETE_SUCCESS
      else
        flash[:error] = Tips::DELETE_ERROR
      end
      redirect_to action: :index
    end
  end
end
