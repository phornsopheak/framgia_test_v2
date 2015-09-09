module RailsAdmin
  module Config
    module Actions
      class DeactiveQuestion < RailsAdmin::Config::Actions::Base
        register_instance_option :visible? do
          authorized?
        end

        register_instance_option :member do
          true
        end

        register_instance_option :link_icon do
          "icon-ban-circle"
        end

        register_instance_option :pjax? do
          false
        end

        register_instance_option :http_methods do
          [:get, :post]
        end

        register_instance_option :route_fragment do
          custom_key.to_s
        end

        register_instance_option :action_name do
          custom_key.to_sym
        end

        register_instance_option :custom_key do
          key
        end

        def key
          self.class.key
        end

        register_instance_option :controller do
          Proc.new do
            object.update_attributes active: false
            redirect_to :back, notice: t("flashs.messages.deactive_question", question_id: object.id)
          end
        end
      end
    end
  end
end
