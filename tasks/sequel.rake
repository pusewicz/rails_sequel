# Usage:
#
# rake sequel:migrate
# rake sequel:migrate VERSION=0
# rake sequel:migrate VERSION=3
#
desc 'Sequel migration'
namespace :sequel do
  task :migrate => :environment do
    path = File.join(RAILS_ROOT, 'db', 'migrate')
    if ENV['VERSION']
      Sequel::Migrator.apply(Sequel::Model.db, path, ENV['VERSION'].to_i)
    else
      Sequel::Migrator.apply(Sequel::Model.db, path)
    end
  end
end