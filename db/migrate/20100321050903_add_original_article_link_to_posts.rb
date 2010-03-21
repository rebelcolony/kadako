class AddOriginalArticleLinkToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :original_article, :string
  end

  def self.down
    remove_column :posts, :original_article
  end
end
