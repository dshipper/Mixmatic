class AddFieldsToMix < ActiveRecord::Migration
  def change
    add_column :mixes, :recipient_name, :string
    add_column :mixes, :recipient_email, :string
  end
end
