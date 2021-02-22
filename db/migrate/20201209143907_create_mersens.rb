class CreateMersens < ActiveRecord::Migration[6.0]
  def change
    create_table :mersens do |t|
      t.string :input
      t.string :output

      t.timestamps
    end
  end
end
