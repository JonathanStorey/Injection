import Combine

@propertyWrapper
public class Observed<Value>: ObservableObject {
    
    @Published public var wrappedValue: Value
    
    private var cancellable : AnyCancellable?
    
    public init(wrappedValue: Value) {
        self.wrappedValue = wrappedValue
    }
    
    public init(wrappedValue: Value) where Value: ObservableObject {
        self.wrappedValue = wrappedValue
        cancellable = wrappedValue.objectWillChange.sink { [weak self] _ in
            self?.objectWillChange.send()
        }
    }
    
    public init(wrappedValue: Value) where Value: AnyObject {
        self.wrappedValue = wrappedValue
        print("""
            Shared value type is a non-observable class object.  The View
            will not be notified on any changes to the object. Consider
            having the class conform to ObservableObject.
            """)
    }

}
