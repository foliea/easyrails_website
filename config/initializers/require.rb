Dir[File.join(Rails.root, "app", "others", "*", "*.rb")].each { |path| require path }
