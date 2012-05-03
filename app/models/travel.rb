class Travel < ActiveRecord::Base

	belongs_to :user
	has_many :activities, :dependent => :destroy

	validates_presence_of :name, :start_country, :end_country
	validate :mydate_is_date?
	validate :start_travel_lower_end_travel

	has_attached_file :illustration, :styles => { :medium => "300x300>", :thumb => "100x100>" }

	  private

	  def mydate_is_date?
	    if !self.start_travel.is_a?(Date)
	      self.errors.add(:start_travel, 'must be a valid date') 
	    end
	    if !self.end_travel.is_a?(Date)
	      self.errors.add(:end_travel, 'must be a valid date') 
	    end
	  end

	  def start_travel_lower_end_travel
	  	if !self.start_travel.nil? and !self.end_travel.nil? and self.start_travel > self.end_travel
	  		self.errors.add(:start_travel, 'La date de depart doit etre inferieur a la date de retour')
	  	end
	  end

end
