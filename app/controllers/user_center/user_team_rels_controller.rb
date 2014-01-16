module UserCenter
  class UserTeamRelsController < UserCenter::BaseController
      def rel
        @user = User.find(params[:user_id])
        rels = UserTeamRel.where(:user_id => params[:user_id])
        ret = true

        unless rels.blank?
          p rels
        end
        #
        #
        #render(:text=>ret)
        #p params[:user_id]
        #p params[:team_id]
        #p params[:part]
      end
  end
end
