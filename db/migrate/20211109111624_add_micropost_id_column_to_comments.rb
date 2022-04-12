class AddMicropostIdColumnToComments < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :micropost, null: false, foreign_key: true
  end
end
