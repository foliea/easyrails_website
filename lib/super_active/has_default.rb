module SuperActive
  module HasDefault
    def has_default
      before_destroy :destroyable?
      before_save :reset_defaults
      after_create :change_default
      after_update :fallback

      extend  ClassMethods
      include InstanceMethods
    end

    module ClassMethods
      def default
        find_by(default: true)
      end
    end

    module InstanceMethods
      private

      def destroyable?
        if default
          # add super_active.yml after moving as a gem
          error_msg = I18n.t('error.destroy', model: self.class.name)
          errors[:default] << error_msg
        end
        !default
      end

      def reset_defaults
        return unless default_changed?

        self.class.update_all(default: false)
      end

      def change_default
        return unless default_can_change?

        update_columns(default: true)
      end

      def fallback
        # for future update : stop falling back silently
        return unless fallback_required?

        update_columns(default: true)
      end

      def default_changed?
        default && (default_was != true || new_record?)
      end

      def default_can_change?
        !default && self.class.default.nil?
      end

      def fallback_required?
        !default && default_was == true
      end
    end
  end
  ActiveRecord::Base.extend HasDefault
end
