# Usage:
#
# rake sequel:migrate
# rake sequel:migrate VERSION=0
# rake sequel:migrate VERSION=3
#
desc 'Sequel migration'
namespace :sequel do
  def path
    File.join(RAILS_ROOT, 'db', 'migrate')
  end
  
  namespace :migrate do
    desc 'Rollbacks the database one migration and re migrate up. If you want to rollback more than one step, define STEP=x'
    task :redo => [ 'sequel:rollback', 'sequel:migrate' ]
  end
  
  desc "Migrate the database through scripts in db/migrate. Target specific version with VERSION=x"
  task :migrate => :environment do
    if ENV['VERSION']
      Sequel::Migrator.apply(Sequel::Model.db, path, ENV['VERSION'].to_i)
    else
      Sequel::Migrator.apply(Sequel::Model.db, path)
    end
  end
  
  desc 'Rolls the schema back to the previous version. Specify the number of steps with STEP=n'
  task :rollback => :environment do
    step = ENV['STEP'] ? ENV['STEP'].to_i : 1
    version = Sequel::Migrator.get_current_migration_version(Sequel::Model.db) - step
    Sequel::Migrator.apply(Sequel::Model.db, path, version)
  end
  
  desc "Retrieves the current schema version number"
  task :version => :environment do
    puts "Current version: #{Sequel::Migrator.get_current_migration_version(Sequel::Model.db)}"
  end
end