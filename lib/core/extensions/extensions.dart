extension IntNotNull on int? {
  int onNull() {
    if (this == null) {
      return 0;
    } else {
      return this!;
    }
  }
  int onQtyNull() {
    if (this == null) {
      return 1;
    } else {
      return this!;
    }
  }
}

extension NonNullDouble on double? {
  double onNull() {
    if (this == null) {
      return 0;
    } else {
      return this!;
    }
  }
}

extension NonNullString on String? {
  String onNull() {
    if (this == null) {
      return '';
    } else {
      return this!;
    }
  }

  String parseLocale() {
    if (this == null) {
      return 'en';
    } else {
      return this!;
    }
  }
}

extension NonNullListString on List<String>? {
  List<String> onNull() {
    if (this == null) {
      return [];
    } else {
      return this!;
    }
  }
}

extension NonNullList<T> on List<T>? {
  List<T> onNull() {
    if (this == null) {
      return [];
    } else {
      return this!;
    }
  }
}

extension NonNullListInt on List<int>? {
  List<int> onNull() {
    if (this == null) {
      return [];
    } else {
      return this!;
    }
  }
}

extension NonNullBoolean on bool? {
  bool onNull() {
    if (this == null) {
      return false;
    } else {
      return this!;
    }
  }
}


extension NonNullFunction on Function()? {
  Function() onNull() {
    if (this == null) {
      return () {};
    } else {
      return this!;
    }
  }
}


extension NonNullDateTime on DateTime? {
  DateTime onNull() {
    if (this == null) {
      return DateTime.now();
    } else {
      return this!;
    }
  }
}

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + substring(1);
  }
}