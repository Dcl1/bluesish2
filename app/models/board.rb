class Board < ActiveRecord::Base

	has_many :posts
	has_many :links
	has_many :videos
end
