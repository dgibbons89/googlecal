class Calendar < ActiveRecord::Base
	has_many :events
	belongs_to :user
	def self.search(query)
  		where("zip like ?", "%#{query}%") 
	end


	def self.count_tag
	end


end