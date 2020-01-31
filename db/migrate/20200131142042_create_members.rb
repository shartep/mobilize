class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :email, index: true
      t.string :name

      t.timestamps
    end
  end
end
