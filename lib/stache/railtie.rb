module Stache
  class Railtie < ::Rails::Railtie
    config.to_prepare do
      ApplicationController.send(:append_view_path, Stache.template_base_path)
    end

    initializer 'stache.extend_action_controller_base' do
      ActiveSupport.on_load(:action_controller) do
        Stache::System.setup
      end
    end
  end
end
