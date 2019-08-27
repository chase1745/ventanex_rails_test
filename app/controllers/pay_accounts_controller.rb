class PayAccountsController < ApplicationController
  before_action :get_pay_account, only: [:show, :destroy]

  def index
    @pay_accounts = PayAccount.all
  end

  def show
  end

  def new
    @pay_account = PayAccount.new
  end

  def create
    @pay_account = PayAccount.new(pay_account_params)
    if @pay_account.save
      puts 'saved'
    else
      puts 'error'
    end
    redirect_to pay_accounts_path

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
