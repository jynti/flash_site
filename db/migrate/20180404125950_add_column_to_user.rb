class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :confirm_token_set_at, :datetime
  end
end
