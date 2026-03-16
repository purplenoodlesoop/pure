import "package:pure/pure.dart" hide isNotNull, isNull;
import "package:test/test.dart";

// --- Test fixtures ---

// Product type: single concrete class
final class Name extends TaggedRecord<(String,)> {
  const Name(String value) : super((value,));

  String get name_ => value.$1;
}

// Sum type: sealed with multiple subtypes
sealed class Shape extends TaggedRecord<(double,)> {
  const Shape(super.value);
}

final class Circle extends Shape {
  const Circle(double radius) : super((radius,));
  double get radius => value.$1;
}

final class Square extends Shape {
  const Square(double side) : super((side,));
  double get side => value.$1;
}

// Multi-field record
final class Point extends TaggedRecord<(int, int)> {
  const Point(int x, int y) : super((x, y));
  int get x => value.$1;
  int get y => value.$2;
}

void main() {
  group("TaggedRecord", () {
    group("value access", () {
      test("stores and retrieves single-field record", () {
        const name = Name("Alice");
        expect(name.name_, "Alice");
      });

      test("stores and retrieves multi-field record", () {
        const point = Point(3, 4);
        expect(point.x, 3);
        expect(point.y, 4);
      });
    });

    group("equality", () {
      test("equal when same type and same value", () {
        const a = Name("Alice");
        const b = Name("Alice");
        expect(a, equals(b));
      });

      test("not equal when same type but different value", () {
        const a = Name("Alice");
        const b = Name("Bob");
        expect(a, isNot(equals(b)));
      });

      test("not equal when different types but same underlying record", () {
        const circle = Circle(5);
        const square = Square(5);
        expect(circle, isNot(equals(square)));
      });

      test("reflexive: a == a", () {
        const name = Name("Alice");
        expect(name, equals(name));
      });

      test("symmetric: a == b => b == a", () {
        const a = Name("Alice");
        const b = Name("Alice");
        expect(a == b, isTrue);
        expect(b == a, isTrue);
      });

      test("identical objects are equal", () {
        const a = Name("Alice");
        expect(a == a, isTrue);
      });

      test("not equal to non-TaggedRecord", () {
        const name = Name("Alice");
        expect(name, isNot(equals("Alice")));
        expect(name, isNot(equals(42)));
      });

      test("multi-field: equal when all fields match", () {
        const a = Point(1, 2);
        const b = Point(1, 2);
        expect(a, equals(b));
      });

      test("multi-field: not equal when any field differs", () {
        const a = Point(1, 2);
        const b = Point(1, 3);
        expect(a, isNot(equals(b)));
      });
    });

    group("hashCode", () {
      test("equal objects have same hashCode", () {
        const a = Name("Alice");
        const b = Name("Alice");
        expect(a.hashCode, equals(b.hashCode));
      });

      test("different values typically have different hashCodes", () {
        const a = Name("Alice");
        const b = Name("Bob");
        // Not guaranteed but very likely for distinct values
        expect(a.hashCode, isNot(equals(b.hashCode)));
      });

      test("can be used in a Set", () {
        final names = [
          const Name("Alice"),
          const Name("Alice"),
          const Name("Bob"),
        ];
        final set = names.toSet();
        expect(set.length, 2);
      });

      test("can be used as Map key", () {
        const alice = Name("Alice");
        const bob = Name("Bob");
        final map = {alice: 1, bob: 2};
        expect(map[const Name("Alice")], 1);
        expect(map[const Name("Bob")], 2);
      });
    });

    group("name getter", () {
      test("returns runtime type name for Name", () {
        const name = Name("Alice");
        expect(name.name, "Name");
      });

      test("returns runtime type name for Circle", () {
        const circle = Circle(5);
        expect(circle.name, "Circle");
      });

      test("returns runtime type name for Square", () {
        const square = Square(3);
        expect(square.name, "Square");
      });

      test("returns runtime type name for Point", () {
        const point = Point(1, 2);
        expect(point.name, "Point");
      });
    });

    group("toString", () {
      test('formats as "Name(value)"', () {
        const name = Name("Alice");
        expect(name.toString(), contains("Name"));
        expect(name.toString(), contains("Alice"));
      });

      test("formats Circle correctly", () {
        const circle = Circle(5);
        expect(circle.toString(), startsWith("Circle"));
      });

      test("formats Point correctly", () {
        const point = Point(3, 4);
        expect(point.toString(), startsWith("Point"));
        expect(point.toString(), contains("3"));
        expect(point.toString(), contains("4"));
      });
    });

    group("sum type (sealed class)", () {
      test("Circle and Square are both Shape", () {
        const circle = Circle(5);
        const square = Square(3);
        expect(circle, isA<Shape>());
        expect(square, isA<Shape>());
      });

      test("pattern matching works on sealed Shape", () {
        const Shape shape = Circle(2.5);
        final description = switch (shape) {
          final Circle c => "circle with radius ${c.radius}",
          final Square s => "square with side ${s.side}",
        };
        expect(description, "circle with radius 2.5");
      });

      test("different subtypes are not equal even with same record value", () {
        const Shape a = Circle(5);
        const Shape b = Square(5);
        expect(a == b, isFalse);
      });
    });
  });
}
