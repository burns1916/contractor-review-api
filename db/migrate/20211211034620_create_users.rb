class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.integer :meta_id
      t.text :meta_type
      t.text :email
      t.text :password_digest
      t.timestamps
    end
  end
end
