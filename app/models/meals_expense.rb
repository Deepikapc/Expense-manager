class MealsExpense < Expense

  #
  # self.get_date_details
  # Finds all users with meal details
  #
  def self.get_date_details params
    users = User.all

    @from_date = params[:from_date]
    @to_date = params[:to_date]

    year = @from_date.split("-").first.to_i
    a = Date.parse(@from_date).cweek
    b = Date.parse(@to_date).cweek

    results = []
    first_balance = ['',''] + Array.new(User.count, 0)

    #HARD CODED VALUE FOR BALANCE FOR EACH USER
    balances = Array.new(User.count + 2, 0)
    user_balances = {}

    (a..b).each_with_index do |i, k|

      date_array = []
      (1..7).each do |day|
        date_array << Date.commercial(year, i, day).to_date
        puts "11111#{date_array.inspect}"
      end

      user_amt_hash = {}
      zero_user_costs = Array.new(User.count, 0)
      date_array.each do |date|
        next if @from_date.to_date > date
        next if @to_date.to_date < date
        @date_detail = []
        @date_detail1 = []
        @vardate = date

        @amount = DailyInvoice.where("daily_invoices.date = ? ", @vardate).pluck(:amount).first
        if @amount.nil?
          @amount = 0
        end
        user_amt_hash[date] = {}
        @date_detail << @vardate.to_date << @amount
        users.order(:name).each do |user|
          user_amt_hash[date][user.id] = 0
          @amount = DailyInvoice.where("daily_invoices.date = ? ", @vardate).pluck(:amount)
          if @amount.empty?
            @amount = 0
          end
          @had_lunch = Expense.where("date = ? AND user_id = ? ", @vardate, user.id).pluck(:had_lunch)
          if @had_lunch.empty?
            @had_lunch = 0
            user_amt_hash[date][user.id] = 0
          else
            @had_lunch = 1
            user_amt_hash[date][user.id] = user.cost_of_meal
          end
          @date_detail << @had_lunch
        end
        puts user_amt_hash
        results << @date_detail
      end

      amount ={}
      week_hash_array = user_amt_hash.values
      week_hash_array.each do |week_amount|
        week_amount.each do |key, value|
          amount[key] ||= 0
          amount[key] += value
        end
      end

      weekly_costs = amount.values.uniq == [0] ? zero_user_costs : amount.values
      results << ['', ''] + weekly_costs

      #balance amount calculation for each user for all weeks
      user_balances[k] = []
      weekly_costs.each_with_index { |j, i| user_balances[k] << (k==0 ? (balances[i] + weekly_costs[i]) : (user_balances[k-1][i] + weekly_costs[i])) }
      results << ['', ''] + user_balances[k]

    end

    puts "results is #{results.inspect}"
    users = User.order(:name)
    headers = ["Date", "Amount"]
    costofmeal = ['', '']

    users.each do |user|
      headers << user.name
      costofmeal << user.cost_of_meal
    end

    CSV.generate(headers: true) do |csv|
      csv << headers
      csv << costofmeal
      csv << first_balance
      results.each do |result|
        csv << result
      end

    end
  end
end