# Pure

Pure is a Dart package that brings functional programming essentials through extension methods. It offers function composition/pipes, function memoization, partial application, and recursion trampolines. 

## Extensions

Down are listed extensions included in the `pure` package. Every extension is valid from 0/1 arguments up to 9 arguments.

### Composition

Provides function composition functionality. 

Substituting function application with composition or pipes helps to make code more readable and reduces nesting.

```dart
double intToDouble(int x) => x.toDouble();
String doubleToString(double x) => x.toString();

/// Traditional application
String intToStringApplication(int x) => doubleToString(intToDouble(x));

/// Composition
final intToStringComposition = doubleToString.dot(intToDouble);

/// Pipes
String intToStringPipe1(int x) => x.pipe(intToDouble).pipe(doubleToString); 
// or 
String intToStringPipe2(int x) => intToDouble(x).pipe(doubleToString); 
```

### Recursion Trampolines

Provides stack-safe recursion functionality. 

Trampolines essentially do the same work as compiler's tail call optimization – flatten the stack of calls, making function never exceeding stack and never resulting in Stack Overflow.

```dart
/// Regular
int regularSum(int number, int sum) =>
    number == 0 ? sum : regularSum(number - 1, sum + number);

/// Trampolined
Tram<int> tramSum(int number, int sum) => number == 0
    ? Tram.done(sum)
    : Tram.call(() => tramSum(number - 1, sum + number));

final n = 99999999;

final trampolined1 = tramSum.bounce(n, 0); // 4999999950000000
// or
final trampolined12 = tramSum(n, 0).bounce(); // 4999999950000000

final regular = regularSum(n, 0); // Unhandled exception: Stack Overflow
```

### Memoization

Provides hash-based memoization functionality. 

Allows to perform optimization and perform actual computations only when inputs given to the function are given for the first time. It is highly discouraged to use memoization on impure functions, mainly because it does not make very much sense.

Below, memoization is used on an impure function only for demonstrational purposes.

```dart
int Function(int base) newCounter() {
  var counter = 0;
  return (base) => base + counter++;
}

final counter = newCounter().memoized;

counter(0); // Returns 0, counter becomes 1
counter(10); // Returns 11, counter becomes 2
counter(0); // Returns 0, counter stays 2
counter(11); // Returns 13, count becomes 3
```

### Partial Application

Provides non-curried function partial application. 

Existing ways do so through creating a function buffer or through currying, applying arguments, and uncurrying the function back. This approach eliminates the need for two intermediate steps and allows application arguments directly.

```dart
int sumThree(int a, int b, int c) => a + b + c;

int buffer(int b, int c) => sumThree(1, b, c);
final currying = sumThree.curry()(1).uncurry(); // Not included in this package
final partial = sumThree.apply(1);
```

