class CreatePurchaseRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_records do |t|

      t.timestamps
      t.references :user,           foreign_key: true
      t.references :item,           foreign_key: true
    end
  end
end
