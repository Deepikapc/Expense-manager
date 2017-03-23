  class PaymentModesController < ApplicationController
    def index
      @paymentmodes=PaymentMode.all
    end

    def new
      @paymentmode=PaymentMode.new
    end

    def create
      @paymentmode=PaymentMode.new(payment_mode_params)
      if @paymentmode.save
        redirect_to :action => :index
      else
        render 'new'
      end
    end

    def show
      @paymentmode=PaymentMode.find(params[:id])
    end

    def destroy
      @paymentmode=PaymentMode.find(params[:id])
      @paymentmode.destroy
      redirect_to payment_modes_path
    end

    private
    def payment_mode_params
      params.require(:payment_mode).permit(:payment_gateway)
    end
  end
