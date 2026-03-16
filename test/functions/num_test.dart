import 'package:pure/pure.dart' hide greaterThan, isNotNull, isNull;
import 'package:pure/src/functions/num.dart' as pure_num;
import 'package:test/test.dart';

void main() {
  group('numeric functions', () {
    group('succ', () {
      test('increments int by 1', () => expect(succ(5), 6));
      test('increments 0', () => expect(succ(0), 1));
      test('increments negative', () => expect(succ(-3), -2));
      test('preserves int type', () => expect(succ(1), isA<int>()));
    });

    group('pred', () {
      test('decrements int by 1', () => expect(pred(5), 4));
      test('decrements 1 to 0', () => expect(pred(1), 0));
      test('decrements 0 to -1', () => expect(pred(0), -1));
      test('preserves int type', () => expect(pred(5), isA<int>()));
    });

    group('succ and pred are inverse', () {
      test('succ(pred(x)) == x', () {
        for (final x in [-5, 0, 5, 100]) {
          expect(succ(pred(x)), x);
        }
      });

      test('pred(succ(x)) == x', () {
        for (final x in [-5, 0, 5, 100]) {
          expect(pred(succ(x)), x);
        }
      });
    });

    group('plus', () {
      test('adds two ints', () => expect(plus(3, 4), 7));
      test('adds with zero', () => expect(plus(0, 5), 5));
      test('adds negative numbers', () => expect(plus(-3, -4), -7));
      test('commutative: plus(a,b) == plus(b,a)', () {
        expect(plus(3, 7), plus(7, 3));
      });
      test('preserves int type', () => expect(plus(1, 2), isA<int>()));
    });

    group('minus', () {
      test('subtracts second from first', () => expect(minus(10, 3), 7));
      test('subtracts zero', () => expect(minus(5, 0), 5));
      test('can produce negatives', () => expect(minus(3, 10), -7));
      test('preserves int type', () => expect(minus(10, 3), isA<int>()));
    });

    group('negateNum', () {
      test('negates positive int', () => expect(negateNum(5), -5));
      test('negates negative int', () => expect(negateNum(-5), 5));
      test('negates zero', () => expect(negateNum(0), 0));
      test('double negation is identity', () {
        expect(negateNum(negateNum(7)), 7);
      });
    });

    group('greaterThan', () {
      test('returns true when other > value', () {
        final gt5 = pure_num.greaterThan(5);
        expect(gt5(6), isTrue);
        expect(gt5(10), isTrue);
      });

      test('returns false when other <= value', () {
        final gt5 = pure_num.greaterThan(5);
        expect(gt5(5), isFalse);
        expect(gt5(4), isFalse);
      });

      test('can be used for filtering', () {
        final numbers = [1, 3, 5, 7, 9, 2, 4, 6, 8];
        final gt5 = pure_num.greaterThan(5);
        expect(numbers.where(gt5).toList(), [7, 9, 6, 8]);
      });

      test('works with negative threshold', () {
        final gtNeg1 = pure_num.greaterThan(-1);
        expect(gtNeg1(0), isTrue);
        expect(gtNeg1(-1), isFalse);
        expect(gtNeg1(-2), isFalse);
      });
    });

    group('numeric type consistency', () {
      test('plus with int stays int', () {
        final result = plus(2, 3);
        expect(result, isA<int>());
      });

      test('minus with int stays int', () {
        final result = minus(10, 4);
        expect(result, isA<int>());
      });

      test('succ on int returns int', () {
        expect(succ(5), isA<int>());
      });

      test('pred on int returns int', () {
        expect(pred(5), isA<int>());
      });
    });
  });
}
