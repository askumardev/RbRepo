# The Observer pattern defines a one-to-many dependency 
# between objects so that when one object changes state, all its dependents are notified and updated automatically.

class Subject
  def initialize
    @observers = []
  end

  def add_observer(observer)
    @observers << observer
  end

  def notify_observers
    @observers.each { |observer| observer.update }
  end
end

class Observer
  def update
    raise NotImplementedError, "This method should be overridden"
  end
end

class ConcreteObserver < Observer
  def update
    puts "Observer has been notified!"
  end
end

subject = Subject.new
observer1 = ConcreteObserver.new
observer2 = ConcreteObserver.new

subject.add_observer(observer1)
subject.add_observer(observer2)

subject.notify_observers

# ruby design_patterns/observer_dp.rb