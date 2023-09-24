class LogoutController < ApplicationController
    def invalidate_token
        self.update_columns(token: nil)
    end
end
