class Result {
  Result(
      {required this.rollNo,
      required this.sem,
      required this.subject,
      required this.subComponent,
      required this.totalHours,
      required this.theoryMissed,
      required this.labMissed,
      required this.result});
  final String rollNo;
  final String sem;
  final String subject;
  final String subComponent;
  final int totalHours;
  final int theoryMissed;
  final int labMissed;
  final List<double> result;
}
