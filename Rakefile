
require 'rake'

task :build do
  sh 'bundle exec jekyll build -s wedding'
end

task :serve do
  sh 'bundle exec jekyll serve -w -s wedding'
end

task :deploy => [:build] do
  sh 'weddeploy'
end
