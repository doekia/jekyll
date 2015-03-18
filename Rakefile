
require 'rake'

task :build do
  sh "bundle exec jekyll build -s #{ENV['PWD']}/wedding"
end

task :serve do
  sh "bundle exec jekyll serve -w -s #{ENV['PWD']}/wedding"
end

task :deploy => [:build] do
  sh 'weddeploy'
end
