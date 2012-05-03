class Activity < ActiveRecord::Base

	belongs_to :travel
	has_many :pictures, :dependent => :destroy
	validates_presence_of :name, :description, :activity_type, :lieu

	
	validate :start_activity_lower_end_activity

	private

	  def mydate_is_datetime?
	    if !self.start_activity.is_a?(Date)
	      self.errors.add(:start_activity, 'must be a valid date') 
	    end
	    if !self.end_activity.is_a?(Date)
	      self.errors.add(:end_activity, 'must be a valid date') 
	    end
	  end

	  def start_activity_lower_end_activity
	  	if !self.start_activity.nil? and !self.end_activity.nil? and self.start_activity > self.end_activity
	  		self.errors.add(:start_activity, 'La date de debut de l\'activite doit etre inferieur a la date de fin de celle-ci')
	  	end
	  end

end
