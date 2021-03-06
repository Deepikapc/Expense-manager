  class UserPaymentsController < ApplicationController
    def index
    @userpayments=UserPayment.all
  end
    def new
    @userpayment=UserPayment.new
    @users=User.all
    @paymentmodes=PaymentMode.all
  end
  def create
     @userpayment=UserPayment.new(user_payment_params)
    if @userpayment.save
      redirect_to :action => :index
    else
      render 'new'
      end
  end
  def show
     @userpayment=UserPayment.find(params[:id])
  end
  def destroy
       @userpayment=UserPayment.find(params[:id])
       @userpayment.destroy
       redirect_to user_payments_path
     end

  private
        def user_payment_params
          params.require(:user_payment).permit(:user_id ,:amount_paid,:date, :comment,:payment_mode_id )
        end
  end
