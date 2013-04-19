class Image

  include Mongoid::Document
  include Mongoid::Paperclip

  has_mongoid_attached_file :attachment,
    :styles => {
      :original  => ['600x400', :jpg],
      :thumbnail => ['160x160', :jpg]
    }

end
