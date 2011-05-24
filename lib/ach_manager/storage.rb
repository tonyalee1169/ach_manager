ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :host => "localhost",
  :database => "ach_database.sqlite3"
)

puts "Migrating database..."
migrations_directory = File.expand_path("#{__FILE__}/../../../migrations")

ActiveRecord::Migration.verbose = false
ActiveRecord::Migrator.migrate(migrations_directory)
