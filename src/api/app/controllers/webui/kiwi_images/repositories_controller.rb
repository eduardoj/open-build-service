module Webui
  module KiwiImages
    class RepositoriesController < Webui::WebuiController
      before_action :set_project
      before_action :require_package
      
      def new
      end

      def create
        repository = Repository.find_by!(name: params[:repository_name])
        kiwi_xml = @package.source_file('kiwi_config.xml', {})
        kiwi_image = KiwiImage.from_xml(kiwi_xml)

        kiwi_repo = KiwiImage::Repository.new(source: { path: "#{repository.project.name}/#{repository.name}" })
        kiwi_image.repository << kiwi_repo

        render json: kiwi_image
      end
    end
  end
end