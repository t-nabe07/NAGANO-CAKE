class AddressesController < ApplicationController
  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to addresses_path
  end

  def index
    @addresses = Address.all
    @address = Address.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def address_params
    params.require(:address).permit(:postcode, :address, :name, :full_address)
  end

end
