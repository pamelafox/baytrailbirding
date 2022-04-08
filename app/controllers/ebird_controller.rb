require 'net/http'
require 'json'
include ActionView::Helpers::NumberHelper

class EbirdController < ApplicationController
  include EbirdHelper
  def data
      lat = params[:lat]
      lng = params[:lng]
      num_req = (params[:num_req] || 100).to_i
      num_ret = (params[:num_ret] || 1).to_i
      birds = getBirdData(lat, lng, num_req, num_ret)
      render :json => birds
  end
end
