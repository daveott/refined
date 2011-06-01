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

  def construct(attr, value)
    return unless constant_name.attribute_method?(attr)
    insert_method(attr, value) unless constant_name.respond_to?(attr)
  end

  def chain!
    return constant_name.scoped unless criteria.present?
    criteria.inject(constant_name) do |model, (method, arg)|
      construct(method, arg)
      model.send(method, arg)
    end
  end

  private
  def insert_method(attr, value)
    constant_name.send :define_singleton_method, attr do |arg|
      where(attr => value)
    end
  end
end
