import "package:pure/pure.dart" hide isNotNull, isNull;
import "package:test/test.dart";

// --- Trampoline-based recursive functions for testing ---

Tram<bool> _tramIsEven(int n) =>
    n == 0 ? const Tram.done(true) : Tram.call(() => _tramIsOdd(n - 1));

Tram<bool> _tramIsOdd(int n) =>
    n == 0 ? const Tram.done(false) : Tram.call(() => _tramIsEven(n - 1));

Tram<int> _tramSum(int n, int acc) =>
    n == 0 ? Tram.done(acc) : Tram.call(() => _tramSum(n - 1, acc + n));

Tram<int> _tramFactorial(int n, int acc) =>
    n <= 1 ? Tram.done(acc) : Tram.call(() => _tramFactorial(n - 1, acc * n));

Tram<String> _tramRepeat(int n, String acc, String s) =>
    n == 0 ? Tram.done(acc) : Tram.call(() => _tramRepeat(n - 1, acc + s, s));

Tram<int> _tramCountdown(int n) =>
    n == 0 ? const Tram.done(0) : Tram.call(() => _tramCountdown(n - 1));

void main() {
  group("Tram", () {
    group("Tram.done", () {
      test("returns the value immediately", () {
        expect(const Tram.done(42).bounce(), 42);
      });

      test("works with strings", () {
        expect(const Tram.done("hello").bounce(), "hello");
      });

      test("works with null", () {
        expect(const Tram<String?>.done(null).bounce(), isNull);
      });

      test("works with lists", () {
        expect(const Tram.done([1, 2, 3]).bounce(), [1, 2, 3]);
      });
    });

    group("Tram.call", () {
      test("executes the given instruction", () {
        final result = Tram.call(() => const Tram.done(99)).bounce();
        expect(result, 99);
      });

      test("chains multiple instructions", () {
        final result =
            Tram.call(() => Tram.call(() => const Tram.done(7))).bounce();
        expect(result, 7);
      });
    });

    group("bounce() — recursive computations", () {
      test("computes triangular sum correctly", () {
        expect(_tramSum(10, 0).bounce(), 55);
        expect(_tramSum(100, 0).bounce(), 5050);
      });

      test("computes factorial correctly", () {
        expect(_tramFactorial(5, 1).bounce(), 120);
        expect(_tramFactorial(10, 1).bounce(), 3628800);
      });

      test("builds string by repetition", () {
        expect(_tramRepeat(5, "", "ab").bounce(), "ababababab");
      });

      test("handles n=0 base case immediately", () {
        expect(_tramSum(0, 0).bounce(), 0);
        expect(_tramFactorial(1, 1).bounce(), 1);
      });

      test("does NOT stack overflow with very deep recursion", () {
        // 1,000,000 iterations
        expect(_tramCountdown(1000000).bounce(), 0);
      });

      test("does NOT stack overflow with 10 million iterations", () {
        expect(_tramCountdown(10000000).bounce(), 0);
      });

      test("produces correct sum for large n (no overflow for int)", () {
        // 1000 * 1001 / 2 = 500500
        expect(_tramSum(1000, 0).bounce(), 500500);
      });
    });
  });

  group("Bounce extensions", () {
    test("Bounce0X: bounces a zero-arg function returning Tram", () {
      Tram<int> f() => const Tram.done(42);
      expect(f.bounce(), 42);
    });

    test("Bounce1X: bounces a one-arg function", () {
      const countdown = _tramCountdown;
      expect(countdown.bounce(5), 0);
    });

    test("Bounce2X: bounces a two-arg function", () {
      const sumFn = _tramSum;
      expect(sumFn.bounce(10, 0), 55);
    });

    test("Bounce3X: bounces a three-arg function", () {
      const repeatFn = _tramRepeat;
      expect(repeatFn.bounce(3, "", "x"), "xxx");
    });

    test("Bounce0X with deep recursion does not stack overflow", () {
      Tram<int> deepRecursion() => _tramCountdown(500000);
      expect(deepRecursion.bounce(), 0);
    });
  });

  group("Tram type safety", () {
    test("works with double return type", () {
      Tram<double> addDoubles(double a, double b, int steps) => steps == 0
          ? Tram.done(a)
          : Tram.call(() => addDoubles(a + b, b, steps - 1));

      expect(addDoubles(0, 1.5, 4).bounce(), 6.0);
    });

    test("works with bool return type", () {
      expect(_tramIsEven(100).bounce(), isTrue);
      expect(_tramIsEven(101).bounce(), isFalse);
    });
  });
}
