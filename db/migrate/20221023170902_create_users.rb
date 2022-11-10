class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    User do |t|
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
