class AddHighlightsToCard < ActiveRecord::Migration
  def change
    add_column :cards, :highlights, :text
  end
end
