class Stat
  module StatAliases
    extend ActiveSupport::Concern

    BASE_STATS = %i(combat_capacity aiming_capacity strength
                    endurance       agility         intelligence
                    mental_strength sociability

                    attack          health_points   strength_bonus
                    endurance_bonus movement        magic
                    folly_points    destiny_points)

    Translator = Hash.new { [] }
    BASE_STATS.each { |stat| Translator[stat] = stat }

    class_methods do
      def define_alias stat_alias, name
        st_alias = normalize_alias stat_alias
        StatAliases::Translator[st_alias] = name
      end

      def stat_name_for stat_alias
        st_alias = normalize_alias stat_alias
        return st_alias if StatAliases::Translator.values.include? st_alias

        StatAliases::Translator[st_alias]
      end

      def normalize_alias stat_alias
        stat_alias.downcase
      end
    end
  end
end
