class AddOldPasswordDigestToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :old_password_digest, :string, charset: 'utf8'
  end
end
