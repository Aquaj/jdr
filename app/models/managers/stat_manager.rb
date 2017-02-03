module Managers
  class StatManager < Manager
    needs_from_owner :base_stats

    def base_stat_of stat
      base_stats.find_by(stat: stat)
               &.value
    end

    def stat_of stat
      base    = base_stats.find_by stat: stat
      changes = base.stat_changes.pluck :amount
      base.value + changes.sum
    end

    def method_missing method_name, *args, &block
      stat   = Stat[method_name]
      return stat_of stat if stat

      stat_name = extract_base_from method_name
      stat      = Stat[stat_name]
      return base_stat_of stat if stat
      super
    end

    def respond_to_missing? method_name, _include_private = false
      return true if Stat[method_name]
      stat_name = extract_base_from method_name
      return true if Stat[stat_name]
    end

    def extract_base_from name
      match_base = name.to_s.match %r(base_(.*))
      match_base && match_base[1].to_sym
    end
  end
end
