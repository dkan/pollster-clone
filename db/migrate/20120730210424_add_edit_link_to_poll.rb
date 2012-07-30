class AddEditLinkToPoll < ActiveRecord::Migration
  def change
    add_column :polls, :edit_link, :string
  end
end
