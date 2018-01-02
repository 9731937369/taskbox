class Client < ActiveRecord::Base

	before_save :determine_gender_api
	

	has_many :projects

	validates_presence_of :name, :email, :company
	validates_uniqueness_of :email


	private
	def determine_gender_api
		if self.name_changed?
			response = HTTParty.get("https://www.gender-api.com/get?name=#{self.name}&key=pRPLCejozFwCHFbVCR")
			self.gender = response["gender"]
		end
	end

	
end
