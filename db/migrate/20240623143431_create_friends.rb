class CreateFriends < ActiveRecord::Migration[7.1]
  def change
    create_table :friends do |t|
      t.string :name
      t.bigint :phone
      t.string :github
      t.string :email
      t.string :hobby
      t.string :location

      t.timestamps
    end
  end
end
