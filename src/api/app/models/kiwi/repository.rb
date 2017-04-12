# TODO: Please overwrite this comment with something explaining the model target
class Kiwi::Repository < ApplicationRecord
  #### Includes and extends

  #### Constants

  #### Self config

  #### Attributes

  #### Associations macros (Belongs to, Has one, Has many)
  belongs_to :image

  #### Callbacks macros: before_save, after_save, etc.

  #### Scopes (first the default_scope macro if is used)

  #### Validations macros

  #### Class methods using self. (public and then private)

  #### To define class methods as private use private_class_method
  #### private


  #### Instance methods (public and then protected/private)

  #### Alias of methods

end

# == Schema Information
#
# Table name: kiwi_repositories
#
#  id          :integer          not null, primary key
#  image_id    :integer          indexed
#  repo_type   :string(255)
#  source_path :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_kiwi_repositories_on_image_id  (image_id)
#
