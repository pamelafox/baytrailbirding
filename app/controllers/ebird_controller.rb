require 'net/http'
require 'json'
include ActionView::Helpers::NumberHelper
include EbirdHelper

class EbirdController < ApplicationController
  def birds
    lat = params[:lat].to_f
    lng = params[:lng].to_f
    radius = (params[:radius] || 50).to_i
    birds = getBirdData(lat, lng, radius);
    render :json => birds
  end
  def bird
    sci = params[:sci]
    com = params[:com]
    img = getImageSrc(com, sci)
    render :json => {
      :img => img
    }  
  end
  def hotspots
    lat = params[:lat].to_f
    lng = params[:lng].to_f
    radius = (params[:radius] || 50).to_i
    birds = getHotspotData(lat, lng, radius);
    render :json => birds
  end
end
