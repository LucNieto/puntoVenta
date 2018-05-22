class SalesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
  end

  def show
  end

  def edit
  end

  private
    def set_sale
      @sale = Sale.find params[:id]
    end
end
