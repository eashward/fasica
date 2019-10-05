# frozen_string_literal: true

class AddSecretsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :api_client_id, :string
    add_column :users, :api_key, :string
  end
end
