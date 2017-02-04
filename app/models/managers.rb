manager_files = Dir.glob File.join Rails.root, 'app', 'models', 'managers', '*'
manager_files.each do |file|
  require file
end

module Managers
  extend Enumerable

  def self.list
    manager_names = constants - [:Manager]
    manager_names.map { |manager| const_get manager }
  end

  def self.each &block
    list.each(&block)
  end
end
