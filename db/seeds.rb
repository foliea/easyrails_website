# Default admin account
User.create(email: 'admin@example.com', password: 'password', admin: true)

# Default language
Language.create(name: 'English', code: 'en', default: true)

settings = [
  # Default settings
  { keyname: 'site_title',            value: 'EasyRails Website',          value_format: 'string' },
  { keyname: 'site_title_link',       value: '127.0.0.1:3000',             value_format: 'string' },
  { keyname: 'site_owner',            value: 'EasyRails',                  value_format: 'string' },
  { keyname: 'site_description',      value: 'This is easy rails website', value_format: 'string' },
  { keyname: 'site_date_start_end',   value: '2014',                       value_format: 'string' },
  # Amazon Web Services
  { keyname: 's3_host_name',          value: 's3-eu-west-1.amazonaws.com', value_format: 'string' }
]

settings.each do |attributes|
  Setting.find_or_initialize_by(keyname: attributes[:keyname]).tap do |s|
    s.value = attributes[:value]
    s.value_format = attributes[:value_format]
    s.save!
  end
end
