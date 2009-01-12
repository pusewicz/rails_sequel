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
    if ARGV[1] =~ /VERSION=\d+/
      Sequel::Migrator.apply(Sequel::Model.db, path, ARGV[1].split('=')[1].to_i)
    else
      Sequel::Migrator.apply(Sequel::Model.db, path)
    end
  end
end