class AddPositionToOffers < ActiveRecord::Migration[7.2]
  def change
    add_column :offers, :position, :integer
  end
end
