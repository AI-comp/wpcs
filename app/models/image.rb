class Image < ActiveRecord::Base

  attr_accessible :attachment
  has_mongoid_attached_file :attachment,
    :styles => {
      :original  => ['600x400', :jpg],
      :thumbnail => ['160x160', :jpg]
    }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end
