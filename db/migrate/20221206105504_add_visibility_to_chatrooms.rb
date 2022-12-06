class AddVisibilityToChatrooms < ActiveRecord::Migration[7.0]
  def change
    add_column :chatrooms, :visible_for_seller, :boolean, default: true
    add_column :chatrooms, :visible_for_user, :boolean, default: true
  end
end
