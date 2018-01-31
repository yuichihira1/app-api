source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end



gem 'rails', '~> 5.1.4'
gem 'mysql2', '>= 0.3.18', '< 0.5'
gem 'puma', '~> 3.7'
gem 'bcrypt', '~> 3.1.7'
gem 'capistrano-rails', group: :development
gem 'rack-cors'
gem 'devise'
gem 'active_model_serializers'
gem 'pry-rails'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem "rspec-rails"
  gem "factory_bot_rails", "~> 4.0"
  gem "database_rewinder"
  gem "rspec-request_describer"
  gem "autodoc"
  gem "rspec-json_matcher"
end


