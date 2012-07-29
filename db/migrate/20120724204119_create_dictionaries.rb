class CreateDictionaries < ActiveRecord::Migration
  def change
    create_table :dictionaries do |t|
      t.string :collection
      t.string :column
      t.string :conditional
      t.string :keypart
      t.string :alias
      t.string :datatype
      t.boolean :require
      t.string :sm
      t.string :default
      t.string :conversion
      t.string :validation
      t.string :options
      t.string :label
      t.string :display
      t.string :characteristics

      t.timestamps
    end
  end
end
