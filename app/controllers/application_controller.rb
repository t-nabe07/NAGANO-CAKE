class ApplicationController < ActionController::Base

  # def after_sign_in_path_for(resource)
  #   case resource
  #   when Admin
  #     admin_orders_path
  #   when Customer
  #     root_path
  #   end
  # end

  # def after_sign_out_path_for(resource)
  #   case resource
  #   when Admin
  #     new_admin_session_path
  #   when Customer
  #     root_path
  #   end
  # end

  private
    # ログイン後のリダイレクト先
    def after_sign_in_path_for(resource_or_scope)
      if resource.is_a?(Admin)
        admin_orders_path
      else
        root_path
      end
    end

    # ログアウト後のリダイレクト先
    def after_sign_out_path_for(resource_or_scope)
      if resource_or_scope == :admin
        new_admin_session_path
      else
        new_user_session_path
      end
    end

end
