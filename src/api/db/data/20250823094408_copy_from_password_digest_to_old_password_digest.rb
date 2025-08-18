# frozen_string_literal: true

class CopyFromPasswordDigestToOldPasswordDigest < ActiveRecord::Migration[7.2]
  def up
    User.in_batches do |batch|
      batch.find_each do |user|
        user.update_columns(old_password_digest: user.password_digest) # rubocop:disable Rails/SkipsModelValidations
      end
    end
  end

  def down; end
end
