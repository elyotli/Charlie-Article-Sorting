class Company
	include GoogleTrends
	attr_accessor :name
	TRENDING_MONTH_FACTOR = 2

	def initialize(name)
		@name = name
		@articles = []
	end

	def add_article(article)
		@articles << article
	end

	#three metrics to sort the articles on a company:
		# - how recent an article was published
		# - how popular this article was on social media (current using twitter)
		# - whether the article was published during a time where the company was in a google trends spike
	def sort_articles
		percentile_dates
		percentile_popularity
		check_trending_spike
		@articles = @articles.sort_by{|a| (a.days_percentile+a.pop_percentile)*a.trending_month_factor}.reverse
	end

	def print_articles
		@articles.each_with_index do |a, i|
			puts "Article #{i}:"
			puts " Title: #{a.title}"
			puts " published #{a.days_ago} days ago"
			puts " has #{a.pop} tweets"
			unless a.trending_month_factor != TRENDING_MONTH_FACTOR
				puts " published when #{@name} is trending on Google Searches"
			end
		end
	end

	private
	def percentile_dates
		@articles.sort_by!{|article| article.days_ago}
		article_count = @articles.size
		@articles.each_with_index do |a, i|
			a.days_percentile = (i.to_f/article_count.to_f*100).ceil
		end
	end

	def percentile_popularity
		@articles.sort_by!{|article| article.pop}
		article_count = @articles.size
		@articles.each_with_index do |a, i|
			a.pop_percentile = (i.to_f/article_count.to_f*100).ceil
		end
	end

	def check_trending_spike
		trending_spikes = get_trending_months(@name)
		#convert trending months to hash for faster comparison
		trending_spikes_hash = Hash[trending_spikes.map{|month| [(Date.today - month).to_i/30, ""]}]
		@articles.each do |a|
			month = a.days_ago/30
			# if this article is published during a trending month, give it additional weight
			a.trending_month_factor = trending_spikes_hash[month] ? TRENDING_MONTH_FACTOR : 1
		end
	end
end