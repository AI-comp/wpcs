class Image < ActiveRecord::Base

  attr_accessible :attachment
  has_attached_file :attachment,
    :styles => {
      :thumbnail => ['160x160', :jpg]
    }
  validates_attachment_content_type :attachment, :content_type => /\Aimage\/.*\Z/

end
