class AddAuthorToPosts < ActiveRecord::Migration

  class MigrationUser < ActiveRecord::Base
    self.table_name = 'users'
  end
  class MigrationPosts < ActiveRecord::Base
    self.table_name = 'posts'
  end

  def up
    add_column :posts, :author_id, :integer

    first_user = MigrationUser.first_or_create email: 'test_user@example.com'
    MigrationPosts.update_all(author_id: first_user.id)

    change_column :posts, :author_id, :integer, null: false

    add_foreign_key :posts, :users, column: :author_id
  end

  def down
    remove_foreign_key :posts, :users

    remove_column :posts, :author_id
  end
end
