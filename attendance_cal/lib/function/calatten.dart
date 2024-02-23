// ignore_for_file: file_names

class CalAttendance {
  int percentage = 20;
  double remainingHours = 0;
  double percentageOfAttendance = 0;
  List<double> calculaterLabTheory(
      {required int theoryCont,
      required int labCont,
      required int totalHours}) {
    remainingHours = (totalHours * (0.2)) - (theoryCont + (labCont * 2));
    percentageOfAttendance = (totalHours - (theoryCont + (labCont * 2))) / 0.60;
    return [remainingHours, percentageOfAttendance];
  }

  List<double> calculaterTheory(
      {required int theoryCont, required int totalHours}) {
    remainingHours = (totalHours * (0.2)) - (theoryCont);
    percentageOfAttendance = (totalHours - theoryCont) / 0.45;
    return [remainingHours, percentageOfAttendance];
  }

  List<double> calculaterLab({required int labCont, required int totalHours}) {
    remainingHours = (totalHours * (0.2)) - (labCont * 2);
    percentageOfAttendance = (totalHours - (labCont * 2)) / 0.30;
    return [remainingHours, percentageOfAttendance];
  }
}
