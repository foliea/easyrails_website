class Settings
  def self.reload
    AppConfig.reload
    ActiveAdmin.setup do |c|
      c.site_title = AppConfig['site_title']
      c.site_title_link = AppConfig['site_title_link']
    end
    if AppConfig['s3_host_name'].present?
      Paperclip::Attachment.default_options[:s3_host_name] = AppConfig['s3_host_name']
    end
  end
end
