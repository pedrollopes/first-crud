class Kind < ActiveRecord::Base
    has_many :contacts
    
    validates :description, presence: true
end
