class AddColumnsToNoodles < ActiveRecord::Migration[5.2]
  def change
    add_column :noodles, :address, :string
    add_column :noodles, :url, :string
  end
end
