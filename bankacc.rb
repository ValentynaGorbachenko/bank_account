class BankAccount
  attr_reader :acc_num, :check_amount, :saving_amount
  @@accounts_opened = 0 
  # class << self
  #   @@accounts_opened
  # end
  def initialize 
    @acc_num = generate_acc()
    @check_amount = 0
    @saving_amount = 0
    @rate = 3
    @@accounts_opened += 1
  end
  #displays how many accounts opened
  def self.accounts_opened
      @@accounts_opened
  end
  # returns account numer
  def account_num
    @acc_num
  end
  # returns checking amount
  def cheking_balance
    @check_amount
  end
  # returns savings amount
  def saving_balance
    @saving_amount
  end
  # returns total amount
  def total_amount
    @check_amount + @saving_amount
  end
  # account information
  def account_info
    str = "ACCOUNT INFO:"
    str += "\nAccount numer is " + account_num.to_s
    str += "\nTotal amount of money is $" + total_amount.to_s
    str +="\nChecking balance is $" + cheking_balance.to_s
    str += "\nSaving balance is $" + saving_balance.to_s
    str += "\nInterest rate is #{@rate}\%"
  end
  # puts amount to checking account
  def depositing_money_check amount
    @check_amount += amount
    self
  end
  # puts amount to saving account
  def depositing_money_saving amount
    @saving_amount += amount
    self
  end
  # withdraw amount to checking account
  def withdraw_from_saving amount
    if amount< @saving_amount
      @saving_amount -= amount
    else
      puts "You don't have anough money, try again =)"
    end
    self
  end
  # withdraw amount to saving account
  def withdraw_from_checking amount
    if amount< @check_amount
      @check_amount -= amount
    else
      puts "You don't have anough money, try again =)"
    end
    self
  end
  # transfer amount to checking account
  def from_saving_to_checking amount
    if amount< @saving_amount
      @checking_amount += amount
      @saving_amount -= amount
    else
      puts "You don't have anough money, try again =)"
    end
    self
  end
  # transfer amount to saving account
  def from_checking_to_saving amount
    if amount< @check_amount
      @saving_amount += amount
      @check_amount -= amount
    else
      puts "You don't have anough money, try again =)"
    end
    self
  end
  def num_accounts
    @@accounts_opened
  end
  private 
  def generate_acc
    10.times.map{rand(0..9)}.join('').to_i
  end
end

ba = BankAccount.new
ba2 =BankAccount.new

puts "Account number is " + ba.account_num.to_s
puts "Checking amount is " + ba.cheking_balance.to_s
puts "Saving amount is " + ba.saving_balance.to_s
puts "Total amount is " + ba.total_amount.to_s

puts "+"*20
puts "Puting money to checking account, $20"
ba.depositing_money_check(20)
puts "Checking amount is " + ba.cheking_balance.to_s
puts "Saving amount is " + ba.saving_balance.to_s
puts "Total amount is " + ba.total_amount.to_s

puts "+"*20
puts "Puting money to saving account, $30"
ba.depositing_money_saving(30)
puts "Checking amount is " + ba.cheking_balance.to_s
puts "Saving amount is " + ba.saving_balance.to_s
puts "Total amount is " + ba.total_amount.to_s

puts "+"*20
puts "Withdraw from checking, $5"
ba.withdraw_from_checking(5)
puts "Checking amount is " + ba.cheking_balance.to_s
puts "Saving amount is " + ba.saving_balance.to_s
puts "Total amount is " + ba.total_amount.to_s

puts "+"*20
puts "Withdraw from saving, $5"
ba.withdraw_from_saving(5)
puts "Checking amount is " + ba.cheking_balance.to_s
puts "Saving amount is " + ba.saving_balance.to_s
puts "Total amount is " + ba.total_amount.to_s

puts "+"*20
puts ba.account_info
puts "+"*20 +"\nNumber of account opened is " + BankAccount.accounts_opened.to_s
