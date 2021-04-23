class InquiryController < ApplicationController

  def index
    @user = current_user
    @inquiry = Inquiry.new
    render :action => 'index'
  end

  def confirm
    @user = current_user
    @inquiry = Inquiry.new(params[:inquiry].permit(:name, :email, :message))
    render 'index' if @inquiry.invalid?
  end

  def thanks
    @user = current_user
    @inquiry = Inquiry.new(params[:inquiry].permit(:name, :email, :message))
    InquiryMailer.received_email(@inquiry).deliver

    render :action => 'thanks'
  end
end
