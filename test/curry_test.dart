import "package:pure/pure.dart" hide isNotNull, isNull;
import "package:test/test.dart";

void main() {
  group("curry", () {
    test("curry2: partial application of first argument", () {
      int add(int a, int b) => a + b;
      final add5 = add.curry(5);

      expect(add5(3), 8);
      expect(add5(10), 15);
    });

    test("curry2: applying the curried function fully", () {
      String concat(String a, String b) => a + b;
      final helloAnd = concat.curry("hello ");

      expect(helloAnd("world"), "hello world");
    });

    test("curry3: produces a curried chain", () {
      int sum3(int a, int b, int c) => a + b + c;
      final curried = sum3.curry(1);

      expect(curried(2)(3), 6);
    });

    test("curry4: nested application", () {
      int sum4(int a, int b, int c, int d) => a + b + c + d;
      final curried = sum4.curry(1);

      expect(curried(2)(3)(4), 10);
    });

    test("curry5: nested application", () {
      int sum5(int a, int b, int c, int d, int e) => a + b + c + d + e;
      final curried = sum5.curry(1);

      expect(curried(2)(3)(4)(5), 15);
    });

    test("curry6: nested application", () {
      String concat6(String a, String b, String c, String d, String e,
              String f,) =>
          a + b + c + d + e + f;
      final curried = concat6.curry("a");

      expect(curried("b")("c")("d")("e")("f"), "abcdef");
    });

    test("curry7: nested application", () {
      int sum7(int a, int b, int c, int d, int e, int f, int g) =>
          a + b + c + d + e + f + g;
      final curried = sum7.curry(1);

      expect(curried(2)(3)(4)(5)(6)(7), 28);
    });

    test("curry8: nested application", () {
      int sum8(int a, int b, int c, int d, int e, int f, int g, int h) =>
          a + b + c + d + e + f + g + h;
      final curried = sum8.curry(1);

      expect(curried(2)(3)(4)(5)(6)(7)(8), 36);
    });

    test("curry9: nested application", () {
      int sum9(int a, int b, int c, int d, int e, int f, int g, int h,
              int i,) =>
          a + b + c + d + e + f + g + h + i;
      final curried = sum9.curry(1);

      expect(curried(2)(3)(4)(5)(6)(7)(8)(9), 45);
    });

    test("curried function is reusable", () {
      int multiply(int a, int b) => a * b;
      final triple = multiply.curry(3);

      expect(triple(1), 3);
      expect(triple(2), 6);
      expect(triple(5), 15);
    });

    test("currying with mixed types", () {
      String formatPair(int n, String s) => "$n: $s";
      final format1 = formatPair.curry(1);

      expect(format1("apple"), "1: apple");
    });
  });
}
