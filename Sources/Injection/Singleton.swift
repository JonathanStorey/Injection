@propertyWrapper
public struct Singleton<T: AnyObject> {
    
    public let wrappedValue: T
    
    public init(wrappedValue: T, _ key: String? = nil) {
        let singleton = Singletons.fetch(orInsert: wrappedValue, forKey: key)
        self.wrappedValue = singleton
    }
    
    public init(initialValue: T, forKey key: String? = nil) {
        self.init(wrappedValue: initialValue, key)
    }
    
//     public init<Value>(@Observed initialValue: Value, forKey key: String? = nil) where T: Observed {
//         self.init(wrappedValue: _initialValue, key)
//     }
}
