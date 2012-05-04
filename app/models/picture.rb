class Picture < ActiveRecord::Base
	belongs_to :activity

	has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }

	def user
		self.activity.user
	end

end
