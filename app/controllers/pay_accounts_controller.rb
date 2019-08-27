class PayAccountsController < ApplicationController
  before_action :get_pay_account, only: [:show, :destroy, :new]

  def index
    @pay_accounts = PayAccount.all
  end

  def show
  end

  def create
  end

  def destroy
    if @pay_account.destroy
      redirect_to pay_accounts_path
    else
      redirect_to pay_account_path(@pay_account) # TODO: addition would be adding errors showing user why it failed.
    end
  end

  private

  def pay_account_params
    params.require(:pay_account).permit(:nickname, :account_type, :account_number)
  end

  def get_pay_account
    @pay_account = PayAccount.find(params[:id])
  end

end
