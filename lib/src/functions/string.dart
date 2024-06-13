/// Returns the uppercase equivalent of [source].
String toUpperCase(String source) => source.toUpperCase();

/// Returns the lowercase equivalent of [source].
String toLowerCase(String source) => source.toLowerCase();

/// Returns the string representation of [object].
String toString(Object? object) => object.toString();

/// Trims [source].
String trim(String source) => source.trim();

/// Trims [source] from the left.
String trimLeft(String source) => source.trimLeft();

/// Trims [source] from the right.
String trimRight(String source) => source.trimRight();

/// Appends [other] to [source].
String append(String other, String source) => source + other;

/// Prepends [other] to [source].
String prepend(String other, String source) => other + source;
