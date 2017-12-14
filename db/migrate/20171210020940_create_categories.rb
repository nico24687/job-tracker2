class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :title
    end

    add_reference :jobs, :category, foreign_key: true
  end
end
