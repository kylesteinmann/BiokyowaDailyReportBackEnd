# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"

Rails.application.load_tasks


namespace :assets do
    task :precompile do
        Rake::Task['assets:precompile'].invoke
    end
end

namespace :assets do
    desc 'Clean compiled assets'
    task clean: :environment do
      assets_dir = Rails.root.join('public', 'assets')
      if Dir.exist?(assets_dir)
        puts "Cleaning assets directory: #{assets_dir}"
        FileUtils.rm_rf(assets_dir)
      else
        puts 'No assets directory found. Nothing to clean.'
      end
    end
  end