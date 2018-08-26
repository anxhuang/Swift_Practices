# Swift Practices

Version: Swift 4.1
Tools: macOS + Playground in Xcode 9.4.1

## The Basics
MyPlayground: var, let, String Interpolation, Multiline String Literals  
basic: Type Annotation, Emoji, Int.max, undersocore  
basic1: type conversion, Int(1.51) floor to 1, Type Alias, boolean, tuple(tag1:value1, tag2:value2), tuple.0, Optional Type, Forced Unwrapping, Optional Binding, Implicitly Optional Types, assert(condition, message)

## Basic Operators
operator: Assignment Operator, Arithmetic Operators  
operator1: Compound Assignment Operators, Comparison Operators, Ternary Conditional Operator(condition?true:flase), Nil-Coalescing Operator ?? valueIfNil, Range Operators n..<m, Logical Operators  

## Strings and Characters
StringAndCharacter: Multiline String Literals, String Mutability, Characters, String Interpolation, String Indices, Insert, Remove, Substrings  

## Collection Types
Array: Array(repeating: default-value, count: length), Accessing and Modifying, for (index, value) in array.enumerated(){}  
Set: Accessing and Modifying, set.sorted(), Fundamental Set Operations, Set Membership and Equality  
Dictionary: dictname[Int:String]=[key1:value1, key2:value2], Accessing and Modifying, Array Instance Conversion [Type](dictname.values)  

## Control Flows
controlFlow: For-In-Loops, stride(from:to:by:), While Loops, repeat{} while condition  
switch: No Implicit Fallthrough, Compound Cases, Interval Matching, Tuples, Value Bindings, Where, switch true, continue, Early Exit: guard else, Checking API Availability  

## Functions
function: func funcname(argumentLabel parameterName:type) -> returnType{}, Omitting Argument Labels: underscore "_", return Tuple  
function1: Default Parameter Values, Variadic Parameters(_:type...), In-Out Parameters(_:inout type)  
functionType: Function Types, Function Types as Parameter Types, Function Types as Return Types, Nested Functions  

## Closures
closure: {(parameter)->returnType in statements}, shorter expression, Trailing Closures, array.map{closure}  

## Enumerations
enumeration: enum EnumName{case c1,c2}, Matching with Switch, Associated Values
enumeration1: Raw Values enum EnumName:Type{case c1=raw1,c2=raw2}, c1 == EnumName(rawValue: raw1), Implicitly Assigned Raw Values ex.auto-increased int, Strings same as cases name  

## Structures and Classes
structureAndClass: struct StructName{}, Property, Instance, Accessing Properties	, Value Types and Reference Type, Identity Operators === or !==  

## Properties
property: Stored Properties, Lazy Stored Properties, Comupted Properties with get/set, Property Observers with willSet(newValue)/didSet(oldValue)  
globalAndLocalVar: Global and Local Variables, Type Properties with static/class and accessing by Type.Properties  

## Methods
method: 	functions belong to instance, "self", Mutating Method,  Type Methods with static/class, @discardableResult  

## Subscripts
subscript: subscript(index: Int) -> returnType{} with get/set, use by Type[Index]  

## Inheritance
inheritance: class SubClass:SuperClass{}, Base Class, Override, super.property or super.func(), Overriding Property Observers, Preventing Overrides with final  

## Initialization
initializer: init(){}, Customizing Initialization, Parameter Names and Argument Labels, Default Initializers, Memberwise Initializers for Structure Types, Initializer Delegation for Value Types (...parts of official docs)  

## Deinitialization
deinitialization: deinit{}, called automatically when instance being " = nil"  

## Optional Chaining
optionalChaining: ex. instance.optionalClass?.property?, instance.optionalClass?[i].property[j]!  

## Error Handling
errorHandling: enum EnumName:Error{case someError}, throw EnumName.someError, func funcName() throws { throw/try }, do{try statement }catch error{}, if(try? statement) == nil {}, try! statement, func funcName() throws { defer{} } => defer{} is ensured to execute even if throw error. 

## Type Casting
typeCasting: Checking Type => if sub is super{}, Downcasting => if let x = sub as? super{}, "Any" and "AnyObject"  

## Nested Types
nestedType: ex. struct StructName{enum InnerEnum:Type{struct InnerStruct{}}}

## Extensions
extension: extension SomeType:SomeProtocol{}, ext. Computed Properties, ext. Initializers, ext. Methods, ext. Mutating Instance Methods, ext. Subscripts, ext. Nested Type  

## Protocols
protocol: protocol ProtocolName{}, struct StructName:SomeProtocol{}, enum EnumName:SomeProtocol{}, Instance, Type, Mutating Method Requirements, Initializer Requirements, Protocols as Types  

## Generics
generic: func funcName<T>(arg: T){} <= Genetic Function with Type Parameter, struct StructName<Element>{} <= Genetic Type, Extending a Generic Type, Type Constraints, Associated Types (...part of official docs)  

