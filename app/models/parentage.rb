class Parentage < ApplicationRecord
  belongs_to :leads_to,      class_name: 'Career'
  belongs_to :source_career, class_name: 'Career'
end
