class FailChecker
  module Models
    def fail_check sym, *args, &block
      @sym = sym
      @args = args
      @block = block

      after_validation "#{@sym.to_s}_check".to_sym

      extend  ClassMethods
      include InstanceMethods
    end

    module ClassMethods

      private

      def fail_check_sym
        @sym
      end

      def fail_check_args
        @args
      end

      def fail_check_block
        @block
      end
    end

    module InstanceMethods

      private

      def validation_check
        sym = self.class.send(:fail_check_sym)
        args = self.class.send(:fail_check_args)
        block = self.class.send(:fail_check_block)

        if block.nil?
          args.each do |a|
            puts "#{self.class} : #{a} #{self.errors[a]}" if self.errors[a].present?
          end
        else
          args.collect &block
        end
      end

    end
  end
  ActiveRecord::Base.extend Models
end
