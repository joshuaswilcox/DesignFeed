class CreateFeedsUsersTable < ActiveRecord::Migration
  def change
    create_table :feeds_users, :id => false do |t|
      t.references :feed
      t.references :user
    end
    add_index :feeds_users, [:feed_id, :user_id]
    add_index :feeds_users, :user_id
  end
end
