class AddConfirmedToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :confirmed, :boolean, default: false
    add_column :projects, :screening, :boolean, default: false
  end
end
