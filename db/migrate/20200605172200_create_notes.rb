class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.integer :page_number
      t.string :summary
      t.string :questions
      # t.datetime :created_at, null: false
      # t.datetime :updated_at, null: false
      t.integer :user_id
      t.integer :book_id
      t.timestamps
    end
  end
end
