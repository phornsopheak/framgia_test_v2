module RailsAdmin
  module Config
    module Actions
      class RequestQuestion < RailsAdmin::Config::Actions::Base

        register_instance_option :visible? do
          authorized? && bindings[:object].class == Question
        end

        register_instance_option :member do
          true
        end

        register_instance_option :link_icon do
          "icon-eye-open"
        end

        register_instance_option :pjax? do
          false
        end

        register_instance_option :http_methods do
          [:get, :post, :patch]
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

        register_instance_option :controller do
          Proc.new do
            if request.post?
              object.update_attributes state: :accepted
              redirect_to back_or_index,notice: flash_message("question_accepted")
            elsif request.patch?
              object.update_attributes state: :rejected
              redirect_to back_or_index, alert: flash_message("question_rejected")
            end
          end
        end

        def key
          self.class.key
        end
      end
    end
  end
end
