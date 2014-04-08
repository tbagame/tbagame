class ChallengeRepliesController < ApplicationController

  def index
    page_info = get_paging_order_info
    @search = ChallengeReply.search(params[:q])
    @replies = @search.result(:distinct => true).paginate(page: page_info[:page], per_page: page_info[:limit])
  end

end