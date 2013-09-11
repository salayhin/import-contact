class RenameImportToInvite < ActiveRecord::Migration
  def up
    rename_table :imports, :invites
  end

  def down
    rename_table :invites, :imports
  end
end
