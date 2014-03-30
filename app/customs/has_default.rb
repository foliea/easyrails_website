class HasDefault
  module Models
    def has_default
      before_destroy  :destroyable?
      before_save     :set_defaults_to_false,       if:     :default
      after_create    :set_default_if_none_exists,  unless: :default
      after_update    :fallback_default,            unless: :default

      #scope :defaults, -> { where(default: true) }

      extend  ClassMethods
      include InstanceMethods
    end

    module ClassMethods
      def get_default
        where(default: true).first
      end
    end

    module InstanceMethods

      private

      def destroyable?
        if default
          errors.add :default, (I18n.t 'error.destroy', class_name: self.class.name)
        end
        !default
      end

      def fallback_default
        set_default if default_was == true
        true
      end

      def set_default_if_none_exists
        set_default if self.class.get_default.nil?
        true
      end

      def set_default
        self.update_columns(default: true)
      end

      def set_defaults_to_false
        self.class.update_all(default: false) if (default_was == false || new_record?)
        true
      end
    end
  end
  ActiveRecord::Base.extend Models
end
