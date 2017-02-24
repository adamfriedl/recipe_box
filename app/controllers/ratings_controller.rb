class RatingsController < ApplicationController

	def create(ratings_params)
	end

	private

	def ratings_params
		params.require(:rating).permit(:score, :user_id)
	end

end
