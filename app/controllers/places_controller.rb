class PlacesController < ApplicationController
  def places_json
    unless params[:name].blank?
      @places = Place.where('name like ?', "%#{params[:name]}%")
      respond_to do |format|
        format.json do
          @places = @places.select('id,name').order('LENGTH( name )').limit(30)
        end
      end
    end
  end
end