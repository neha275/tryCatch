

# Swift try v/s try? v/s try!

## try:
- try is a method that throws an error for you
- try using a do-catch block. We can't use try to stand alone.

## try?
- ? appeared means we are dealing with optional values.
- The result of try? throwing an expression is an optional value.
- It is nil if an error throw and wrapped values otherwise
- if..let is used to wrap the optional value try?

## try!
- try! mean we do not care about the possible error cases at all. It will crash the application.
- It is the do-or-die approach. we generally avoid using try! for error handling.


https://www.instagram.com/p/Cn-M5NAB7u8/
