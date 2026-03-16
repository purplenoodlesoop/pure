import "package:pure/pure.dart" hide greaterThan, isNotNull, isNull;
import "package:pure/src/functions/num.dart" as pure_num;
import "package:pure/src/functions/string.dart" as pure_string;
import "package:test/test.dart";

/// Integration tests that chain multiple features together.
void main() {
  group("integration: composition chains", () {
    test("pipe + apply + memoize", () {
      var callCount = 0;
      int multiply(int a, int b) {
        callCount++;
        return a * b;
      }

      final triple = multiply.apply(3).memoize();

      // Call triple(7) twice — same arg, should only compute once
      final result1 = triple(7); // 3*7 = 21, computes
      final result2 = triple(7); // cached
      expect(result1, 21);
      expect(result2, 21);
      expect(callCount, 1); // Second call is memoized
    });

    test("dot + curry", () {
      int add(int a, int b) => a + b;
      String intToStr(int x) => "value:$x";

      final addThenStringify = intToStr.dot(add.curry(10));

      expect(addThenStringify(5), "value:15");
    });

    test("pipe + dot + compose", () {
      int add1(int x) => x + 1;
      int double_(int x) => x * 2;
      String toStr(int x) => "$x";

      final transform = toStr.dot(double_).dot(add1);

      final result = 4.pipe(transform);
      expect(result, "10"); // (4+1)*2 = 10
    });

    test("nullable + pipe", () {
      int double_(int x) => x * 2;

      int? getValue() => 5;
      final result = getValue()?.pipe(double_.nullable);
      expect(result, 10);

      int? getNull() => null;
      final nullResult = getNull()?.pipe(double_.nullable);
      expect(nullResult, isNull);
    });

    test("flip reverses argument order", () {
      String format(String prefix, int value) => "$prefix: $value";

      // flip(B b, A a) where A=String, B=int → flip(intVal, strVal)
      final result = format.flip(42, "hello");
      expect(result, "hello: 42");
    });

    test("thunk + memoize", () {
      var callCount = 0;
      int compute(int x, int y) {
        callCount++;
        return x + y;
      }

      final memoized = compute.memoize();
      final lazy = memoized.thunk(3, 4);

      expect(lazy(), 7);
      expect(lazy(), 7);
      expect(callCount, 1); // memoized result
    });

    test("trampoline + pipe", () {
      Tram<int> countDown(int n) =>
          n == 0 ? const Tram.done(0) : Tram.call(() => countDown(n - 1));

      final result = 100.pipe((n) => countDown(n).bounce());
      expect(result, 0);
    });

    test("curry + uncurry roundtrip produces same result", () {
      int sum(int a, int b, int c) => a + b + c;

      // curry then manually uncurry
      final curried = sum.curry(1);
      // curried is CF2<int, int, int>
      final uncurriedResult = curried.uncurry(2, 3);

      expect(uncurriedResult, sum(1, 2, 3));
    });
  });

  group("integration: functional patterns", () {
    test("point-free style: compose multiple transformations", () {
      bool isEven(int x) => x.isEven;
      int double_(int x) => x * 2;

      final numbers = [1, 2, 3, 4, 5];
      // Keep odds, double them, filter >4
      final result = numbers
          .where((n) => !isEven(n))
          .map(double_)
          .where(pure_num.greaterThan(4))
          .toList();

      expect(result, [6, 10]);
    });

    test("partial application of minus as subtractor", () {
      // Instantiate the generic minus as int to get the F2 extension in scope
      const typedMinus = minus<int>;
      final subtractFrom10 = typedMinus.apply(10);
      expect(subtractFrom10(3), 7);
      expect(subtractFrom10(10), 0);
      expect(subtractFrom10(15), -5);
    });

    test("memoized fibonacci via trampoline", () {
      // memoize caches the Tram<int> result; bounce() evaluates it
      Tram<int> fib(int n, int a, int b) {
        if (n == 0) {
          return Tram.done(a);
        }
        return Tram.call(() => fib(n - 1, b, a + b));
      }

      final memoFib = fib.memoize();

      expect(memoFib(10, 0, 1).bounce(), 55);
      expect(memoFib(10, 0, 1).bounce(), 55); // Same Tram returned (cached)
      expect(memoFib(20, 0, 1).bounce(), 6765);
    });

    test("combining bool functions as predicates", () {
      final numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      bool isEven(int n) => n.isEven;
      final gt5 = pure_num.greaterThan(5);

      // even AND > 5
      final result =
          numbers.where((n) => and(isEven(n), gt5(n))).toList();
      expect(result, [6, 8, 10]);
    });

    test("string transformation pipeline", () {
      final result = "  Hello, World!  "
          .pipe(pure_string.trim)
          .pipe(pure_string.toLowerCase);
      expect(result, "hello, world!");
    });

    test("fallbackTo + pipe", () {
      final withDefault = fallbackTo("anonymous");
      String? name;
      final result = name.pipe(withDefault);
      expect(result, "anonymous");
    });

    test("id and constant used as function arguments", () {
      final numbers = [1, 2, 3];
      // Map each number to itself (using id)
      expect(numbers.map(id).toList(), numbers);
      // Map each to constant 0
      expect(numbers.map((n) => 0.constant(n)).toList(), [0, 0, 0]);
    });

    test("callIf + id", () {
      final result = callIf(true, () => id(42));
      expect(result, 42);

      final nullResult = callIf(false, () => id(42));
      expect(nullResult, isNull);
    });

    test("type check functions used as predicates", () {
      final mixed = <Object>[1, "hello", 2, "world", 3];
      final strings = mixed.where(itIs<String>).toList();
      expect(strings, ["hello", "world"]);

      final nonStrings = mixed.where(itIsNot<String>).toList();
      expect(nonStrings, [1, 2, 3]);
    });
  });
}
