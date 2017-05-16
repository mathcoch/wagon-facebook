class AddLinkedinToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :linkedin, :string
  end
end
