import 'package:pure/pure.dart' hide isNotNull, isNull;
import 'package:test/test.dart';

void main() {
  group('thunk', () {
    test('thunk1: captures argument and returns lazy computation', () {
      int double_(int x) => x * 2;
      final lazy = double_.thunk(5);

      expect(lazy, isA<Function>());
      expect(lazy(), 10);
    });

    test('thunk1: calling thunk multiple times gives same result', () {
      var counter = 0;
      int increment(int x) {
        counter++;
        return x + 1;
      }

      final lazy = increment.thunk(10);

      expect(lazy(), 11);
      expect(lazy(), 11);
      expect(counter, 2); // Not memoized — called each time
    });

    test('thunk2: captures two arguments', () {
      int add(int a, int b) => a + b;
      final lazy = add.thunk(3, 4);

      expect(lazy(), 7);
    });

    test('thunk3: captures three arguments', () {
      int sum3(int a, int b, int c) => a + b + c;
      final lazy = sum3.thunk(1, 2, 3);

      expect(lazy(), 6);
    });

    test('thunk4: captures four arguments', () {
      int sum4(int a, int b, int c, int d) => a + b + c + d;
      final lazy = sum4.thunk(1, 2, 3, 4);

      expect(lazy(), 10);
    });

    test('thunk5: captures five arguments', () {
      int sum5(int a, int b, int c, int d, int e) => a + b + c + d + e;
      final lazy = sum5.thunk(1, 2, 3, 4, 5);

      expect(lazy(), 15);
    });

    test('thunk6: captures six arguments', () {
      String concat6(String a, String b, String c, String d, String e,
              String f,) =>
          a + b + c + d + e + f;
      final lazy = concat6.thunk('a', 'b', 'c', 'd', 'e', 'f');

      expect(lazy(), 'abcdef');
    });

    test('thunk7: captures seven arguments', () {
      int sum7(int a, int b, int c, int d, int e, int f, int g) =>
          a + b + c + d + e + f + g;
      final lazy = sum7.thunk(1, 2, 3, 4, 5, 6, 7);

      expect(lazy(), 28);
    });

    test('thunk8: captures eight arguments', () {
      int sum8(int a, int b, int c, int d, int e, int f, int g, int h) =>
          a + b + c + d + e + f + g + h;
      final lazy = sum8.thunk(1, 2, 3, 4, 5, 6, 7, 8);

      expect(lazy(), 36);
    });

    test('thunk9: captures nine arguments', () {
      int sum9(int a, int b, int c, int d, int e, int f, int g, int h,
              int i,) =>
          a + b + c + d + e + f + g + h + i;
      final lazy = sum9.thunk(1, 2, 3, 4, 5, 6, 7, 8, 9);

      expect(lazy(), 45);
    });

    test('thunk defers execution', () {
      var executed = false;
      String sideEffect(String s) {
        executed = true;
        return s.toUpperCase();
      }

      final lazy = sideEffect.thunk('hello');
      expect(executed, isFalse);

      lazy();
      expect(executed, isTrue);
    });

    test('thunk with different argument types', () {
      String format(int n, String qualifier, String s) =>
          '$n-$qualifier-$s';
      final lazy = format.thunk(42, 'yes', 'test');

      expect(lazy(), '42-yes-test');
    });
  });
}
