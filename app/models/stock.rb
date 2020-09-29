class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks
  #
  # $Stock = StockQuote::Stock.new(api_key: pk_10967377fae34442a5612ba55b1159ab)
  def self.new_from_lookup(ticker_symbol)
    begin
      StockQuote::Stock.new(api_key: 'pk_10967377fae34442a5612ba55b1159ab' )
      looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
      # price = strip_commas(looked_up_stock.latest_price)
      new(name: looked_up_stock.company_name, ticker: looked_up_stock.symbol, last_price: looked_up_stock.latest_price)
    # rescue Exception => e
    #   return nil
     end
  end

  def self.strip_commas(number)
    number.gsub(",","")
  end
end
