module Refined
  if defined? Rails::Railtie
    class Railtie < Rails::Railtie
      initializer "refined.extend_active_record_base" do |app|
        ActiveSupport.on_load(:active_record) do
          Refined::Railtie.insert
        end
      end
    end
  end

  class Railtie
    def self.insert
      ActiveRecord::Base.send(:extend, Refined)
    end
  end
end
