import 'package:pure/pure.dart' hide isNotNull, isNull;
import 'package:test/test.dart';

void main() {
  group('nullable', () {
    group('Nullable1X', () {
      test('invokes function when argument is non-null', () {
        int double_(int x) => x * 2;
        expect(double_.nullable(5), 10);
      });

      test('returns null when argument is null', () {
        int double_(int x) => x * 2;
        expect(double_.nullable(null), isNull);
      });
    });

    group('Nullable2X', () {
      test('invokes function when both arguments are non-null', () {
        int add(int a, int b) => a + b;
        expect(add.nullable(3, 4), 7);
      });

      test('returns null when first argument is null', () {
        int add(int a, int b) => a + b;
        expect(add.nullable(null, 4), isNull);
      });

      test('returns null when second argument is null', () {
        int add(int a, int b) => a + b;
        expect(add.nullable(3, null), isNull);
      });

      test('returns null when both arguments are null', () {
        int add(int a, int b) => a + b;
        expect(add.nullable(null, null), isNull);
      });
    });

    group('Nullable3X', () {
      test('invokes when all three are non-null', () {
        int sum3(int a, int b, int c) => a + b + c;
        expect(sum3.nullable(1, 2, 3), 6);
      });

      test('returns null if any argument is null', () {
        int sum3(int a, int b, int c) => a + b + c;
        expect(sum3.nullable(null, 2, 3), isNull);
        expect(sum3.nullable(1, null, 3), isNull);
        expect(sum3.nullable(1, 2, null), isNull);
      });
    });

    group('Nullable4X', () {
      test('invokes when all four are non-null', () {
        int sum4(int a, int b, int c, int d) => a + b + c + d;
        expect(sum4.nullable(1, 2, 3, 4), 10);
      });

      test('returns null if any argument is null', () {
        int sum4(int a, int b, int c, int d) => a + b + c + d;
        expect(sum4.nullable(null, 2, 3, 4), isNull);
        expect(sum4.nullable(1, 2, 3, null), isNull);
      });
    });

    group('Nullable5X', () {
      test('invokes when all five are non-null', () {
        int sum5(int a, int b, int c, int d, int e) => a + b + c + d + e;
        expect(sum5.nullable(1, 2, 3, 4, 5), 15);
      });

      test('returns null if any argument is null', () {
        int sum5(int a, int b, int c, int d, int e) => a + b + c + d + e;
        expect(sum5.nullable(1, 2, null, 4, 5), isNull);
      });
    });

    group('Nullable6X', () {
      test('invokes when all six are non-null', () {
        int sum6(int a, int b, int c, int d, int e, int f) =>
            a + b + c + d + e + f;
        expect(sum6.nullable(1, 2, 3, 4, 5, 6), 21);
      });

      test('returns null if any argument is null', () {
        int sum6(int a, int b, int c, int d, int e, int f) =>
            a + b + c + d + e + f;
        expect(sum6.nullable(1, 2, 3, 4, 5, null), isNull);
      });
    });

    group('Nullable7X', () {
      test('invokes when all seven are non-null', () {
        int sum7(int a, int b, int c, int d, int e, int f, int g) =>
            a + b + c + d + e + f + g;
        expect(sum7.nullable(1, 2, 3, 4, 5, 6, 7), 28);
      });

      test('returns null if any argument is null', () {
        int sum7(int a, int b, int c, int d, int e, int f, int g) =>
            a + b + c + d + e + f + g;
        expect(sum7.nullable(1, 2, 3, null, 5, 6, 7), isNull);
      });
    });

    group('Nullable8X', () {
      test('invokes when all eight are non-null', () {
        int sum8(int a, int b, int c, int d, int e, int f, int g, int h) =>
            a + b + c + d + e + f + g + h;
        expect(sum8.nullable(1, 2, 3, 4, 5, 6, 7, 8), 36);
      });

      test('returns null if any argument is null', () {
        int sum8(int a, int b, int c, int d, int e, int f, int g, int h) =>
            a + b + c + d + e + f + g + h;
        expect(sum8.nullable(1, 2, 3, 4, null, 6, 7, 8), isNull);
      });
    });

    group('Nullable9X', () {
      test('invokes when all nine are non-null', () {
        int sum9(int a, int b, int c, int d, int e, int f, int g, int h,
                int i,) =>
            a + b + c + d + e + f + g + h + i;
        expect(sum9.nullable(1, 2, 3, 4, 5, 6, 7, 8, 9), 45);
      });

      test('returns null if any argument is null', () {
        int sum9(int a, int b, int c, int d, int e, int f, int g, int h,
                int i,) =>
            a + b + c + d + e + f + g + h + i;
        expect(sum9.nullable(1, 2, 3, 4, 5, 6, 7, 8, null), isNull);
      });
    });

    group('nullable return type', () {
      test('nullable returns nullable T', () {
        int double_(int x) => x * 2;
        final result = double_.nullable(null);
        expect(result, isNull);
      });

      test('nullable function can be composed with pipe', () {
        int double_(int x) => x * 2;
        final result = 5.pipe(double_.nullable);
        expect(result, 10);
      });
    });
  });
}
