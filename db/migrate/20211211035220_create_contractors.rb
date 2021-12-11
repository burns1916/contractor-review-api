class CreateContractors < ActiveRecord::Migration[6.1]
  def change
    create_table :contractors do |t|
      t.text :business_name
      t.integer :license_number
      t.timestamps
    end
  end
end
