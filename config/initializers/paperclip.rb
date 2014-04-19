Paperclip::Attachment.default_options[:s3_host_name] = Proc.new { AppConfig['s3_host_name'] }
