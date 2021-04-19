class SessionsController < ApplicationController
    def create
        user = User.find_by(name: params[:user][:name])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            @user = user
            # redirect_to controller: 'welcome', action: 'home'
        else
            redirect_to(controller: 'sessions', action: 'new')
        end
      end
    
      def destroy
        session.delete :user_id
        redirect_to '/'
      end
end
