class AddRoleToAdminUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :admin_users, :role, :enum
  end
end
