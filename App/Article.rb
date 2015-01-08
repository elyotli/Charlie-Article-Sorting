require 'date'

class Article
	include PopularitySearch
	attr_accessor :title, :url, :days_ago, :pop, :days_percentile, :pop_percentile, :trending_month_factor

	def initialize(title, url, days_ago)
		@title = title
		@url = url
		@days_ago = days_ago
		@pop = get_popularity
	end

	def get_popularity #find number of times this article has been shared on twitter
		twitter_popularity(@url)
	end
end