class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :user_name
      t.attachment :profile_pic

      t.timestamps null: false
    end
  end
end
