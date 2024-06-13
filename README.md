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

### Constant

Allows to create a function from a single value that discards its only argument and returns the value.

For example, can be used to map a list of numbers to a single number.

```dart
const numbers = [1, 2, 3];
final zeros = numbers.map(0.constant); /// Equivalent to `numbers.map((number) => 0);`
```

### Curry and Uncurry

Allows to curry an uncurried function and uncurry a curried function.

Currying is a process of transforming a function that takes multiple arguments into a chain of functions that take a single argument and returns another function, as many times as there were arguments in the original function.

```dart
String createPerson(String country, int age, String name) => "$country, $name, $age";

final createTwin = createPerson.curry("Canada")(12);

final tim = createTwin("Tim");
final jim = createTwin("Jim");
```


### Flipping

Allows to flip the arguments, reversing their order. 

```dart
String createPerson(String firstName, String lastName) => "$firstName, $lastName";
final createFormalPerson = createPerson.flip;

print(createFormalPerson('John', 'Doe')); /// Prints "Doe, John".
```

### Nullable invocation

Allows to call a function that normally takes non-nullable arguments with nullable ones and runs it only when all arguments are not null indeed.

```dart
int sum(int first, int second) => first + second;
final sumNullable = sum.nullable;

print(sumNullable(2, 2)); /// Prints "4"
print(sumNullable(2, null)); /// Prints "null"
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

final counter = newCounter().memoize();

counter(0); // Returns 0, counter becomes 1
counter(10); // Returns 11, counter becomes 2
counter(0); // Returns 0, counter stays 2
counter(11); // Returns 13, counter becomes 3
```

### Partial Application

Provides non-curried function partial application. 

Existing ways do so through creating a function buffer or through currying, applying arguments, and uncurrying the function back. This approach eliminates the need for two intermediate steps and allows application arguments directly.

```dart
int sumThree(int a, int b, int c) => a + b + c;

int buffer(int b, int c) => sumThree(1, b, c);
final partial = sumThree.apply(1);
```

### Thunk

Provides a way to create a thunk – a function that takes no arguments and returns a value.

```dart
int meaningOfLife(int value) => value;

final meaning = meaningOfLife.thunk(42);

print(meaning()); // Prints "42"
```

## Functions

The package also includes a set of basic functions that are not specific to functional programming per se, but are useful in many cases. They provide a basic functionality for common operations, such as working with `bool`, `num`, creating comparators and manipulating strings.

```dart
final appendWorld = append.curry('World! ');
final prependHello = prepend.curry(' Hello');

', '
    .pipe(prependHello)
    .pipe(appendWorld)
    .pipe(trimLeft)
    .pipe(trimRight)
    .pipe(toUpperCase);
```

The functions mainly exist to use them in composition and pipes, but can be used as standalone functions as well.

## Data

`TaggedRecord` is a base class that allows to create a data-class from type definition, automatically implementing methods like `toString`, `==`, and `hashCode`.

The base class can be used to define both product and sum types – standalone classes and cases of sealed classes.

```dart
/// Regular class definition to define a product type
final class User extends TaggedRecord<({String name, int age})> {
  const User(super.value);
}
```

```dart
/// Class definition through mixin application to define a sum type
sealed class Result<T> {}

mixin _Constructor<T> implements Result<T> {}

final class Success<T> = TaggedRecord<({T value})> with _Constructor<T>;

final class Error<T> = TaggedRecord<()> with _Constructor<T>;
```