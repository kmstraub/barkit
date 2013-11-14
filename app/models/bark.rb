class Bark < ActiveRecord::Base
	
	default_scope order: 'created_at DESC'
	belongs_to :user
	 
	validates :content, length: { maximum: 140 }

end
