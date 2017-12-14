class CascadeDeletions < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :comments, :jobs
    remove_foreign_key :jobs, :categories

    add_foreign_key :comments, :jobs, on_delete: :cascade
    add_foreign_key :jobs, :categories, on_delete: :cascade
  end
end
