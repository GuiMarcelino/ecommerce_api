Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    wirh.library :rails
  end
end