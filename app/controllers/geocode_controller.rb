class GeocodeController < ApplicationController
  def proxy
    address = params[:address]
    api_key = 'AIzaSyArxLH3o4xPe93ks1-SXsRlYm4YcCerSbk' # Replace with your actual geocoding API key

    url = URI.parse("https://geocoding-api.com/?address=#{address}&apiKey=#{api_key}")
    req = Net::HTTP::Get.new(url.to_s)

    response = Net::HTTP.start(url.host, url.port, use_ssl: true) do |http|
      http.request(req)
    end

    render json: response.body
  end
end
