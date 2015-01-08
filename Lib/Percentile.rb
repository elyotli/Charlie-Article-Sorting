# class Score
#   attr_accessor :value, :percentile
#   def initialize(score)
#     self.value = score.to_f
#   end
#   def <=>(foo)
#     self.value <=> foo.value
#   end
# end

# # load scores
# scores = []
# DATA.each do |line|
#   scores << Score.new(line)
# end
# scores.sort!
# scores_count = scores.size

# # iterate through scores and calculate percentile
# scores.each_with_index do |s, i|

#   # L/N(100) = P
#   # L = number of scores beneath this score (score array index)
#   # N = total number of scores
#   # P = percentile
#   s.percentile = (i.to_f/scores_count.to_f*100).ceil
# end