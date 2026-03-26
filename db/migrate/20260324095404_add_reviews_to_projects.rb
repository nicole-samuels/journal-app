class AddReviewsToProjects < ActiveRecord::Migration[7.2]
  def change
    add_column :projects, :project_difficulty_review, :integer
    add_column :projects, :yarn_softness_review, :integer
    add_column :projects, :pattern_clarity_review, :integer
    add_column :projects, :comment, :string
  end
end
