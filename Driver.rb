Dir[File.dirname(__FILE__) + '/Lib/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/App/*.rb'].each {|file| require file }

#Seed data from Charlie findings on my ex-employer

companyZS = Company.new("ZS Associates")
companyZS.add_article(Article.new("Want a job? Why not shoot a ‘selfie video’ resume?", "http://www.thehindubusinessline.com/companies/want-a-job-why-not-shoot-a-selfie-video-resume/article6716663.ece", 16))
companyZS.add_article(Article.new("Back to Basics: How to Set Good Sales Quotas", "http://info.zsassociates.com/thecarrot/back-to-basics-how-to-set-good-sales-quotas", 90))
companyZS.add_article(Article.new("Would Sales leaders like MBOs more if we changed the name?", "http://info.zsassociates.com/thecarrot/should-companies-omit-the-%25mbo%25-name-from-their-incentive-compensation-plans", 60))
companyZS.add_article(Article.new("Back to Basics: Incentive Compensation Plan Periods and Payout Frequency", "http://info.zsassociates.com/thecarrot/bid/355821/Back-to-Basics-Incentive-Compensation-Plan-Periods-and-Payout-Frequency", 90))
companyZS.add_article(Article.new("Are You Giving Away Free Sales Incentive Pay?", "http://info.zsassociates.com/thecarrot/are-you-giving-away-free-sales-incentive-pay", 30))
companyZS.add_article(Article.new("Hertz Appoints New Executive", "http://www.fenderbender.com/FenderBender/January-2015/Hertz-Appoints-New-Executive/", 1))
companyZS.add_article(Article.new("What can Sales Compensation learn from the NFL fining Marshawn Lynch?", "hhttp://info.zsassociates.com/thecarrot/what-can-sales-compensation-learn-from-the-nfl-fining-marshawn-lynch", 30))
companyZS.add_article(Article.new("PNAS: Brandon Bartell, Business Analyst", "http://scienceblogs.com/principles/2015/01/06/pnas-brandon-bartell-business-analyst/", 1))
companyZS.add_article(Article.new("Is The Elf on the Shelf an Effective Incentive Plan for Kids?", "http://info.zsassociates.com/thecarrot/is-the-elf-on-the-shelf-an-effective-incentive-plan-for-kids", 20))
companyZS.add_article(Article.new("Back to Basics: Four Ways to Maximize Your Use of SPIFs and Contests", "http://info.zsassociates.com/thecarrot/back-to-basics-four-ways-to-maximize-your-use-of-spifs-and-contests", 90))
companyZS.add_article(Article.new("Hertz Lures Marketing/Strategy Chief from United Continental", "http://www.wsj.com/articles/hertz-lures-marketing-strategy-chief-from-united-continental-1420562276", 1))
companyZS.add_article(Article.new("Four Lessons on Team Sales Incentives From the Service Industry", "http://info.zsassociates.com/thecarrot/four-lessons-on-team-sales-incentives-from-the-service-industry", 26))
companyZS.add_article(Article.new("Back to Basics: Two simple reasons to use an incentive compensation management solution", "http://info.zsassociates.com/thecarrot/back-to-basics-two-simple-reasons-to-use-an-incentive-compensation-management-solution", 60))


#driver code
#remember to add in your twitter app information

puts "articles sorted by Charlie:"
companyZS.print_articles

puts "-----------------------------------------------------"
puts "a different way to sort the articles"
companyZS.sort_articles
companyZS.print_articles