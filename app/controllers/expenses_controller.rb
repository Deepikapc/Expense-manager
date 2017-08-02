class ExpensesController < ApplicationController

  #
  # index
  #
  def index

  end

  #
  # new
  #
  def new

  end

  #
  # edit
  #
  def edit

  end

  #
  # show
  #
  def show

  end

  #
  # create
  #
  def create

  end

  #
  # update
  #
  def update

  end

  #
  # destroy
  #
  def destroy

  end

  def imports
    response = Expense.import_data (params[:file])
    if response[:status] = 'success'
      redirect_to root_path
      flash[:notice] = "Successfully Imported"
    else
      redirect_back
      flash[:error] = "Something went wrong"
    end
  end

  private

  #
  # daily_invoice_params
  #
  def daily_invoice_params

  end
end
