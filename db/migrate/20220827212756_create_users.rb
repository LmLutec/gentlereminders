class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :role
      t.json :favs
      t.json :hidden
      t.json :read

      t.timestamps
    end
  end
end
