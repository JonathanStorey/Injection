/// Dictionary-backed storage allowing for for single
/// instantiation and retrieval of class objects.
public struct Singletons {
    
    private static var dictionary : [String : AnyObject] = [:]
    
    private static func key<T: AnyObject>(for type: T.Type, key: String? = nil) -> String {
        let type = String(reflecting: T.self) // describing: String; reflecting: Swift.String
        guard let key else { return type } // returns Swift.String
        return type + "." + key // returns Swift.String.key
    }
    
    /// Returns a single instance of a class object.
    /// If no class is found, it creates and inserts
    /// the object based on the provided default
    /// value.
    public static func fetch<Object: AnyObject>(orInsert object: @autoclosure () -> Object, forKey key: String? = nil) -> Object {
        
        let key = Singletons.key(for: Object.self, key: key)
        
        if let object = dictionary[key] {
            return object as! Object
        }
        
        else {
            dictionary[key] = object()
            return dictionary[key] as! Object
        }
    }
    
    private init() {}
}
