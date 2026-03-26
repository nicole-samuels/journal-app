class AddPatternIdToProjects < ActiveRecord::Migration[7.2]
  def change
    add_column :projects, :pattern_id, :integer
  end
end
