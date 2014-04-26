class Card < ActiveRecord::Base
  belongs_to :team
  belongs_to :sport
  belongs_to :user

  validates_presence_of :first_name, :last_name, :team, :date_of_birth

  has_attached_file :image, :styles => { :card => "320x445#", :small=>'100x100#', :profile=>'128x128#', :profile_lg=>'280x280#' }, :default_url => "/assets/player-card.png"
  has_many :feed_entries
  has_many :comments

  def name
  	"#{self.first_name} #{self.last_name}"
  end

  def next_card
    card = Card.where(['id > ? ',self.id]).first
    card = Card.first if card.blank?
    return card
  end

  def random_team
    # strong parameters blocked me from using this in Team model.  or perhaps a naming issue.  Whatever, works from here.  Strong Params needs some work...
    offset = rand(Team.count)
    team = Team.first(:offset => offset)
    return team #workaround for strong params blocking in view
  end

  def name=(val) #when writing a name to the model, split into first and last
    words = val.split(' ')
    self.first_name = words.first
    self.last_name  = words.last
  end

  def age
  	bd = self.date_of_birth
  	d = Time.now
      # Difference in years, less one if you have not had a birthday this year.
      a = d.year - bd.year
      a = a - 1 if (
           bd.month >  d.month or
          (bd.month >= d.month and bd.day > d.day)
      )
      a
  end

end
