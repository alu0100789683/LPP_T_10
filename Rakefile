require "bundler/gem_tasks"
task :default => :spec

desc "Ejecutar espectativas"
task :spec do
  sh "rspec -I. spec/simpleChoice_spec.rb"
  sh "rspec -I. spec/list_spec.rb"
end

task :html do
  sh "rspec -f h spec/simpleChoice_spec.rb"
end

