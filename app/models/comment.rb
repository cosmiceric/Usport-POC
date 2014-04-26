class Comment < ActiveRecord::Base
  belongs_to :feed_entry
  belongs_to :card
end
