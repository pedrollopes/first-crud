class Phone < ActiveRecord::Base
  belongs_to :contact
  has_one :address
  
   accepts_nested_attributes_for :contact
end
