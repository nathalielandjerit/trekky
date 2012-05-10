# encoding: UTF-8
class Travel < ActiveRecord::Base

	belongs_to :user
	has_many :activities, :dependent => :destroy

	validates_presence_of :name, :start_country, :end_country
	validate :mydate_is_date?
	validate :start_travel_lower_end_travel
	
	has_attached_file :illustration, :styles => { :medium => "336x336>", :thumb => "154x154>" }, :default_url => "default_:style_travel.jpg"

	validates_attachment_content_type :illustration, :content_type => ["image/jpg","image/jpeg","image/png","image/gif"], :message => "Le format du fichier n'est pas bon"

	  private

	  def mydate_is_date?
	    if !self.start_travel.is_a?(Date)
	      self.errors.add(:start_travel, "Votre date de départ n'est pas du format JJ-MM-AAAA") 
	    end
	    if !self.end_travel.is_a?(Date)
	      self.errors.add(:end_travel, "Votre date de retour n'est pas du format JJ-MM-AAAA") 
	    end
	  end

	  def start_travel_lower_end_travel
	  	if !self.start_travel.nil? and !self.end_travel.nil? and self.start_travel > self.end_travel
	  		self.errors.add(:start_travel, "La date de départ doit être inférieur à la date de retour")
	  	end
	  end

end
