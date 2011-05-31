require 'active_record'

dbconfig = { adapter: 'sqlite3', database: ':memory:' }

ActiveRecord::Base.establish_connection(dbconfig)
ActiveRecord::Migration.verbose = false

class TestMigration < ActiveRecord::Migration
  def self.up
    create_table :candidates, force: true do |t|
      t.string :status
    end
  end

  def self.down
    drop_table :candidates
  end
end

class Candidate < ActiveRecord::Base
  extend Refined
  def self.status(value)
    where(status: value)
  end
end
