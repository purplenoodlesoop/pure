import "package:pure/pure.dart" hide isNotNull, isNull;
import "package:test/test.dart";

void main() {
  group("bool functions", () {
    group("nullaryTrue / nullaryFalse", () {
      test("nullaryTrue always returns true", () {
        expect(nullaryTrue(), isTrue);
      });

      test("nullaryFalse always returns false", () {
        expect(nullaryFalse(), isFalse);
      });
    });

    group("unaryTrue / unaryFalse", () {
      test("unaryTrue returns true for any argument", () {
        expect(unaryTrue(42), isTrue);
        expect(unaryTrue("hello"), isTrue);
        expect(unaryTrue(null), isTrue);
        expect(unaryTrue(false), isTrue);
      });

      test("unaryFalse returns false for any argument", () {
        expect(unaryFalse(42), isFalse);
        expect(unaryFalse("hello"), isFalse);
        expect(unaryFalse(null), isFalse);
        expect(unaryFalse(true), isFalse);
      });
    });

    group("negate", () {
      test("negates true to false", () => expect(negate(true), isFalse));
      test("negates false to true", () => expect(negate(false), isTrue));
    });

    group("and", () {
      test("true AND true = true", () => expect(and(true, true), isTrue));
      test("true AND false = false", () => expect(and(true, false), isFalse));
      test("false AND true = false", () => expect(and(false, true), isFalse));
      test("false AND false = false", () => expect(and(false, false), isFalse));
    });

    group("or", () {
      test("true OR true = true", () => expect(or(true, true), isTrue));
      test("true OR false = true", () => expect(or(true, false), isTrue));
      test("false OR true = true", () => expect(or(false, true), isTrue));
      test("false OR false = false", () => expect(or(false, false), isFalse));
    });

    group("xor", () {
      test("true XOR true = false", () => expect(xor(true, true), isFalse));
      test("true XOR false = true", () => expect(xor(true, false), isTrue));
      test("false XOR true = true", () => expect(xor(false, true), isTrue));
      test("false XOR false = false", () => expect(xor(false, false), isFalse));
    });

    group("nand", () {
      test("true NAND true = false", () => expect(nand(true, true), isFalse));
      test("true NAND false = true", () => expect(nand(true, false), isTrue));
      test("false NAND true = true", () => expect(nand(false, true), isTrue));
      test("false NAND false = true", () => expect(nand(false, false), isTrue));
    });

    group("nor", () {
      test("true NOR true = false", () => expect(nor(true, true), isFalse));
      test("true NOR false = false", () => expect(nor(true, false), isFalse));
      test("false NOR true = false", () => expect(nor(false, true), isFalse));
      test("false NOR false = true", () => expect(nor(false, false), isTrue));
    });

    group("xnor", () {
      test("true XNOR true = true", () => expect(xnor(true, true), isTrue));
      test("true XNOR false = false", () => expect(xnor(true, false), isFalse));
      test("false XNOR true = false", () => expect(xnor(false, true), isFalse));
      test("false XNOR false = true", () => expect(xnor(false, false), isTrue));
    });

    group("implies (material implication: ¬A ∨ B)", () {
      test("true IMPLIES true = true", () {
        expect(implies(true, true), isTrue);
      });
      test("true IMPLIES false = false", () {
        expect(implies(true, false), isFalse);
      });
      test("false IMPLIES true = true", () {
        expect(implies(false, true), isTrue);
      });
      test("false IMPLIES false = true", () {
        expect(implies(false, false), isTrue);
      });
    });

    group("nonImplies (A ∧ ¬B)", () {
      test("true nonImplies true = false", () {
        expect(nonImplies(true, true), isFalse);
      });
      test("true nonImplies false = true", () {
        expect(nonImplies(true, false), isTrue);
      });
      test("false nonImplies true = false", () {
        expect(nonImplies(false, true), isFalse);
      });
      test("false nonImplies false = false", () {
        expect(nonImplies(false, false), isFalse);
      });
    });

    group("logical identities", () {
      test("DeMorgans law: nand(a,b) == or(negate(a), negate(b))", () {
        for (final a in [true, false]) {
          for (final b in [true, false]) {
            expect(
              nand(a, b),
              or(negate(a), negate(b)),
              reason: "for a=$a, b=$b",
            );
          }
        }
      });

      test("DeMorgans law: nor(a,b) == and(negate(a), negate(b))", () {
        for (final a in [true, false]) {
          for (final b in [true, false]) {
            expect(
              nor(a, b),
              and(negate(a), negate(b)),
              reason: "for a=$a, b=$b",
            );
          }
        }
      });

      test("xnor is negate of xor", () {
        for (final a in [true, false]) {
          for (final b in [true, false]) {
            expect(xnor(a, b), negate(xor(a, b)), reason: "for a=$a, b=$b");
          }
        }
      });

      test("implies(a,b) == or(negate(a), b)", () {
        for (final a in [true, false]) {
          for (final b in [true, false]) {
            expect(implies(a, b), or(negate(a), b), reason: "for a=$a, b=$b");
          }
        }
      });
    });
  });
}
