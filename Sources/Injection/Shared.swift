import SwiftUI

/// Shared property wrapper allows for the single instantation
/// and sharing of values across views.
@propertyWrapper
public struct Shared<Value>: DynamicProperty {
    
    @StateObject private var observed: Observed<Value>
    
    public var wrappedValue: Value {
        get { observed.wrappedValue }
        nonmutating set { observed.wrappedValue = newValue }
    }

    public var projectedValue: Binding<Value> {
        .init(get: { wrappedValue }, set: { wrappedValue = $0 })
    }
    
    public init(@Observed wrappedValue: Value, _ key: String? = nil) {
        let observedSingleton = Singletons.fetch(orInsert: _wrappedValue, forKey: key)
        self._observed = .init(wrappedValue: observedSingleton)
    }
}
