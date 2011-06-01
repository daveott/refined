require "refined/railtie"

module Refined
  autoload :ScopeChain, "refined/scope_chain"
  autoload :Railtie, "refined/railtie"

  def refined(criteria)
    Refined::ScopeChain.new(self.to_s, criteria).chain!
  end
end
