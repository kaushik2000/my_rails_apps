class CreateConsumers < ActiveRecord::Migration[6.0]
  def change
    create_table :consumers do |t|
      t.string :flat_no
      t.string :resident_name
      t.string :resident_type
      t.string :contact_no
      t.string :email_id
      t.timestamps
    end
  end
end
