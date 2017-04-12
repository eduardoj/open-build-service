class CreateKiwiRepositories < ActiveRecord::Migration[5.0]
  def change
    create_table :kiwi_repositories do |t|
      t.references :image
      t.string :repo_type
      t.string :source_path

      t.timestamps
    end
  end
end
