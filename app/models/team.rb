class Team < ActiveRecord::Base

  has_attached_file :logo, :styles =>{ :medium => "120x120#", :small => "60x60#" }
  belongs_to :sport
  has_many  :cards
  validates_presence_of :sport_id, :name, :wins, :losses

  default_scope order('wins/(wins + losses) desc')


  def next_match_team_name
    #TODO: DRY this up...!
    if self.next_match_team_id.blank?
       "None"
    else
      team = Team.find self.next_match_team_id
      team.name
    end
  end

  def next_match_team
    if self.next_match_team_id.blank?
       nil
    else
      Team.find self.next_match_team_id
    end
  end

  def percent
    total = self.wins + self.losses
    if total && total > 0
      ("%.3f" % (wins.to_f/total)).last(4)
    else
      'n/a'
    end
  end

end