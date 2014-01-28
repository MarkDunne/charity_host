namespace :db do
  desc "Drops, recreates and seeds the database."
  task :rebuild => [:drop, :create, :migrate, :seed] do
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:seed'].invoke
  end
end
