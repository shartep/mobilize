class CreateInvites < ActiveRecord::Migration[6.0]
  def change
    create_table :invites do |t|
      t.belongs_to :member, foreign_key: true
      t.boolean :delivered
      t.string :response

      t.timestamps
    end
  end
end
