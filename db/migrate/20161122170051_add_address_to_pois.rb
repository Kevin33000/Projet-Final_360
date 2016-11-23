class AddAddressToPois < ActiveRecord::Migration[5.0]
  def change
    add_column :pois, :address, :string
  end
end
