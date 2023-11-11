class PersistentNames {
  PersistentNames._();

  static final names = [
    'Olivia',
    'Emma',
    'Ava',
    'Sophia',
    'Isabella',
    'Liam',
    'Noah',
    'Ethan',
    'Mason',
    'Lucas',
  ];

  static String fromText(String text) {
    return names[text.hashCode % names.length];
  }
}
