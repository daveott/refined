module Refined
  autoload :ScopeChain, "refined/scope_chain"

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
