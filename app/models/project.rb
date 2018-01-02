class Project < ActiveRecord::Base
	belongs_to :client

	validates_presence_of :name, :start_date, :client_id


end
