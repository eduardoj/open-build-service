class AddContributionGuideToProjectsAndPackages < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :contribution_guide, :text
    add_column :packages, :contribution_guide, :text
  end
end
