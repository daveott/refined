class Refined::ScopeChain
  attr_accessor :criteria
  attr_reader :constant_name

  def initialize(name, criteria={})
    self.constant_name = name
    self.criteria = criteria
  end

  def constant_name=(name)
    @constant_name ||= name.constantize
  end

  def construct(name, value)
    constant_name.send :define_singleton_method, name do |arg|
      where(name => value)
    end unless constant_name.respond_to?(name)
  end

  def chain!
    return constant_name.scoped unless criteria.present?
    criteria.inject(constant_name) do |model, (method, arg)|
      construct(method, arg)
      model.send(method, arg)
    end
  end

end
