class Sport < ActiveRecord::Base
  has_many :teams
  has_many :cards, :through => :team
end
