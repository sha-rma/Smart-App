// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../History/historyMain.dart';
import '../../questionnare/questionnairePage.dart';

class PatientBody extends StatefulWidget {
  const PatientBody({Key? key}) : super(key: key);

  @override
  State<PatientBody> createState() => _PatientBodyState();
}

class _PatientBodyState extends State<PatientBody> {
  // ignore: unused_field
  var _calendarFormat = CalendarFormat.week;
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Container(
              height: screenSize.height * 0.2,
              width: screenSize.width,
              decoration: BoxDecoration(
                color: Color(0xFF07919D),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TableCalendar(
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: DateTime.now(),
                  calendarStyle: CalendarStyle(
                    defaultDecoration: BoxDecoration(
                        color: Color(0xFF07919D),
                        shape: BoxShape.circle,
                        border: Border.all(width: 1, color: Colors.white)),
                    weekendDecoration: BoxDecoration(
                        color: Color(0xFF07919D),
                        shape: BoxShape.circle,
                        border: Border.all(width: 1, color: Colors.white)),
                    todayDecoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(width: 1, color: Colors.white)),
                    defaultTextStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                    weekendTextStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                    todayTextStyle: TextStyle(
                        color: Color(0xFF07919D),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  headerStyle: HeaderStyle(
                    titleTextStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                    formatButtonTextStyle: TextStyle(color: Colors.white),
                    formatButtonDecoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(20)),
                    leftChevronIcon: Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                    ),
                    rightChevronIcon: Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    ),
                  ),
                  daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      weekendStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  availableCalendarFormats: {
                    CalendarFormat.week: "Week",
                    CalendarFormat.month: "Month"
                  },
                  // calendarFormat: _calendarFormat,
                  calendarFormat: CalendarFormat.week,
                  onFormatChanged: (format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Questionnaire(details: {})));
                    },
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomCenter,
                          fit: StackFit.loose,
                          children: [
                            Container(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                      'https://i.imgur.com/YQ5Ixni.jpeg',
                                      fit: BoxFit.fill,
                                      color: Colors.white.withOpacity(0.7),
                                      colorBlendMode: BlendMode.modulate,
                                      width: screenSize.width / 1.2,
                                      height: screenSize.height / 4)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 145),
                              child: Text("Daily Questionnaire",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 95,
                              ),
                              child: Text(
                                  "Click on \"Start\" to complete today's \n questionnaire",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 22),
                              child: MaterialButton(
                                minWidth: screenSize.width / 1.5,
                                height: screenSize.height / 14,
                                color: Color(0xFF07919D),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Questionnaire(
                                                details: {},
                                              )));
                                },
                                child: Text(
                                  "Start",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(23.0),
                          child: InkWell(
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              fit: StackFit.loose,
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                        'https://i.imgur.com/TdEEtZy.jpg',
                                        fit: BoxFit.fill,
                                        width: screenSize.width / 1.2,
                                        height: screenSize.height / 8)),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 30, right: 170),
                                  child: Text("History",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30)),
                                ),
                              ],
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HistoryMain()));
                            },
                          ),
                        ),
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
