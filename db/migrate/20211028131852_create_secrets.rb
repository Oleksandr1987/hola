class CreateSecrets < ActiveRecord::Migration[6.1]
  def change
    create_table :secrets do |t|
      t.text :comment

      t.timestamps
    end
  end
end
