class AddAuthorToPosts < ActiveRecord::Migration

  class MigrationUser < ActiveRecord::Base
    self.table_name = 'users'
  end
  class MigrationPosts < ActiveRecord::Base
    self.table_name = 'posts'
  end

  def change

    add_column :posts, :author_id, :integer
    first_user = MigrationUser.all.first
    MigrationPosts.update_all(author_id: first_user.id)

    change_column :posts, :author_id, :integer, null: false

    add_foreign_key :posts, :users, column: :author_id
  end
end
