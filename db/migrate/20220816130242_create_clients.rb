class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :latest_ip
      t.string :latest_user_agent

      t.timestamps
    end
  end
end
