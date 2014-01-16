module Manage
  class MessagesController < Manage::ApplicationController

    def index
      page_info = get_paging_order_info
      @search = MessageExpand.search(params[:q])
      @message_expands = @search.result(:distinct => true).paginate(page: page_info[:page], per_page: page_info[:limit])
    end

    def new
    end

    def create
      from = 0
      tos = []
      message_type = params[:message_type]
      if (Message::PRIVATE == message_type)
        tos = [2]
      elsif (Message::PUBLIC == message_type)
        users = User.where('id > 0').select(:id).to_a
        users.each{|u|tos.push u.id}
      end

      begin
        if Message.create_message!(params[:title], params[:content], params[:message_type], params[:pid], from, tos)
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

    def destroy
      @message_expand = MessageExpand.find(params[:id])
      if @message_expand.destroy
        flash[:success] = Tips::DELETE_SUCCESS
      else
        flash[:error] = Tips::DELETE_ERROR
      end
      redirect_to action: :index
    end
  end
end
