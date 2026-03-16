import "package:pure/pure.dart" hide isNotNull, isNull;
import "package:test/test.dart";

void main() {
  group("memoization", () {
    group("Memoize0X", () {
      test("memoizes zero-arg function", () {
        var callCount = 0;
        int compute() {
          callCount++;
          return 42;
        }

        final memoized = compute.memoize();

        expect(memoized(), 42);
        expect(memoized(), 42);
        expect(callCount, 1); // Only computed once
      });
    });

    group("Memoize1X", () {
      test("caches results by argument", () {
        var callCount = 0;
        int expensive(int x) {
          callCount++;
          return x * x;
        }

        final memoized = expensive.memoize();

        expect(memoized(5), 25);
        expect(memoized(5), 25);
        expect(memoized(3), 9);
        expect(memoized(3), 9);
        expect(callCount, 2); // Two unique inputs
      });

      test("different arguments get different cache entries", () {
        int identity(int x) => x;
        final memoized = identity.memoize();

        expect(memoized(1), 1);
        expect(memoized(2), 2);
        expect(memoized(3), 3);
      });

      test("works with string argument", () {
        var callCount = 0;
        int strlen(String s) {
          callCount++;
          return s.length;
        }

        final memoized = strlen.memoize();

        expect(memoized("hello"), 5);
        expect(memoized("hello"), 5);
        expect(callCount, 1);
      });

      test("works with null argument", () {
        var callCount = 0;
        String nullToStr(String? s) {
          callCount++;
          return s ?? "null";
        }

        final memoized = nullToStr.memoize();

        expect(memoized(null), "null");
        expect(memoized(null), "null");
        expect(callCount, 1);
      });
    });

    group("Memoize2X", () {
      test("caches by combination of two arguments", () {
        var callCount = 0;
        int add(int a, int b) {
          callCount++;
          return a + b;
        }

        final memoized = add.memoize();

        expect(memoized(3, 4), 7);
        expect(memoized(3, 4), 7);
        // Same result, different arg order = new entry
        expect(memoized(4, 3), 7);
        expect(callCount, 2);
      });

      test("(a,b) and (b,a) are treated as distinct cache entries", () {
        var callCount = 0;
        String concat(String a, String b) {
          callCount++;
          return a + b;
        }

        final memoized = concat.memoize();

        expect(memoized("foo", "bar"), "foobar");
        expect(memoized("bar", "foo"), "barfoo");
        expect(callCount, 2);
      });
    });

    group("Memoize3X", () {
      test("caches by 3-argument combination", () {
        var callCount = 0;
        int sum3(int a, int b, int c) {
          callCount++;
          return a + b + c;
        }

        final memoized = sum3.memoize();

        expect(memoized(1, 2, 3), 6);
        expect(memoized(1, 2, 3), 6);
        expect(callCount, 1);
      });
    });

    group("Memoize4X through Memoize9X", () {
      test("Memoize4X caches correctly", () {
        var callCount = 0;
        int sum4(int a, int b, int c, int d) {
          callCount++;
          return a + b + c + d;
        }

        final memoized = sum4.memoize();
        expect(memoized(1, 2, 3, 4), 10);
        expect(memoized(1, 2, 3, 4), 10);
        expect(callCount, 1);
      });

      test("Memoize5X caches correctly", () {
        var callCount = 0;
        int sum5(int a, int b, int c, int d, int e) {
          callCount++;
          return a + b + c + d + e;
        }

        final memoized = sum5.memoize();
        expect(memoized(1, 2, 3, 4, 5), 15);
        expect(memoized(1, 2, 3, 4, 5), 15);
        expect(callCount, 1);
      });

      test("Memoize6X caches correctly", () {
        var callCount = 0;
        int sum6(int a, int b, int c, int d, int e, int f) {
          callCount++;
          return a + b + c + d + e + f;
        }

        final memoized = sum6.memoize();
        expect(memoized(1, 2, 3, 4, 5, 6), 21);
        expect(memoized(1, 2, 3, 4, 5, 6), 21);
        expect(callCount, 1);
      });

      test("Memoize7X caches correctly", () {
        var callCount = 0;
        int sum7(int a, int b, int c, int d, int e, int f, int g) {
          callCount++;
          return a + b + c + d + e + f + g;
        }

        final memoized = sum7.memoize();
        expect(memoized(1, 2, 3, 4, 5, 6, 7), 28);
        expect(memoized(1, 2, 3, 4, 5, 6, 7), 28);
        expect(callCount, 1);
      });

      test("Memoize8X caches correctly", () {
        var callCount = 0;
        int sum8(int a, int b, int c, int d, int e, int f, int g, int h) {
          callCount++;
          return a + b + c + d + e + f + g + h;
        }

        final memoized = sum8.memoize();
        expect(memoized(1, 2, 3, 4, 5, 6, 7, 8), 36);
        expect(memoized(1, 2, 3, 4, 5, 6, 7, 8), 36);
        expect(callCount, 1);
      });

      test("Memoize9X caches correctly", () {
        var callCount = 0;
        int sum9(int a, int b, int c, int d, int e, int f, int g, int h,
            int i,) {
          callCount++;
          return a + b + c + d + e + f + g + h + i;
        }

        final memoized = sum9.memoize();
        expect(memoized(1, 2, 3, 4, 5, 6, 7, 8, 9), 45);
        expect(memoized(1, 2, 3, 4, 5, 6, 7, 8, 9), 45);
        expect(callCount, 1);
      });
    });

    group("memoization side effects", () {
      test("side effects are not re-executed for cached calls", () {
        final sideEffects = <int>[];
        int withSideEffect(int x) {
          sideEffects.add(x);
          return x * 2;
        }

        final memoized = withSideEffect.memoize();

        memoized(5);
        memoized(5);
        memoized(5);

        expect(sideEffects, [5]); // Side effect ran only once
      });

      test("cache is per memoized instance", () {
        var callCount = 0;
        int increment(int x) {
          callCount++;
          return x + 1;
        }

        final memo1 = increment.memoize();
        final memo2 = increment.memoize();

        memo1(10);
        memo2(10); // Different cache from memo1

        expect(callCount, 2);
      });
    });
  });
}
