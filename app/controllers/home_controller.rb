class HomeController < ApplicationController

  before_filter :authenticate_investor!
  before_filter :authenticate_user!, :except => :hacked_sign_in

  def hacked_sign_in
    load_feeds
    redirect_to :action => 'dashboard'
  end



  def index
  end

  def landing
    render :layout => nil
  end

  def create_card
    render :text => "card"
  end

  def dashboard

    load_feeds
  end

  def feed_data
    load_feeds
    render :partial => 'feed_data'
  end

  def cards
  end

  def player_partial
    load_feeds
    render :partial => 'player_main_body'
  end

  def player
    load_feeds
  end

  def teams
  end

  def research
  end

  def events
  end

  def feed_entry
    @card = Card.find params[:card_id]
    @user_card = current_user.cards.first
    @feed_entry = FeedEntry.create(
      :card_id => params[:card_id],
      :content => params[:content]
      )
  end

  def comment
    @card = Card.find params[:card_id]
    @feed_entry = FeedEntry.find params[:feed_entry_id]
    @comment = Comment.create(
      :card_id => params[:card_id],
      :feed_entry_id => params[:feed_entry_id],
      :comment => params[:comment]
      )
  end

  def load_feeds
    # for collection

    @team_rankings = Team.all.limit(5) #sort order defined in team.rb.  using Team.first(5) seems to block the default_scope

    # if current_user.blank?
      sign_in User.first
    # end

    @user_card = current_user.cards.first #more hacks.  Just use first card of first user for posting stuff

    if params[:card_id].blank?
      @card = @user_card #show logged in user info when no params
    else
      @card = Card.find params[:card_id]
    end

    sql =[]
    unless params[:s].blank? || params[:s] == 'All' #if blank show it all
      sql << "entry_type = '#{params[:s].downcase}'"
      # and always show ads
      sql << "entry_type = 'ad-inline'"
      sql << "entry_type = 'ad-sponsored'"
      sql << "entry_type = 'achievement'"
    end
    @feed_entries = FeedEntry.where(sql.join(' or ')).order('created_at desc')
    puts sql
  end
end
