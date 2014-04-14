class OmniauthProviderDecorator
  @@decorations =
  {
    linkedin:      { icon: 'linkedin-square',    klass: 'primary' },
    twitter:       { icon: 'twitter-square',     klass: 'info'    },
    github:        { icon: 'github',             klass: 'default' },
    google_oauth2: { icon: 'google-plus-square', klass: 'danger'  }
  }

  def initialize(provider)
    @provider = provider
  end

  def title
    @provider.to_s.titleize
  end

  def icon
    @@decorations[@provider][:icon]
  end

  def classes
    "btn btn-#{@@decorations[@provider][:klass]}"
  end

  def to_sym
    @provider
  end
end
