RSpec.describe Webui::NotificationHelper do
  describe '#truncate_to_first_new_line' do
    context 'when the text is nil' do
      it {  expect(truncate_to_first_new_line(nil)).to eql('') }
    end

    context 'when the text is empty string' do
      it { expect(truncate_to_first_new_line('')).to eql('') }
    end

    context 'when text has no newline' do
      it {
        expect(truncate_to_first_new_line('some text without newline'))
          .to eql('some text without newline')
      }
    end

    context 'when text has newline' do
      it {
        expect(truncate_to_first_new_line('some text with a first line here\nthis is the second line'))
          .to eql('some text with a first line here\\nthis is the second line')
      }
    end

    context 'when text is long' do
      it {
        expect(truncate_to_first_new_line('some text with a long long long long long long long long long long long long long long long long long first line\nand a second line'))
          .to eql('some text with a long long long long long long long long long long long long long long long long ...')
      }
    end
  end

  describe '#avatars' do
    let(:admin) { create(:admin_user) }
    let(:iggy) { create(:staff_user, login: 'Iggy') }
    let(:factory) { create(:project, name: 'openSUSE:Factory') }
    let(:staging_workflow) { create(:staging_workflow, project: factory) }
    let(:leap) { create(:project, name: 'openSUSE:Leap:15.0') }
    let(:leap_apache) { create(:package_with_file, name: 'apache2', project: leap) }
    let(:notification) { create(:notification_for_request, :request_created, notifiable: bs_request) }

    before { User.session = admin }

    context 'when displaying users or groups' do
      let(:notification) { create(:notification_for_request, :request_created) }

      it { expect(avatars(notification)).to include 'gravatar' }
    end

    context 'when displaying packages' do
      let(:bs_request) do
        bs_request = create(
          :bs_request_with_submit_action,
          creator: iggy,
          target_package: 'inreview',
          target_project: factory,
          source_package: leap_apache
        )
        bs_request.save
        bs_request
      end

      it { expect(avatars(notification)).to include 'fa-archive' }
    end

    context 'when displaying projects' do
      let(:bs_request) do
        bs_request = create(
          :bs_request_with_submit_action,
          creator: iggy,
          target_package: 'inreview',
          target_project: factory,
          source_package: leap_apache
        )
        bs_request.staging_project = staging_workflow.staging_projects.first
        5.times do
          create(:review, by_project: bs_request.staging_project, bs_request: bs_request)
        end
        bs_request.save
        bs_request
      end

      it { expect(avatars(notification)).to include 'fa-cubes' }
      it { expect(avatars(notification)).to include 'avatars-counter' }
    end
  end
end
