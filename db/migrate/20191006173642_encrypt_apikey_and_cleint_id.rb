class EncryptApikeyAndCleintId < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :api_key, :encrypted_api_key
    add_column :users, :encrypted_api_key_iv, :string

    rename_column :users, :api_client_id, :encrypted_api_client_id
    add_column :users, :encrypted_api_client_id_iv, :string
  end
end
