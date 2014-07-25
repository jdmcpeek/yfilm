class AddVideoToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :video_html, :string
  end
end
