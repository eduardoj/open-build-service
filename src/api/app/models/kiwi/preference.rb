class Kiwi::Preference < ApplicationRecord
  belongs_to :image, inverse_of: :preference

  enum type_image: %i[btrfs clicfs cpio docker ext2 ext3 ext4 iso lxc oem product pxe reiserfs split squashfs tbz vmx xfs zfs]

  validates :type_image, inclusion: { in: type_images.keys }, allow_nil: true

  def containerconfig_xml
    builder = Nokogiri::XML::Builder.new do |xml|
      xml.containerconfig(name: type_containerconfig_name, type_containerconfig_tag: type_containerconfig_tag)
    end
    builder.to_xml save_with: Nokogiri::XML::Node::SaveOptions::NO_DECLARATION | Nokogiri::XML::Node::SaveOptions::FORMAT
  end

  # Can the user edit this from the kiwi editor?
  def editable?
    type_image == 'docker'
  end
end

# == Schema Information
#
# Table name: kiwi_preferences
#
#  id                        :integer          not null, primary key
#  image_id                  :integer          indexed
#  type_image                :integer
#  type_containerconfig_name :string(255)
#  type_containerconfig_tag  :string(255)
#
# Indexes
#
#  index_kiwi_preferences_on_image_id  (image_id)
#
