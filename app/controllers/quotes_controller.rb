class QuotesController < ApplicationController
  def index
    @quote = Quote.order("RANDOM()").first
  end

  def create
    @quote = Quote.create(quote_params)
    if @quote.invalid?
      flash[:error] = '<strong>Could not save</strong>'
    end
    redirect_to root_path    
  end

  def about
    
  end

  def saying
    @quote = Quote.select{|quote| quote.saying}
  end

  def author
    @quote = Quote.select do |quote| 
      quote.saying[0..2] == "yes"
    end 
  end
  
  private

  def quote_params
    params.require(:quote).permit(:saying, :author)
  end
end
