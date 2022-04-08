require 'net/http'
require 'json'
include ActionView::Helpers::NumberHelper
include EbirdHelper

class EbirdController < ApplicationController
  def data
      lat = params[:lat].to_f
      lng = params[:lng].to_f
      num_req = (params[:num_req] || 100).to_i
      num_ret = (params[:num_ret] || 1).to_i
      birds = getBirdData(lat, lng, num_req, num_ret)
      render :json => birds
  end
end
