class RenameEnabledTwoFactorOnUsers < ActiveRecord::Migration
  def change
    rename_column :users, :enbaled_two_factor, :two_factor_enabled
  end
end
