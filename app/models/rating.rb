class Rating < ApplicationRecord
	belongs_to :recipe

	validates :score, inclusion: { in: 1..5 }
	validates :score, presence: true

	def self.average_score
		@average_score = Rating.sum(:score) / Rating.all.count
	end

end
