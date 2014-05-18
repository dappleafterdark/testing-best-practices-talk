class CreateCryptoCurrencies < ActiveRecord::Migration
  def change
    create_table :crypto_currencies do |t|
      t.text :description

      t.timestamps
    end
  end
end
