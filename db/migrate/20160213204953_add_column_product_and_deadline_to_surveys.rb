class AddColumnProductAndDeadlineToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :product, :string
    add_column :surveys, :deadline, :date
  end
end
