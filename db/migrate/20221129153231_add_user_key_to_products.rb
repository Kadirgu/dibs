class AddUserKeyToProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :user, index: true 
  end
end
