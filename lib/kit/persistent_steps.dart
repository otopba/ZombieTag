class PersistentSteps {
  PersistentSteps._();

  static final steps = [
    326,
    154,
    185,
    328,
    422,
    326,
    155,
    340,
    147,
    106,
    649,
  ];

  static int fromText(String text) {
    return steps[text.hashCode % steps.length];
  }
}
