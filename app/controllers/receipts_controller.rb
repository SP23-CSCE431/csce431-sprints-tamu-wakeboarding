class ReceiptsController < ApplicationController
include ApplicationHelper
  before_action :set_receipt, only: %i[ show edit update destroy ]

  # GET /receipts or /receipts.json
  def index
    @user = current_admin
    @receipts = Receipt.all
  end

  # GET /receipts/1 or /receipts/1.json
  def show
    @user = current_admin
  end

  # GET /receipts/new
  def new
    @user = current_admin
    @receipt = Receipt.new
  end

  # GET /receipts/1/edit
  def edit
    @user = current_admin
  end

  # POST /receipts or /receipts.json
  def create
    @user = current_admin
    @receipt = Receipt.new(receipt_params)
    logger.info("In create the id: #{params[:receipt][:user_id]}")
    respond_to do |format|
      if has_info_filled_out(params[:receipt][:user_id])
        if @receipt.save
          format.html { redirect_to receipt_url(@receipt), notice: "Receipt was successfully created." }
          format.json { render :show, status: :created, location: @receipt }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @receipt.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receipts/1 or /receipts/1.json
  def update
    respond_to do |format|
      if @receipt.update(receipt_params)
        format.html { redirect_to receipt_url(@receipt), notice: "Receipt was successfully updated." }
        format.json { render :show, status: :ok, location: @receipt }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receipts/1 or /receipts/1.json
  def destroy
    @receipt.destroy

    respond_to do |format|
      format.html { redirect_to receipts_url, notice: "Receipt was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receipt
      @receipt = Receipt.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def receipt_params
      params.require(:receipt).permit(:user_id, :value, :date_made, :date_approved, :date_refunded, :stage, :image_link)
    end
end
