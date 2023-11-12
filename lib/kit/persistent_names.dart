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
    'Charlotte',
    'Amelia',
    'Harper',
    'Evelyn',
    'Abigail',
    'James',
    'Benjamin',
    'William',
    'Oliver',
    'Henry',
  ];

  static String fromText(String text) {
    return names[text.hashCode % names.length];
  }
}
