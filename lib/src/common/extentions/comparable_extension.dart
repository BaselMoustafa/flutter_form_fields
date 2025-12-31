extension ComparableExtension<T> on Comparable<T> {
  
  bool isEqualTo(T other) {
    return compareTo(other) == 0;
  }

  bool isGreaterThan(T other) {
    return compareTo(other) > 0;
  }

  bool isGreaterThanOrEqualTo(T other) {
    return compareTo(other) >= 0;
  }

  bool isLessThan(T other) {
    return compareTo(other) < 0;
  }

  bool isLessThanOrEqualTo(T other) {
    return compareTo(other) <= 0;
  }
}