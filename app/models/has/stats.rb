module Has
  module Stats
    extend ActiveSupport::Concern

    included do
      has_many   :base_stats
      has_many   :stats, through: :base_stats
    end

    def base_stat_of stat
      base_stats.find_by(stat: stat)
               &.value
    end
    alias base_stat_for base_stat_of

    def stat_of stat
      base    = base_stats.find_by stat: stat
      changes = base.stat_changes.pluck :amount
      base.value + changes.sum
    end
    alias stat_for stat_of

    def method_missing method_name, *args, &block
      stat = Stat[method_name]
      return stat_of stat if stat
      super
    end

    def respond_to_missing? method_name, _include_private = false
      Stat[method_name]
    end
  end
end
