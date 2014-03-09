# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Default language
#Language.create(name: 'English', code: 'en', default: true)

# Default settings
Setting.create(keyname: 'site_title', value: 'Adrien Folie Tech Blog', value_format: 'string')
Setting.create(keyname: 'site_title_link', value: 'http://project-livec9baf8578360.rhcloud.com/', value_format: 'string')
Setting.create(keyname: 'site_owner', value: 'Adrien Folie', value_format: 'string')
## ATTENTION : retirer before_create si ça ne marche pas