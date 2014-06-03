Paperclip::Attachment.default_options[:s3_host_name] = proc { AppConfig['s3_host_name'] }
