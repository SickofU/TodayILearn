import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class CalendarTab extends StatefulWidget {
  const CalendarTab({Key? key}) : super(key: key);

  @override
  State<CalendarTab> createState() => _CalendarTabState();
}

class _CalendarTabState extends State<CalendarTab> {
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  CalendarFormat format = CalendarFormat.month;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('ko_KR', null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: SafeArea(
        child: TableCalendar(
          locale: 'ko_KR',
          firstDay: DateTime(2024, 10, 07),
          lastDay: DateTime(2030, 10, 07),
          focusedDay: focusedDay,
          selectedDayPredicate: (DateTime day) {
            return isSameDay(selectedDay, day);
          },
          onDaySelected: (DateTime newSelectedDay, DateTime newFocusedDay) {
            setState(() {
              selectedDay = newSelectedDay;
              focusedDay = newFocusedDay;
            });
          },
          calendarFormat: format,
          onFormatChanged: (CalendarFormat newFormat) {
            setState(() {
              format = newFormat;
            });
          },
          calendarStyle: CalendarStyle(
            markerSize: 10.0,
            markerDecoration: BoxDecoration(
              color: const Color.fromARGB(255, 237, 136, 240),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
