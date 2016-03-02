class AddTwoFactorUtilsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :enbaled_two_factor, :boolean
    add_column :users, :unconfirmed_two_factor, :boolean
    add_column :users, :phone_number, :string
  end
end
