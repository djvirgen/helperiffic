class HelperBroker
  def initialize(teh_scope)
    @scope = teh_scope
    @helpers = {}
  end

  def helper(name)
    class_sym = "#{name.capitalize}Helper".to_sym
    @helpers[class_sym] ||= load_helper(class_sym)
  end
  
  def method_missing(method_sym, *args, &block)
    h = helper(method_sym)
    h.send(method_sym, *args, &block)
  end
  
  private
  
  def load_helper(class_sym)
    h = @scope.class.const_get(class_sym).new
    h.hb = self if h.respond_to? :"hb="
    h
  end
end

module Helperiffic
  def hb=(helperBroker)
    @hb = helperBroker
  end

  def hb
    @hb
  end
end