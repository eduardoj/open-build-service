require 'rails_helper'

RSpec.describe Kiwi::Image, type: :model do
  include_context 'a kiwi image xml'

  describe '.create_from_xml' do
    subject { Kiwi::Image.create_from_xml(kiwi_xml) }

    it { expect(subject.persisted?).to be true }
    it { expect(subject.name).to eq('Christians_openSUSE_13.2_JeOS') }

    it 'parses the repository elements of the xml into a KiwiImage model' do
      expect(subject.repositories[0].source_path).to eq('http://download.opensuse.org/update/13.2/')
      expect(subject.repositories[1].source_path).to eq('http://download.opensuse.org/distribution/13.2/repo/oss/')
      expect(subject.repositories[0].repo_type).to eq('rpm-md')
      expect(subject.repositories[1].repo_type).to eq('rpm-md')
    end
  end
end
