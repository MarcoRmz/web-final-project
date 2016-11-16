class AddFollowingToUser < ActiveRecord::Migration
  def change
    add_column :users, :following, :string, default: ""
  end
end
