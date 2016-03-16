class CreateAvatars < ActiveRecord::Migration
  def change
    create_table :avatars do |t|
      t.string :photo
      t.references :avatarable, :polymorphic => true #这里指明了多态，这样会生成comment_id和comment_type这两个字段的
      t.timestamps
    end
  end
end
