class Bark < ActiveRecord::Base
default_scope order: 'createdat DESC'
belongs_to :user
 
validates :content, length: { maximum: 140 }

end
