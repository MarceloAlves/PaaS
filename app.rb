require 'sinatra'
require 'grape'
require 'polylines'

class API < Grape::API
  format :json

  desc "Encode a polyline"
  params do
    requires :points, desc: "Polyline to encode"
  end
  post :encode do
    points = params[:points]
    Polylines::Encoder.encode_points(points)
  end

  desc "Decode a polyline"
  params do
    requires :polyline, type: String, desc: "Polyline to decode"
  end
  post :decode do
    polyline = params[:polyline]
    Polylines::Decoder.decode_polyline(polyline)
  end
end


class Web < Sinatra::Base
  get '/' do
    erb :index, format: :html5
  end
end
