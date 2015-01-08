require 'ruby-standard-deviation'

module GoogleTrends
  BASE_URL = "http://www.google.com/trends/fetchComponent?hl=en-US&cmpt=q&content=1&export=3&cid=TIMESERIES_GRAPH_0"
  COOKIE = "PREF=ID=15a0c35777e5d761:U=0406a7d45c556908:FF=0:LD=en:NR=100:TM=1414641345:LM=1415489465:GM=1:SG=2:S=8c1dQPRl7PMzJbmb"

  def get_trending_months(keywords)
    #this searches for trending days on a particular topic
    #any data point greater than 1 standard deviation of the median will be flagged
    trend_data = extract_data(parse_response(get_request(keywords)))
    stdev = trend_data.values.stdev 
    median = calculate_median(trend_data.values)

    #assumes google trends returns months, need additional data formatting checks here
    filtered_data = trend_data.select do |date, popularity|
      popularity - median > stdev * 1
    end
    return filtered_data.keys
  end

  private

  def parse_response(response)
    response = response.match(/[(].*/).to_s
    response = response.gsub(/(new Date)\D\d{4}\D\d{1,2}\D\d{1,2}\D/)  { |s| s = '"' + s + '"' }
    JSON.parse(response[1..-3])
  end

  def get_request(keywords)
    url = BASE_URL + "&q=" + keywords.split(" ").join("+")
    uri = URI.parse(url)
    request = Net::HTTP::Get.new(uri)
    request['Cookie'] = COOKIE    # feeding Google the cookie monster
    response = Net::HTTP.start(uri.host, uri.port) do |http|
      http.request request
    end
    @response = response.body
  end

  def extract_data(response)
    trend_data = {}
    response["table"]["rows"].each do |row|
      cell = row["c"]
      date = parse_date(cell[0]["v"])
      indexdata = cell[1]["f"]
      if indexdata.nil?
        indexdata = 0
      else
        indexdata = indexdata.to_i
      end
      trend_data[date]= indexdata
    end
    return trend_data
  end

  def parse_date(raw_string)
    date_array = raw_string[9..-1].split(",")
    year = date_array[0].to_i
    month = date_array[1].to_i + 1
    day = date_array[2].to_i
    Date.new(year,month,day)
  end

  def calculate_median(array)
    sorted = array.sort
    len = sorted.length
    return (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
  end
end