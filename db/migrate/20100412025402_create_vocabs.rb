class CreateVocabs < ActiveRecord::Migration
  def self.up
    create_table :vocabs do |t|
      t.string :thai
      t.string :english
      t.string :pronunciation
      t.boolean :done, :default=>false

      t.timestamps
    end
  end

  def self.down
    drop_table :vocabs
  end
end
