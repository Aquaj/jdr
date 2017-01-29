module Has
  module Stats
    extend ActiveSupport::Concern

    class_methods do
      def has_stats
        define_method :base_stat_of do |stat|
          base_stats.find_by(stat: stat)
                   &.value
        end
        alias_method :base_stat_for, :base_stat_of

        define_method :stat_of do |stat|
          base    = base_stats.find_by stat: stat
          changes = base.stat_changes.pluck :amount
          base.value + changes.sum
        end
        alias_method :stat_for, :stat_of
      end
    end
  end
end
