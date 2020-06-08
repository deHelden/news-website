source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'aasm', '~> 5.0.1'
gem 'activeadmin', '~> 1.4.3'
gem 'aws-sdk', '~> 2'
gem 'bootstrap', '~> 4.1.3'
gem 'cancancan', '~> 2.0'
gem 'coffee-rails', '~> 4.2'
gem 'devise', '~> 4.5.0'
gem 'devise-bootstrap-views', '~> 1.1.0'
gem 'elasticsearch-model', git: 'git://github.com/elastic/elasticsearch-rails.git'
gem 'elasticsearch-rails', git: 'git://github.com/elastic/elasticsearch-rails.git'
gem 'html2slim', '~> 0.2.0'
gem 'impressionist', '~> 1.6.1'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails', '~> 4.3.3'
gem 'kaminari', '~> 1.2.1'
gem 'paperclip', '~> 6.0.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'pry', '~> 0.11.3'
gem 'puma', '~> 4.3'
gem 'rails', '~> 5.1.6', '>= 5.1.6.1'
gem 'rubocop', '~> 0.61.1'
gem 'sass-rails', '~> 5.0'
gem 'searchkick', '~> 3.1.2'
gem 'simple_form', '~> 5.0.2'
gem 'slim', '~> 4.0.1'
gem 'slim-rails', '~> 3.2.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'annotate', '~> 2.7.4'
  gem 'bullet', '~> 5.9.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
