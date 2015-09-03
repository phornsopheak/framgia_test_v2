module RailsAdmin
  module Config
    module Actions
      class MultiDeactiveQuestion < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :collection do
          true
        end

        register_instance_option :http_methods do
          [:post, :patch]
        end

        register_instance_option :controller do
          proc do
            if request.post?
              if params[:cancel]
                redirect_to back_or_index, alert: flash_message("questions_cancel")
              else
                @active_questions = list_entries(@model_config)
                render @action.template_name
              end
            elsif request.patch?
              @questions = Question.where id: params[:bulk_ids]
              @questions.update_all active: 0
              redirect_to back_or_index, notice: flash_message("multi_deactive_question")
            end
          end
        end

        register_instance_option :authorization_key do
          :destroy
        end

        register_instance_option :bulkable? do
          true
        end
      end
    end
  end
end
