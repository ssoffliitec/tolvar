class Item < ApplicationRecord
 mount_uploader :picture, PictureUploader
 belongs_to :marca
 belongs_to :unit
 belongs_to :category

 validates :description, presence: true

 def item_description
  self.description + ( (self.marca != nil) ? ' - ' + self.marca.name : '' )
 end

 def marca_name
  if self.marca
   self.marca.name
  else
   ''
  end
 end
end