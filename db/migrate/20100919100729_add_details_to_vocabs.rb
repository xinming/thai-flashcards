class AddDetailsToVocabs < ActiveRecord::Migration
  def self.up
    add_column :vocabs, :example, :string
  end

  def self.down
    remove_column :vocabs, :example
  end
end
