class AddUserComments < ActiveRecord::Migration[5.1]
  def change
    create_table :user_comments do |t|
      t.string :comment
      t.string :ip
      t.timestamps
    end
  end
end
