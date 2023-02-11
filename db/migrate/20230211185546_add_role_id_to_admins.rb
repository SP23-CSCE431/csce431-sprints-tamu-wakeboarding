class AddRoleIdToAdmins < ActiveRecord::Migration[7.0]
  def change
    add_column :admins, :role_id, :integer
  end
end
