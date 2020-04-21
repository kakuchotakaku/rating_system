# frozen_string_literal: true

class BaseService
  def initalize
    raise NotImplementedError, "You must implement #{self.class}##{__method__}"
  end

  def validate
    raise NotImplementedError, "You must implement #{self.class}##{__method__}"
  end

  def execute
    raise NotImplementedError, "You must implement #{self.class}##{__method__}"
  end
end
