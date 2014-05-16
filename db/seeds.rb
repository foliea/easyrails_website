# Default admin account
User.create(email: 'admin@example.com', password: 'password', admin: true)

# Default language
Language.create(name: 'English', locale: 'en', default: true)

settings = [
  # Default settings
  { keyname: 'site_title',            value: 'Adrien Folie',               value_format: 'string' },
  #{ keyname: 'site_title_link',       value: 'http://www.foliea.io',       value_format: 'string' },
  { keyname: 'site_owner',            value: 'Adrien Folie',               value_format: 'string' },
  { keyname: 'site_description',      value: 'Adrien Folie blog',          value_format: 'string' },
  { keyname: 'site_date_start_end',   value: '2014',                       value_format: 'string' },
  { keyname: 'mailer_sender',         value: 'adrien@foliea.io',           value_format: 'string' },
  { keyname: 'favicon_url',           value: 'https://s.gravatar.com/avatar/6b030f9d40af0aacef77ba4ba2076985?s=40',
                                      value_format: 'string' },
  # Amazon Web Services
  { keyname: 's3_host_name',          value: 's3-eu-west-1.amazonaws.com', value_format: 'string' },
  # Disqus
  { keyname: 'disqus_shortname',      value: 'adrienfolie',                value_format: 'string' }
]

settings.each do |attributes|
  Setting.find_or_initialize_by(keyname: attributes[:keyname]).tap do |s|
    s.value = attributes[:value]
    s.value_format = attributes[:value_format]
    s.save!
  end
end

Page.create(name: 'home', locale: 'en', content: '<h1>Home EN</h1>')
#Page.create(name: 'home', locale: 'fr', content: '<h1>Home FR</h1>')

Setting.find_by(keyname: 'site_title_link').destroy!
