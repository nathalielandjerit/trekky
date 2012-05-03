class Comment < ActiveRecord::Base
	belongs_to :activity
	validates_presence_of :body
end
