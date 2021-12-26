class CustomersController < ApplicationController

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def show
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
      redirect_to customers_path(@customer.id)
    else
      render :show
    end
  end

  def withdraw #退会処理
    # = current_customerでも作動するはずもしくはshowと揃える。defult:falseないので実行未確認
    @customer = current_customer
    #is_deletedカラムをtrueに変更することで論理削除フラグを立てる
    @customer.update(is_deleted: true)
    #セッション情報を全て削除
    reset_session
    flash[:notice] = "退会処理を実行しました。またのご利用を心よりお待ちしております"
    #退会後にトップ画面に遷移
    redirect_to root_path
  end

  def unsubscribe #退会画面表示
  end

end
