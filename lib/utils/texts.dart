extension NullableTextUtils on String? {
  bool get isNullOrEmpty => this?.isEmpty ?? true;

  bool get isNotNullNorEmpty => !isNullOrEmpty;

  bool get isNullOrBlank => this?.trim().isEmpty ?? true;
}
