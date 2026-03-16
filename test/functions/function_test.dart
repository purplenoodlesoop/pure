import "package:pure/pure.dart" hide isNotNull, isNull;
import "package:test/test.dart";

void main() {
  group("function utilities", () {
    group("id", () {
      test("returns the same int", () => expect(id(42), 42));
      test("returns the same string", () => expect(id("hello"), "hello"));
      test("returns the same null", () => expect(id<String?>(null), isNull));
      test("returns the same object reference", () {
        final obj = Object();
        expect(id(obj), same(obj));
      });
    });

    group("idFirst", () {
      test("returns first of two arguments", () {
        expect(idFirst(1, 2), 1);
        expect(idFirst("a", "b"), "a");
      });

      test("works with mixed types", () {
        expect(idFirst(42, "hello"), 42);
      });
    });

    group("idSecond", () {
      test("returns second of two arguments", () {
        expect(idSecond(1, 2), 2);
        expect(idSecond("a", "b"), "b");
      });

      test("works with mixed types", () {
        expect(idSecond(42, "hello"), "hello");
      });
    });

    group("idFirstTernary", () {
      test("returns first of three arguments", () {
        expect(idFirstTernary(1, 2, 3), 1);
        expect(idFirstTernary("a", "b", "c"), "a");
      });
    });

    group("idSecondTernary", () {
      test("returns second of three arguments", () {
        expect(idSecondTernary(1, 2, 3), 2);
      });
    });

    group("idThirdTernary", () {
      test("returns third of three arguments", () {
        expect(idThirdTernary(1, 2, 3), 3);
      });
    });

    group("fallbackTo", () {
      test("returns value when input is null", () {
        final withFallback = fallbackTo(0);
        expect(withFallback(null), 0);
      });

      test("returns input when non-null", () {
        final withFallback = fallbackTo(0);
        expect(withFallback(42), 42);
      });

      test("works with strings", () {
        final withFallback = fallbackTo("default");
        expect(withFallback(null), "default");
        expect(withFallback("actual"), "actual");
      });
    });

    group("call", () {
      test("invokes callback and returns result", () {
        expect(call(() => 42), 42);
      });

      test("works with side effects", () {
        var ran = false;
        call(() {
          ran = true;
          return null;
        });
        expect(ran, isTrue);
      });

      test("returns callback result", () {
        expect(call(() => "result"), "result");
      });
    });

    group("callIf", () {
      test("invokes callback when predicate is true", () {
        var ran = false;
        callIf(true, () {
          ran = true;
          return null;
        });
        expect(ran, isTrue);
      });

      test("does not invoke callback when predicate is false", () {
        var ran = false;
        callIf(false, () {
          ran = true;
          return null;
        });
        expect(ran, isFalse);
      });

      test("returns callback result when true", () {
        expect(callIf(true, () => 42), 42);
      });

      test("returns null when predicate is false", () {
        expect(callIf(false, () => 42), isNull);
      });
    });

    group("nothing", () {
      test("can be called without error", () {
        expect(nothing, returnsNormally);
      });

      test("returns void", nothing);
    });

    group("asyncNothing", () {
      test("returns a Future<void>", () async {
        await expectLater(asyncNothing(), completes);
      });

      test("completes without error", () {
        expect(asyncNothing, returnsNormally);
      });
    });

    group("coerce", () {
      test("casts object to target type", () {
        const Object value = 42;
        expect(coerce<int>(value), 42);
      });

      test("casts string to Object", () {
        expect(coerce<Object>("hello"), "hello");
      });

      test("throws when cast fails", () {
        expect(() => coerce<int>("not an int"), throwsA(isA<TypeError>()));
      });
    });
  });
}
