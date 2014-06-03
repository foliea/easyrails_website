module SpecialModel
  module HasDefault
    def has_default
      before_destroy :destroyable?

      # If model is selected as default
      before_save :set_defaults_to_false, if: proc { |m|  m.default && (m.default_was != true || m.new_record?) }
      # If no other default exist
      after_create :set_as_default,        if: proc { |m| !m.default && m.class.get_default.nil? }
      # If fallback is required
      after_update :set_as_default,        if: proc { |m| !m.default && m.default_was == true }

      extend ClassMethods
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

      def set_as_default
        update_columns(default: true)
      end

      def set_defaults_to_false
        self.class.update_all(default: false)
      end
    end
  end
  ActiveRecord::Base.extend HasDefault
end
