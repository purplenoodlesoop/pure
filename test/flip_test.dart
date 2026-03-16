import "package:pure/pure.dart" hide isNotNull, isNull;
import "package:test/test.dart";

void main() {
  group("flip", () {
    test("flip2: reverses 2 arguments", () {
      String subtract(int a, int b) => "$a - $b";
      // flip passes (b, a) calling f(a, b), so flip(10, 3) calls f(3, 10)
      expect(subtract.flip(10, 3), "3 - 10");
    });

    test("flip2: argument order is clearly reversed", () {
      final log = <String>[];
      void record(String first, String second) {
        log.add("first=$first,second=$second");
      }

      record.flip("B", "A");
      expect(log, ["first=A,second=B"]);
    });

    test("flip3: reverses 3 arguments", () {
      String f(int a, int b, int c) => "$a,$b,$c";
      // flip(c, b, a) calls f(a, b, c)
      expect(f.flip(3, 2, 1), "1,2,3");
    });

    test("flip4: reverses 4 arguments", () {
      String f(int a, int b, int c, int d) => "$a,$b,$c,$d";
      expect(f.flip(4, 3, 2, 1), "1,2,3,4");
    });

    test("flip5: reverses 5 arguments", () {
      String f(int a, int b, int c, int d, int e) => "$a,$b,$c,$d,$e";
      expect(f.flip(5, 4, 3, 2, 1), "1,2,3,4,5");
    });

    test("flip6: reverses 6 arguments", () {
      String f(int a, int b, int c, int d, int e, int ff) =>
          "$a,$b,$c,$d,$e,$ff";
      expect(f.flip(6, 5, 4, 3, 2, 1), "1,2,3,4,5,6");
    });

    test("flip7: reverses 7 arguments", () {
      String f(int a, int b, int c, int d, int e, int ff, int g) =>
          "$a,$b,$c,$d,$e,$ff,$g";
      expect(f.flip(7, 6, 5, 4, 3, 2, 1), "1,2,3,4,5,6,7");
    });

    test("flip8: reverses 8 arguments", () {
      String f(int a, int b, int c, int d, int e, int ff, int g, int h) =>
          "$a,$b,$c,$d,$e,$ff,$g,$h";
      expect(f.flip(8, 7, 6, 5, 4, 3, 2, 1), "1,2,3,4,5,6,7,8");
    });

    test("flip9: reverses 9 arguments", () {
      String f(int a, int b, int c, int d, int e, int ff, int g, int h,
              int i,) =>
          "$a,$b,$c,$d,$e,$ff,$g,$h,$i";
      expect(f.flip(9, 8, 7, 6, 5, 4, 3, 2, 1), "1,2,3,4,5,6,7,8,9");
    });

    test("flip2 with non-commutative operation", () {
      String divide(int a, int b) => "${a ~/ b}";
      // flip(10, 2) calls divide(2, 10) -> 0
      expect(divide.flip(10, 2), "0");
      // Without flip: divide(2, 10) = 0
      expect(divide(2, 10), "0");
      // direct call: divide(10, 2) = 5
      expect(divide(10, 2), "5");
    });

    test("flip with mixed types", () {
      String format(int n, String s) => "$n: $s";
      // flip('hello', 42) calls format(42, 'hello')
      expect(format.flip("hello", 42), "42: hello");
    });
  });
}
