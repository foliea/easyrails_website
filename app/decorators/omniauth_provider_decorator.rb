class OmniauthProviderDecorator
  def initialize(provider, view_context)
    @provider = provider
    @view_context = view_context
  end

  def decorations
    {
      linkedin:      { icon: 'linkedin-square',    class: 'primary' },
      twitter:       { icon: 'twitter-square',     class: 'info'    },
      github:        { icon: 'github',             class: 'default' },
      google_oauth2: { icon: 'google-plus-square', class: 'danger'  }
    }
  end

  def title
    @provider.to_s.titleize
  end

  def icon
    decorations[@provider][:icon]
  end

  def classes
    "btn btn-#{decorations[@provider][:class]}"
  end

  def h
    @view_context
  end

  def to_sym
    @provider
  end
end
