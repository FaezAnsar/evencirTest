enum DayOfWeek {
  sunday('Sunday', 0),
  monday('Monday', 1),
  tuesday('Tuesday', 2),
  wednesday('Wednesday', 3),
  thursday('Thursday', 4),
  friday('Friday', 5),
  saturday('Saturday', 6);

  const DayOfWeek(this.label, this.value);
  final String label;
  final int value;

  static DayOfWeek? fromValue(int value) {
    return DayOfWeek.values.where((day) => day.value == value).firstOrNull;
  }
}
