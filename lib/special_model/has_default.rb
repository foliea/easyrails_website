module SpecialModel
  module HasDefault
    def has_default
      before_destroy :destroyable?
      before_save :reset_defaults
      after_create :change_default
      after_update :fallback

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

      def change_default
        return unless default_required?
        
        update_columns(default: true)
      end

      def fallback
        return unless fallback_required?
        
        update_columns(default: true)
      end

      def reset_defaults
        return unless default_change?
        
        self.class.update_all(default: false)
      end
      
      def default_required?
        !m.default && class.get_default.nil?
      end
      
      def fallback_required?
        !m.default && m.default_was == true
      end
      
      def default_change?
        default && (default_was != true || new_record?)
      end
    end
  end
  ActiveRecord::Base.extend HasDefault
end
