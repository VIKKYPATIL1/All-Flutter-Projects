import 'package:attendance_cal/main.dart';
import 'package:flutter/material.dart';

import 'package:attendance_cal/function/calAtten.dart';
import 'package:attendance_cal/screen/resultscreen.dart';
import 'package:attendance_cal/model/result.dart';
import 'package:attendance_cal/widget/heading.dart';

class FormBody extends StatefulWidget {
  const FormBody({super.key});
  @override
  State<FormBody> createState() {
    return _FormBody();
  }
}

class _FormBody extends State<FormBody> {
  var rollNoController = TextEditingController();
  var semesterController = TextEditingController();
  var subjectController = TextEditingController();
  var theoryController = TextEditingController();
  var labsController = TextEditingController();

  List<String> listOfLecture = <String>[
    "Select Component",
    "Theory",
    'Theory+Lab',
    'Lab'
  ];
  String? dropDownlecture;
  int totalHours = 45;
  int remainingHours = 45;

  Widget content = const Text('45');
  late Widget bunkcontent;

  @override
  void initState() {
    super.initState();
    bunkcontent = const Text("No Component Selected!");
  }

  void selectionOfChoice(String value) {
    setState(() {
      dropDownlecture = value;
      if (dropDownlecture == 'Theory') {
        totalHours = 45;
        content = const Text('45 Lecture');
        bunkcontent = Card(
          elevation: 20,
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(100)),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return;
              }
              return null;
            },
            controller: theoryController,
            decoration: InputDecoration(
                filled: true,
                fillColor: kcolorScheme.inversePrimary,
                label: const Text("Theory Missed")),
          ),
        );
      }
      if (dropDownlecture == 'Lab') {
        totalHours = 30;
        content = const Text('15 Labs');
        bunkcontent = Card(
          elevation: 20,
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(100)),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return;
              }
              return null;
            },
            controller: labsController,
            decoration: InputDecoration(
                filled: true,
                fillColor: kcolorScheme.inversePrimary,
                label: const Text("Lab Missed")),
          ),
        );
      }
      if (dropDownlecture == 'Theory+Lab') {
        totalHours = 60;
        content = const Text('30 Lecture + 15 Labs');
        bunkcontent = Row(
          children: [
            Expanded(
                child: Card(
              elevation: 20,
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter correct value";
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                controller: theoryController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: kcolorScheme.inversePrimary,
                    label: const Text("Theory Missed")),
              ),
            )),
            const VerticalDivider(
              width: 20,
              thickness: 30,
            ),
            Expanded(
                child: Card(
              elevation: 20,
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Correct value";
                  }
                  return null;
                },
                controller: labsController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: kcolorScheme.inversePrimary,
                    label: const Text("Lab Missed")),
              ),
            ))
          ],
        );
      }
    });
    if (dropDownlecture == "Select Component") {
      bunkcontent = const Text("No Component Selected!");
    }
  }

  void resultOfAttendance() {
    List<double> result = [];
    CalAttendance calculateAttendance = CalAttendance();
    if (dropDownlecture == 'Theory') {
      result = calculateAttendance.calculaterTheory(
          theoryCont: int.parse(theoryController.text), totalHours: totalHours);
    }
    if (dropDownlecture == 'Lab') {
      result = calculateAttendance.calculaterLab(
          labCont: int.parse(labsController.text), totalHours: totalHours);
    }
    if (dropDownlecture == 'Theory+Lab') {
      result = calculateAttendance.calculaterLabTheory(
          theoryCont: int.parse(theoryController.text),
          labCont: int.parse(labsController.text),
          totalHours: totalHours);
    }
    Result resultData = Result(
        rollNo: "",
        sem: "",
        subject: "",
        subComponent: "",
        totalHours: 0,
        theoryMissed: 0,
        labMissed: 0,
        result: []);
    if (dropDownlecture == "Theory") {
      resultData = Result(
          rollNo: rollNoController.text,
          sem: semesterController.text,
          subject: subjectController.text,
          subComponent: dropDownlecture as String,
          totalHours: totalHours,
          theoryMissed: int.parse(theoryController.text),
          labMissed: 0,
          result: result);
    }
    if (dropDownlecture == "Lab") {
      resultData = Result(
          rollNo: rollNoController.text,
          sem: semesterController.text,
          subject: subjectController.text,
          subComponent: dropDownlecture as String,
          totalHours: totalHours,
          theoryMissed: 0,
          labMissed: int.parse(labsController.text),
          result: result);
    }
    if (dropDownlecture == "Theory+Lab") {
      resultData = Result(
          rollNo: rollNoController.text,
          sem: semesterController.text,
          subject: subjectController.text,
          subComponent: dropDownlecture as String,
          totalHours: totalHours,
          theoryMissed: int.parse(theoryController.text),
          labMissed: int.parse(labsController.text),
          result: result);
    }
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          resultData: resultData,
        ),
      ),
    );
  }

  @override
  void dispose() {
    rollNoController.dispose();
    semesterController.dispose();
    subjectController.dispose();
    theoryController.dispose();
    labsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String dropDownlecture = listOfLecture.first;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        const Heading(),
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Expanded(
              child: Card(
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                elevation: 20,
                child: TextFormField(
                  controller: rollNoController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter Roll number";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      fillColor: kcolorScheme.inversePrimary,
                      filled: true,
                      label: const Text("Roll No :")),
                ),
              ),
            ),
            const VerticalDivider(
              width: 20,
              thickness: 30,
            ),
            Expanded(
              child: Card(
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                elevation: 20,
                child: TextFormField(
                  controller: semesterController,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "Semester field must not be empty ";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      fillColor: kcolorScheme.inversePrimary,
                      filled: true,
                      label: const Text("Semester :")),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Card(
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(100)),
          elevation: 20,
          child: TextFormField(
            controller: subjectController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Subject';
              }
              return null;
            },
            decoration: InputDecoration(
                fillColor: kcolorScheme.inversePrimary,
                filled: true,
                label: const Text("Subject Name :")),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Card(
          elevation: 20,
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(100)),
          child: DropdownButtonFormField(
            dropdownColor: kcolorScheme.inversePrimary,
            value: dropDownlecture,
            items: [
              for (final cat in listOfLecture)
                DropdownMenuItem(
                    value: cat,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                          height: 10,
                        ),
                        Text(cat),
                      ],
                    ))
            ],
            onChanged: (value) => selectionOfChoice(value!),
            decoration: const InputDecoration(label: Text('Subject Component')),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Card(
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(100)),
          elevation: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Total : ",
              ),
              content,
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        bunkcontent,
        const SizedBox(
          height: 30,
        ),
        ElevatedButton.icon(
            style: const ButtonStyle(
              elevation: MaterialStatePropertyAll(20),
            ),
            onPressed: () {
              resultOfAttendance();
            },
            icon: const Icon(Icons.speed),
            label: const Text("Result")),
      ]),
    );
  }
}
