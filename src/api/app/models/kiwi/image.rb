# TODO: Please overwrite this comment with something explaining the model target
class Kiwi::Image < ApplicationRecord
  #### Includes and extends

  #### Constants

  #### Self config

  #### Attributes

  #### Associations macros (Belongs to, Has one, Has many)
  has_many :repositories

  #### Callbacks macros: before_save, after_save, etc.

  #### Scopes (first the default_scope macro if is used)

  #### Validations macros

  #### Class methods using self. (public and then private)

  #### To define class methods as private use private_class_method
  #### private


  #### Instance methods (public and then protected/private)

  #### Alias of methods

  def self.create_from_xml(xml_string)
    xml = Xmlhash.parse(xml_string)
    new_image = create(name: xml['name'])

    xml["repository"].each do |repository|
      new_image.repositories.create(repo_type: repository['type'], source_path: repository['source']['path'])
    end

    new_image
  end

end

# == Schema Information
#
# Table name: kiwi_images
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
