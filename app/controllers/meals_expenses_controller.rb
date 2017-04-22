class MealsExpensesController < ApplicationController
  #
  # index
  #
  def index
    @from_date=params[:from_date]
    @to_date=params[:to_date]

  end

  #
  # new
  #
  def new
    @dailyinvoice = DailyInvoice.new
    @dailyinvoice.expenses.build
  end

  #
  # edit
  #
  def edit
    @dailyinvoice = DailyInvoice.find(params[:id])
    @dailyinvoice.expenses.build
  end

  #
  # export
  #
  def export
    results = MealsExpense.get_date_details params
    respond_to do |format|
      format.csv { send_data results, filename: "lunch_detail_#{Time.now.to_i}.csv" }
    end
  end


  private
  def lunch_detail_params
    params.require(:lunch_detail).permit(:date, :daily_invoice_id, :had_lunch)
  end
end
