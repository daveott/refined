require 'active_record'

dbconfig = { adapter: 'sqlite3', database: ':memory:' }

ActiveRecord::Base.establish_connection(dbconfig)
ActiveRecord::Migration.verbose = false

class TestMigration < ActiveRecord::Migration
  def self.up
    create_table :candidates, force: true do |t|
      t.string :status
    end

    create_table :skills, force: true do |t|
      t.string :name
    end
  end

  def self.down
    drop_table :skills
    drop_table :candidates
  end
end

class Candidate < ActiveRecord::Base
  def self.status(value)
    where(status: value)
  end
end

class Skill < ActiveRecord::Base; end
