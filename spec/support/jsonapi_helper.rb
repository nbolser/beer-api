module JSONAPIHelper
  def json_api_body
    JSON.parse(response.body)
  end

  def json_api_data
    JSON.parse(response.body)["data"]
  end
end
