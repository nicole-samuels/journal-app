class AddPhotoToProjects < ActiveRecord::Migration[7.2]
  def change
    add_column :projects, :photo, :string
  end
end
