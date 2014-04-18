module Settings
  extend self
  
  def reload
    AppConfig.reload
    ActiveAdmin.setup do |c|
      c.site_title = proc { AppConfig['site_title'] }
      c.site_title_link = proc { AppConfig['site_title_link'] }
    end
    Paperclip::Attachment.default_options[:s3_host_name] = proc { AppConfig['s3_host_name'] }
  end
end
