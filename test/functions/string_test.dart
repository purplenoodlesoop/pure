import 'package:pure/src/functions/string.dart' as pure_string;
import 'package:test/test.dart';

void main() {
  group('string functions', () {
    group('toUpperCase', () {
      test('converts to uppercase', () {
        expect(pure_string.toUpperCase('hello'), 'HELLO');
      });

      test('leaves uppercase unchanged', () {
        expect(pure_string.toUpperCase('WORLD'), 'WORLD');
      });

      test('handles empty string', () {
        expect(pure_string.toUpperCase(''), '');
      });

      test('handles mixed case', () {
        expect(pure_string.toUpperCase('HeLLo WoRLd'), 'HELLO WORLD');
      });
    });

    group('toLowerCase', () {
      test('converts to lowercase', () {
        expect(pure_string.toLowerCase('HELLO'), 'hello');
      });

      test('leaves lowercase unchanged', () {
        expect(pure_string.toLowerCase('world'), 'world');
      });

      test('handles empty string', () {
        expect(pure_string.toLowerCase(''), '');
      });

      test('handles mixed case', () {
        expect(pure_string.toLowerCase('HeLLo WoRLd'), 'hello world');
      });
    });

    group('toString', () {
      test('converts int to string', () {
        expect(pure_string.toString(42), '42');
      });

      test('converts double to string', () {
        expect(pure_string.toString(3.14), '3.14');
      });

      test('converts null to string', () {
        expect(pure_string.toString(null), 'null');
      });

      test('passes string through', () {
        expect(pure_string.toString('hello'), 'hello');
      });

      test('converts bool to string', () {
        expect(pure_string.toString(true), 'true');
        expect(pure_string.toString(false), 'false');
      });
    });

    group('trim', () {
      test('removes leading and trailing whitespace', () {
        expect(pure_string.trim('  hello  '), 'hello');
      });

      test('handles no whitespace', () {
        expect(pure_string.trim('hello'), 'hello');
      });

      test('handles only whitespace', () {
        expect(pure_string.trim('   '), '');
      });

      test('handles empty string', () {
        expect(pure_string.trim(''), '');
      });

      test('handles tabs and newlines', () {
        expect(pure_string.trim('\t\nhello\n\t'), 'hello');
      });
    });

    group('trimLeft', () {
      test('removes only leading whitespace', () {
        expect(pure_string.trimLeft('  hello  '), 'hello  ');
      });

      test('handles no leading whitespace', () {
        expect(pure_string.trimLeft('hello  '), 'hello  ');
      });

      test('handles empty string', () {
        expect(pure_string.trimLeft(''), '');
      });
    });

    group('trimRight', () {
      test('removes only trailing whitespace', () {
        expect(pure_string.trimRight('  hello  '), '  hello');
      });

      test('handles no trailing whitespace', () {
        expect(pure_string.trimRight('  hello'), '  hello');
      });

      test('handles empty string', () {
        expect(pure_string.trimRight(''), '');
      });
    });

    group('append', () {
      test('appends other to source (source + other)', () {
        expect(pure_string.append('!', 'hello'), 'hello!');
      });

      test('argument order: append(other, source) = source + other', () {
        expect(pure_string.append(' world', 'hello'), 'hello world');
      });

      test('handles empty other', () {
        expect(pure_string.append('', 'hello'), 'hello');
      });

      test('handles empty source', () {
        expect(pure_string.append('!', ''), '!');
      });
    });

    group('prepend', () {
      test('prepends other to source (other + source)', () {
        expect(pure_string.prepend('hello ', 'world'), 'hello world');
      });

      test('argument order: prepend(other, source) = other + source', () {
        expect(pure_string.prepend('prefix-', 'value'), 'prefix-value');
      });

      test('handles empty other', () {
        expect(pure_string.prepend('', 'hello'), 'hello');
      });

      test('handles empty source', () {
        expect(pure_string.prepend('hello', ''), 'hello');
      });
    });

    group('append and prepend relationship', () {
      test('append(other, source) == prepend(source, other)', () {
        expect(
          pure_string.append(' world', 'hello'),
          pure_string.prepend('hello', ' world'),
        );
      });
    });
  });
}
