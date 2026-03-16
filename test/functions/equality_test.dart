import "package:pure/pure.dart" hide isNotNull, isNull;
import "package:pure/src/functions/equality.dart" as pure_eq;
import "package:test/test.dart";

void main() {
  group("equality functions", () {
    group("eq", () {
      test("equal ints", () => expect(eq(42, 42), isTrue));
      test("unequal ints", () => expect(eq(1, 2), isFalse));
      test("equal strings", () => expect(eq("hello", "hello"), isTrue));
      test("unequal strings", () => expect(eq("hello", "world"), isFalse));
      test("equal booleans", () => expect(eq(true, true), isTrue));
      test("equal null", () => expect(eq<String?>(null, null), isTrue));
      test("null vs non-null", () => expect(eq<String?>(null, "x"), isFalse));
    });

    group("itIs", () {
      test("checks if object is String", () {
        expect(itIs<String>("hello"), isTrue);
        expect(itIs<String>(42), isFalse);
      });

      test("checks if object is int", () {
        expect(itIs<int>(42), isTrue);
        expect(itIs<int>(3.14), isFalse);
      });

      test("works with null", () {
        expect(itIs<void>(null), isTrue);
        expect(itIs<String>(null), isFalse);
      });

      test("works with subtype check", () {
        expect(itIs<num>(42), isTrue);
        expect(itIs<num>(3.14), isTrue);
      });
    });

    group("itIsNot", () {
      test("returns true when object is not String", () {
        expect(itIsNot<String>(42), isTrue);
        expect(itIsNot<String>("hello"), isFalse);
      });

      test("works with null", () {
        expect(itIsNot<String>(null), isTrue);
        expect(itIsNot<void>(null), isFalse);
      });
    });

    group("isNull", () {
      test("returns true for null", () => expect(pure_eq.isNull(null), isTrue));
      test(
        "returns false for non-null",
        () => expect(pure_eq.isNull("x"), isFalse),
      );
      test("works with int", () => expect(pure_eq.isNull<int>(null), isTrue));
    });

    group("isNotNull", () {
      test(
        "returns false for null",
        () => expect(pure_eq.isNotNull(null), isFalse),
      );
      test(
        "returns true for non-null",
        () => expect(pure_eq.isNotNull("x"), isTrue),
      );
      test("works with int", () => expect(pure_eq.isNotNull<int>(42), isTrue));
    });

    group("compare", () {
      // Note: zoom function must return a type B where B extends Comparable<B>.
      // String satisfies this (String implements Comparable<String>).

      test("creates comparator that sorts alphabetically", () {
        final compareStr = compare(id<String>);
        final strings = ["banana", "apple", "fig"];
        expect(strings..sort(compareStr), ["apple", "banana", "fig"]);
      });

      test("compare returns negative when first is less", () {
        final compareStr = compare(id<String>);
        expect(compareStr("apple", "banana"), isNegative);
      });

      test("compare returns zero when equal", () {
        final compareStr = compare(id<String>);
        expect(compareStr("apple", "apple"), 0);
      });

      test("compare returns positive when first is greater", () {
        final compareStr = compare(id<String>);
        expect(compareStr("banana", "apple"), isPositive);
      });

      test("compare works with zoom function on objects", () {
        String getName(Map<String, String> m) => m["name"] ?? "";
        final compareName = compare(getName);
        final people = [
          {"name": "Charlie"},
          {"name": "Alice"},
          {"name": "Bob"},
        ];
        expect(
          (people..sort(compareName)).map((m) => m["name"]).toList(),
          ["Alice", "Bob", "Charlie"],
        );
      });
    });

    group("compareByEntryIndex", () {
      test("sorts by position in reference list", () {
        final order = ["red", "green", "blue"];
        final comparator = compareByEntryIndex<String, String>(order, id);
        final items = ["blue", "red", "green"];
        expect(items..sort(comparator), ["red", "green", "blue"]);
      });

      test("returns negative when first appears earlier in list", () {
        final order = ["a", "b", "c"];
        final comparator = compareByEntryIndex<String, String>(order, id);
        expect(comparator("a", "b"), isNegative);
      });

      test("returns zero for same position", () {
        final order = ["a", "b", "c"];
        final comparator = compareByEntryIndex<String, String>(order, id);
        expect(comparator("a", "a"), 0);
      });

      test("works with zoom function", () {
        final order = [1, 2, 3];
        final comparator = compareByEntryIndex<Map<String, int>, int>(
          order,
          (m) => m["value"] ?? -1,
        );
        final items = [
          {"value": 3},
          {"value": 1},
          {"value": 2},
        ];
        expect(
          (items..sort(comparator)).map((m) => m["value"]).toList(),
          [1, 2, 3],
        );
      });
    });
  });
}
