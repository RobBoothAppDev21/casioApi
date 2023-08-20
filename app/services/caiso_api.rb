require 'httparty'

class CaisoApi
  include HTTParty

  # base_uri = "https://caiso.p.rapidapi.com/caiso?type=co2&startdate=20220101&enddate=20220901&interval=30"
  base_uri "https://caiso.p.rapidapi.com/caiso"
  # headers = headers: { "X-RapidAPI-Key": "", "X-RapidAPI-Host": 'caiso.p.rapidapi.com'}

  def initialize()
    @options = { 
                 headers: { 
                            "X-RapidAPI-Key": "#{Rails.application.credentials.dig(:caiso, :"rapidAPI-key")}", 
                            "X-RapidAPI-Host": "caiso.p.rapidapi.com"
                          }
                }
  end

  def caiso_type(startDate, endDate)
    response = self.class.get("/?startdate=#{startDate}&enddate=#{endDate}&type=co2", @options)
    json = JSON.parse(response.body)
    json['CAISOFile']
  end
end