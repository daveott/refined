module Refined
  autoload :ScopeChain, "refined/scope_chain"
  autoload :Railtie, "refined/railtie"

  def self.extended(base)
    @@klass = base.to_s
  end

  def klass
    @@klass
  end

  def refined(criteria)
    Refined::ScopeChain.new(klass, criteria).chain!
  end
end
