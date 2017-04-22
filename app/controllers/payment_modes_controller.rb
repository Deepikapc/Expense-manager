class PaymentModesController < ApplicationController

  #
  # index
  #
  def index
    @paymentmodes = PaymentMode.all
  end

  #
  # new
  #
  def new
    @paymentmode = PaymentMode.new
  end

  #
  # create
  #
  def create
    @paymentmode = PaymentMode.new(payment_mode_params)
    if @paymentmode.save
      redirect_to :action => :index
    else
      render 'new'
    end
  end

  #
  # show
  #
  def show
    @paymentmode = PaymentMode.find(params[:id])
  end

  #
  # destroy
  #
  def destroy
    @paymentmode = PaymentMode.find(params[:id])
    @paymentmode.destroy
    redirect_to payment_modes_path
  end

  private

  #
  # payment_mode_params
  #
  def payment_mode_params
    params.require(:payment_mode).permit(:payment_gateway)
  end
end
