import 'package:pure/pure.dart' hide isNotNull, isNull;
import 'package:test/test.dart';

void main() {
  group('uncurry', () {
    test('uncurry2: collapses curried function to 2-arg function', () {
      int Function(int) curried(int a) => (b) => a + b;

      expect(curried.uncurry(3, 4), 7);
    });

    test('uncurry3: collapses 3-level curried function', () {
      int Function(int) Function(int) curried(int a) =>
          (b) => (c) => a + b + c;

      expect(curried.uncurry(1, 2, 3), 6);
    });

    test('uncurry4', () {
      int Function(int) Function(int) Function(int) curried(int a) =>
          (b) => (c) => (d) => a + b + c + d;

      expect(curried.uncurry(1, 2, 3, 4), 10);
    });

    test('uncurry5', () {
      int Function(int) Function(int) Function(int) Function(int) curried(
        int a,
      ) =>
          (b) => (c) => (d) => (e) => a + b + c + d + e;

      expect(curried.uncurry(1, 2, 3, 4, 5), 15);
    });

    test('uncurry6', () {
      String Function(String) Function(String) Function(String) Function(
        String,
      ) Function(String) curried(String a) =>
          (b) => (c) => (d) => (e) => (f) => a + b + c + d + e + f;

      expect(curried.uncurry('a', 'b', 'c', 'd', 'e', 'f'), 'abcdef');
    });

    test('uncurry7', () {
      int Function(int) Function(int) Function(int) Function(int) Function(
        int,
      ) Function(int) curried(int a) =>
          (b) => (c) => (d) => (e) => (f) => (g) => a + b + c + d + e + f + g;

      expect(curried.uncurry(1, 2, 3, 4, 5, 6, 7), 28);
    });

    test('uncurry8', () {
      int Function(int) Function(int) Function(int) Function(int) Function(
        int,
      ) Function(int) Function(int) curried(int a) =>
          (b) =>
              (c) =>
                  (d) =>
                      (e) => (f) => (g) => (h) => a + b + c + d + e + f + g + h;

      expect(curried.uncurry(1, 2, 3, 4, 5, 6, 7, 8), 36);
    });

    test('uncurry9', () {
      int Function(int) Function(int) Function(int) Function(int) Function(
        int,
      ) Function(int) Function(int) Function(int) curried(int a) =>
          (b) =>
              (c) =>
                  (d) =>
                      (e) =>
                          (f) =>
                              (g) =>
                                  (h) =>
                                      (i) =>
                                          a + b + c + d + e + f + g + h + i;

      expect(curried.uncurry(1, 2, 3, 4, 5, 6, 7, 8, 9), 45);
    });

    test('curry then uncurry is identity', () {
      int add(int a, int b) => a + b;
      final curried = add.curry;
      int backToNormal(int a, int b) => curried(a)(b);

      expect(backToNormal(3, 4), add(3, 4));
    });

    test('curry2 + uncurry2 roundtrip', () {
      int multiply(int a, int b) => a * b;
      final curried = multiply.curry;
      int Function(int) curriedFn(int a) => curried(a);
      final uncurried = curriedFn.uncurry;

      expect(uncurried(6, 7), multiply(6, 7));
    });

    test('uncurry with mixed types', () {
      String Function(String) curried(int n) => (s) => '$n: $s';

      expect(curried.uncurry(42, 'hello'), '42: hello');
    });
  });
}
