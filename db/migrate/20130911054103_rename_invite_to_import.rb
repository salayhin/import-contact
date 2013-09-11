class RenameInviteToImport < ActiveRecord::Migration
  def up
    rename_table :invites, :imports
  end

  def down
    rename_table :imports, :invites
  end
end
