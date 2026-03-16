import "package:pure/pure.dart" hide isNotNull, isNull;
import "package:test/test.dart";

void main() {
  group("constant", () {
    test("ignores one argument and returns the value", () {
      expect(42.constant("ignored"), 42);
    });

    test("ignores multiple arguments", () {
      expect(42.constant(1, 2, 3, 4, 5), 42);
    });

    test("ignores all 10 arguments", () {
      expect(42.constant(0, 1, 2, 3, 4, 5, 6, 7, 8, 9), 42);
    });

    test("works with strings", () {
      expect("hello".constant("world"), "hello");
    });

    test("works with null argument", () {
      expect(99.constant(null), 99);
    });

    test("works with null value", () {
      int? value;
      expect(value.constant("ignored"), isNull);
    });

    test("works with boolean", () {
      expect(true.constant(false), true);
    });

    test("works with list", () {
      final list = [1, 2, 3];
      expect(list.constant("anything"), same(list));
    });

    test("returns the same object reference", () {
      final obj = Object();
      expect(obj.constant("x"), same(obj));
    });

    test("can be used as a higher-order function", () {
      int alwaysFive(dynamic ignored) => 5.constant(ignored);
      expect([1, 2, 3].map(alwaysFive).toList(), [5, 5, 5]);
    });
  });
}
