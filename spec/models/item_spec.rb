require 'rails_helper'

RSpec.describe Item, type: :model do
  describe Item do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品機能' do
      context '商品出品がうまく行くとき' do
        it 'name, description, category_id, state_id, delivery_charge_id, time_to_ship_id, ship_from_id, price, imageが存在すれば出品できること' do
          expect(@item).to be_valid
        end
      end

      context '商品出品がうまくいかないとき' do
        it 'nameが空だと出品できない' do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it 'descriptionが空では出品できない' do
          @item.description = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end
        it 'category_idが空では出品できない' do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end
        it 'state_idが空では出品できない' do
          @item.state_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("State can't be blank")
        end
        it 'delivery_charge_idが空では出品できない' do
          @item.delivery_charge_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery charge can't be blank", 'Delivery charge is not a number')
        end
        it 'time_to_ship_idが空では出品できない' do
          @item.time_to_ship_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Time to ship can't be blank", 'Time to ship is not a number')
        end
        it 'ship_from_idが空では出品できない' do
          @item.ship_from_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Ship from can't be blank", 'Ship from is not a number')
        end
        it 'priceが空では出品できない' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it 'imageが1枚でないと出品できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it '価格の範囲が299円以下だと出品できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not included in the list')
        end
        it '価格の範囲が10,000,000以上では出品できない' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not included in the list')
        end
        it '販売価格は半角数字のみ保存可能であること' do
          @item.price = '１'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not included in the list')
        end
        it 'カテゴリーの情報にid:1が選択されている場合出品できないこと' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Category must be other than 1')
        end
        it '商品の状態についてid:1が選択されている場合出品できないこと' do
          @item.state_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('State must be other than 1')
        end
        it '配送料についてid:1が選択されている場合出品できないこと' do
          @item.delivery_charge_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Delivery charge must be other than 1')
        end
        it '商品発送にかかる日数についてid:1が選択されている場合出品できないこと' do
          @item.time_to_ship_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Time to ship must be other than 1')
        end
        it '発送元についてid:1が選択されている場合出品できないこと' do
          @item.ship_from_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Ship from must be other than 1')
        end
      end
    end
  end
end
