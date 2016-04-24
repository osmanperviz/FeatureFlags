desc 'Create flags toggle config class file'

task :flags_toggle_config do
  copy_file("#{Gem.loaded_specs["FlagsToggle"].full_gem_path}/config/flags.rb","initializers/flags.rb")
end
