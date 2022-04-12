class AddContextToMicroposts < ActiveRecord::Migration[6.1]
  def change
    add_column :microposts, :context, :text
  end
end
