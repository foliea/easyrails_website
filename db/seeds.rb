settings = [
  # Default settings
  { keyname: 'site_title',            value: 'EasyRails Website',         value_format: 'string' },
  { keyname: 'site_owner',            value: '42th Lab',                  value_format: 'string' },
  { keyname: 'site_description',      value: 'Demo of EasyRailsWebsite',  value_format: 'string' },
  { keyname: 'site_date_start_end',   value: '2014',                      value_format: 'string' },
  { keyname: 'mailer_sender',         value: 'admin@foliea.io',           value_format: 'string' },
  { keyname: 'favicon_url',           value: 'https://avatars2.githubusercontent.com/u/7833986?s=140',
    value_format: 'string' },

  # Disqus
  { keyname: 'disqus_shortname',      value: 'easyrails_website',         value_format: 'string' },

  # Omniauth
  { keyname: 'enable_external_providers', value: 'true', value_format: 'boolean' }
]

settings.each do |attributes|
  Setting.create!(attributes)
end

# Default admin account
User.create!(email: 'admin@example.com', password: 'password', admin: true)

# Default language
Language.create!(name: 'English', locale: 'en', default: true)

# Default homepage
Page.create!(name: 'home', locale: 'en', content: '<h1>Home EN</h1>')
