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
    @quotes = Quote.all
  end

  def author
    @quote = Quote.starting_with_yes
  end
  
  private

  def quote_params
    params.require(:quote).permit(:saying, :author)
  end
end
