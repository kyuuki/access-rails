class CreateAccesses < ActiveRecord::Migration[7.0]
  def change
    create_table :accesses do |t|
      t.references :client, null: false, foreign_key: true
      t.string :ip
      t.string :user_agent
      t.string :host
      t.string :referer

      t.timestamps
    end
  end
end
