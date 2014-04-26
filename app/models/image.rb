class Image < ActiveRecord::Base
  has_attached_file :image_file, :styles =>{ :medium => "300x300#", :small => "100x100#", :feed=> "157x144#" }

end
