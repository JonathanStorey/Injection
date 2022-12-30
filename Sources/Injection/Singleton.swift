@propertyWrapper
public struct Singleton<T: AnyObject> {
    
    public let wrappedValue: T
    
    public init(wrappedValue: T, _ key: String? = nil) {
        let singleton = Singletons.fetch(orInsert: wrappedValue, forKey: key)
        self.wrappedValue = singleton
    }
}
