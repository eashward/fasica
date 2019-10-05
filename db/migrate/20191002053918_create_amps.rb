# frozen_string_literal: true

class CreateAmps < ActiveRecord::Migration[5.2]
  def change
    create_table :amps do |t|
      t.references :user, null: false
      t.json :event_data, null: false
      t.timestamps
    end
  end

  def down
    drop_table :amps
  end
end
