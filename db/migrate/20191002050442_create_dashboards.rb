# frozen_string_literal: true

class CreateDashboards < ActiveRecord::Migration[5.2]
  def up
    create_table :dashboards, &:timestamps
  end

  def down
    drop_table :dashboards
  end
end
