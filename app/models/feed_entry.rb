class FeedEntry < ActiveRecord::Base

  has_many :comments
  belongs_to :card

  validates_presence_of :card_id, :content, :entry_type

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  has_attached_file :image2, :styles => { :medium => "300x300>", :thumb => "100x100>"}, :default_url => "/images/:style/missing.png" 
end
