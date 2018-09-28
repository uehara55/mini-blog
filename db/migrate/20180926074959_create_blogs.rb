class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.string  :title
      t.text    :text
      t.text    :image
      t.integer  :size
      t.timestamps
    end
  end
end
