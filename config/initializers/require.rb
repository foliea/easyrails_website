Dir[File.join(Rails.root, 'app', 'others', '**', '*.rb')].each { |path| require path }
Dir[File.join(Rails.root, 'lib', 'special_model', '**', '*.rb')].each { |path| require path }
