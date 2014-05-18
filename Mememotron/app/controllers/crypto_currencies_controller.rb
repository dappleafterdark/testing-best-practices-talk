class CryptoCurrenciesController < ApplicationController
  def index
    @crypto_currencies = CryptoCurrency.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @crypto_currencies }
    end
  end

  def show
    @crypto_currency = CryptoCurrency.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @crypto_currency }
    end
  end

  def new
    @crypto_currency = CryptoCurrency.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @crypto_currency }
    end
  end

  def edit
    @crypto_currency = CryptoCurrency.find(params[:id])
  end

  def create
    @crypto_currency = CryptoCurrency.new(params[:crypto_currency])

    respond_to do |format|
      if @crypto_currency.save
        format.html { redirect_to @crypto_currency, notice: 'Crypto currency was successfully created.' }
        format.json { render json: @crypto_currency, status: :created, location: @crypto_currency }
      else
        format.html { render action: "new" }
        format.json { render json: @crypto_currency.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @crypto_currency = CryptoCurrency.find(params[:id])

    respond_to do |format|
      if @crypto_currency.update_attributes(params[:crypto_currency])
        format.html { redirect_to @crypto_currency, notice: 'Crypto currency was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @crypto_currency.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @crypto_currency = CryptoCurrency.find(params[:id])
    @crypto_currency.destroy

    respond_to do |format|
      format.html { redirect_to crypto_currencies_url }
      format.json { head :no_content }
    end
  end
end
