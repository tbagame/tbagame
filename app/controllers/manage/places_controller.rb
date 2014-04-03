module Manage
  class PlacesController < Manage::ApplicationController

    def index
      page_info = get_paging_order_info
      @search = Place.search(params[:q])
      @places = @search.result(:distinct => true).paginate(page: page_info[:page], per_page: page_info[:limit])
    end

    def new
      @places = Place.new
    end

    def edit
      @place = Place.find(params[:id])
    end

    def create
      @place = Place.new
      @place.name = params[:name]
      @place.address = params[:address]
      @place.status = params[:status]
      @place.business_time = params[:business_time]
      @place.gps_x = params[:gps_x]
      @place.gps_y = params[:gps_y]
      @place.geohash = params[:geohash]
      @place.average_price = params[:average_price]
      @place.basketry = params[:basketry]
      @place.transport_info = params[:transport_info]
      @place.telephone = params[:telephone]
      @place.description = params[:description]
      @place.province = params[:province]
      @place.city = params[:city]
      @place.region = params[:region]
      @place.area_code = params[:area_code]

      begin
        if @place.save!
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
      @place = Place.find(params[:id])
      @place.name = params[:name]
      @place.address = params[:address]
      @place.status = params[:status]
      @place.business_time = params[:business_time]
      @place.gps_x = params[:gps_x]
      @place.gps_y = params[:gps_y]
      @place.geohash = params[:geohash]
      @place.average_price = params[:average_price]
      @place.basketry = params[:basketry]
      @place.transport_info = params[:transport_info]
      @place.telephone = params[:telephone]
      @place.description = params[:description]
      @place.province = params[:province]
      @place.city = params[:city]
      @place.region = params[:region]
      @place.area_code = params[:area_code]
      begin
        if @place.save!
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
      @place = Place.find(params[:id])
      if @place.destroy
        flash[:success] = Tips::DELETE_SUCCESS
      else
        flash[:error] = Tips::DELETE_ERROR
      end
      redirect_to action: :index
    end

    def places_json
      @places = Place.where('name like ?', "%#{params[:name]}%") unless params[:name].blank?
      respond_to do |format|
        format.json do
          @places = @places.select('id,name').order('LENGTH( nickname )').limit(30)
        end
      end
    end
  end
end
