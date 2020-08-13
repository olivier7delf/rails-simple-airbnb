# class metaApplicationController < ApplicationController
#   def method_missing method, *args, &block
#     return super method, *args, &block unless false# [:show, :edit, :update, :destroy].include(method)
#     self.class.send(:define_method, method) do
#       puts "nothing"
#     end
#     self.send method, *args, &block
#   end
# end


class FlatsController < ApplicationController # metaApplicationController#
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  # def method_missing method, *args, &block
  #   raise
  #   byebug
  #   return super method, *args, &block unless [:show, :edit, :update, :destroy].include(method)
  #   self.class.send(:define_method, method) do
  #     puts "000000000000000000000000000000000000000000000000000000000000"
  #   end
  #   self.send method, *args, &block
  # end

  def index
    @flats = Flat.all
  end

  def new
    @flat = Flat.new
  end

  # def show
  # end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  # def edit
  #   # set_flat
  #   # raise
  # end

  def update
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  def search
    @flats = Flat.where("name LIKE '%#{params[:query]}%'")
  end

  private

  def flat_params
    params.require('flat').permit(:name, :address, :description, :price_per_night, :number_of_guest, :picture_url)
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
