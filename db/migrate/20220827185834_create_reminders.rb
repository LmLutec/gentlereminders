class CreateReminders < ActiveRecord::Migration[6.0]
  def change
    create_table :reminders do |t|
      t.string :message
      t.string :author

      t.timestamps
    end
  end
end
