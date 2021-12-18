class ApplicationController < ActionController::Base

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
        root_path
      end
    end

end
