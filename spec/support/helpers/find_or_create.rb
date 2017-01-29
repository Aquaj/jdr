module FactoryGirl
  module Strategy
    class Find
      def association(runner)
        runner.run
      end

      def result(evaluation, only_overrides: false)
        match = only_overrides ? get_overrides(evaluation) : matcher_for(evaluation)
        build_class(evaluation).where(match).first
      end

      private

      def matcher_for(evaluation)
        overrides  = get_overrides(evaluation)
        attributes = evaluation.hash.merge(overrides)

        matcher    = attributes.each_with_object({}) do |override, findables|
          name, value = *override
          next findables[name] = value unless value.respond_to? :id

          findables[:"#{name}_id"]   = value.id
          findables[:"#{name}_type"] = value.class.name
        end

        matcher.select { |attr| build_class(evaluation).has_attribute?(attr) }
      end

      def build_class(evaluation)
        evaluation.instance_variable_get(:@attribute_assigner).instance_variable_get(:@build_class)
      end

      def get_overrides(evaluation = nil)
        return @overrides unless @overrides.nil?
        evaluation.instance_variable_get(:@attribute_assigner).instance_variable_get(:@evaluator).instance_variable_get(:@overrides).clone
      end
    end

    class FindOrCreate
      def initialize
        @strategy = FactoryGirl.strategy_by_name(:find).new
      end

      delegate :association, to: :@strategy

      def result(evaluation)
        found_object = @strategy.result(evaluation)

        if found_object.nil?
          @strategy = FactoryGirl.strategy_by_name(:create).new
          @strategy.result(evaluation)
        else
          found_object
        end
      end
    end
  end

  register_strategy(:find, Strategy::Find)
  register_strategy(:find_or_create, Strategy::FindOrCreate)
end
