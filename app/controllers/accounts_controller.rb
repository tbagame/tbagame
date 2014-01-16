class AccountsController < ApplicationController

  def check_name
    account = Account.where(:name => params[:name])
    render(:text=>account.blank? ? true : false)
  end
end
