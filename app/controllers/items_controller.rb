class ItemsController < ApplicationController
  before_action :logged_in_user , except: [:show]
  before_action :set_item, only: [:show]
  before_action :set_user, only: [:show]

  def new
    if params[:q]
      response = RakutenWebService::Ichiba::Item.search(
        keyword: params[:q],
        imageFlag: 1,
      )
      @items = response.first(20)
    end
  end

  def show
    @have = @item.have_users
    @want = @item.want_users
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def set_user
    @user = User.find(params[:id])
  end
end
