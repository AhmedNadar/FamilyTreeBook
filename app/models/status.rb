class Status < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :content
	validates_length_of :content, minimum: 4
	validates_presence_of :user_id
end
