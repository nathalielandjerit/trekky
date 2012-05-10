# encoding: UTF-8
class Activity < ActiveRecord::Base

	belongs_to :travel
	has_many :pictures, :dependent => :destroy
	has_many :comments
	validates_presence_of :name, :description, :activity_type, :lieu
	
	validates_datetime :start_activity, :end_activity

	validate :start_activity_lower_end_activity

	def user
		self.travel.user
	end

	private

	  def start_activity_lower_end_activity
	  	if !self.start_activity.nil? and !self.end_activity.nil? and self.start_activity > self.end_activity
	  		self.errors.add(:start_activity, 'La date de début de l\'activité doit être inférieur à la date de fin de celle-ci')
	  	end
	  end

end
