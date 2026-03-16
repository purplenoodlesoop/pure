import "package:pure/pure.dart" hide isNotNull, isNull;
import "package:test/test.dart";

void main() {
  group("dot (function composition)", () {
    test("composes two functions right-to-left", () {
      int doubleIt(int x) => x * 2;
      String intToString(int x) => x.toString();

      final composed = intToString.dot(doubleIt);

      expect(composed(5), "10");
    });

    test("(f ∘ g)(x) == f(g(x))", () {
      int add1(int x) => x + 1;
      int triple(int x) => x * 3;

      final composed = triple.dot(add1);

      expect(composed(4), triple(add1(4)));
    });

    test("composition order: g is applied first, then f", () {
      final log = <String>[];
      int f(int x) {
        log.add("f($x)");
        return x * 2;
      }

      int g(int x) {
        log.add("g($x)");
        return x + 1;
      }

      final composed = f.dot(g);
      composed(3);

      expect(log, ["g(3)", "f(4)"]);
    });

    test("chaining multiple dot compositions", () {
      int add1(int x) => x + 1;
      int double_(int x) => x * 2;
      String toStr(int x) => x.toString();

      final composed = toStr.dot(double_).dot(add1);

      expect(composed(3), "8"); // (3+1)*2 = 8 -> "8"
    });

    test("identity composition: id.dot(f) == f", () {
      int triple(int x) => x * 3;

      final composed = id<int>.dot(triple);

      expect(composed(7), triple(7));
    });

    test("composition with different types", () {
      double intToDouble(int x) => x.toDouble();
      String doubleToString(double x) => x.toString();

      final composed = doubleToString.dot(intToDouble);

      expect(composed(42), "42.0");
    });
  });

  group("pipe (data piping)", () {
    test("feeds value into function", () {
      expect(5.pipe((x) => x * 2), 10);
    });

    test("chains multiple pipes", () {
      final result = 5
          .pipe((x) => x + 1)
          .pipe((x) => x * 2)
          .pipe((x) => x.toString());

      expect(result, "12");
    });

    test("pipe with type transformation", () {
      final result = 42.pipe((x) => x.toDouble()).pipe((x) => x.toString());

      expect(result, "42.0");
    });

    test("pipe preserves value when function is identity", () {
      expect("hello".pipe(id), "hello");
    });

    test("pipe with nullable value using ?. operator", () {
      String? getNullable() => "hello";
      final result = getNullable()?.pipe((s) => s.toUpperCase());

      expect(result, "HELLO");
    });

    test("pipe with null returns null via ?.", () {
      String? getNullable() => null;
      final result = getNullable()?.pipe((s) => s.toUpperCase());

      expect(result, isNull);
    });

    test("pipe and dot produce same result for equivalent computations", () {
      int add1(int x) => x + 1;
      int double_(int x) => x * 2;

      final viaCompose = double_.dot(add1)(3);
      final viaPipe = 3.pipe(add1).pipe(double_);

      expect(viaCompose, viaPipe);
    });
  });
}
