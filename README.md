This repo contains an alternative way for CharlieApp to sort related news articles when looking into a company.


I realized that the news articles on my ex-employer generated by Charlie were not the most relevant/interesting to me. Since I previously worked with social media/google trends data, I wrote the following scripts to sort the articles in a different way.


Metrics:
3 metrics are used to rank a set of related articles:
- published date of the article
- popularity of the article on social media
- whether the article is published when the related company is trending on Google searches

To use:
- first add in your twitter consumer key/secret to /Lib/PopularitySearch.rb
- then run:

	$ Ruby Driver.rb


I am not familiar with how Charlie handles its articles ranking or what data it has available, but hopefully these scripts can generate some new ideas on Charlie's article sorting.


I'm really interested in the Ruby developer position at CharlieApp. If interested, please feel free to contact me at vlmist315@gmail.com