class AddColumnPostCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :post_count, :integer
  end
end
