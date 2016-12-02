class CreateSortStrategies < ActiveRecord::Migration
  def change
    create_table :sort_strategies do |t|

      t.timestamps null: false
    end
  end
end
