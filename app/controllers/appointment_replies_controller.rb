class AppointmentRepliesController < ApplicationController

  def index
    page_info = get_paging_order_info
    @search = AppointmentReply.search(params[:q])
    @appointments = @search.result(:distinct => true).paginate(page: page_info[:page], per_page: page_info[:limit])
  end

end