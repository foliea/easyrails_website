# Default admin account
User.create(email: 'admnin@exemple.com', password: 'password', admin: true)

# Default language
Language.create(name: 'English', code: 'en', default: true)

# Default settings
Setting.create(keyname: 'site_title', value: 'Adrien Folie Tech Blog', value_format: 'string')
Setting.create(keyname: 'site_title_link', value: 'http://project-livec9baf8578360.rhcloud.com/', value_format: 'string')
Setting.create(keyname: 'site_owner', value: 'Adrien Folie', value_format: 'string')

