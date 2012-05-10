class Picture < ActiveRecord::Base
	belongs_to :activity

	has_attached_file :picture, :styles => { :medium => "336x336>", :thumb => "154x154>" }

	def user
		self.activity.user
	end

end
