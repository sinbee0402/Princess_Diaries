import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:princess_diaries/presentation/custom_popup.dart';
import 'package:table_calendar/table_calendar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final CalendarFormat _calendarFormat = CalendarFormat.month;

  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  final _firstDay = DateTime.utc(
    DateTime.now().year - 10,
    DateTime.now().month,
    DateTime.now().day,
  );
  final _lastDay = DateTime.utc(
    DateTime.now().year + 10,
    DateTime.now().month,
    DateTime.now().day,
  );

  Widget _buildDowWidget(DateTime date) {
    Color color;
    if (date.weekday == DateTime.saturday) {
      color = Colors.blue;
    } else if (date.weekday == DateTime.sunday) {
      color = Colors.red;
    } else {
      color = Colors.black;
    }

    final dowText = DateFormat.E('ko_KR').format(date);

    return Center(
      child: Text(
        dowText,
        style: TextStyle(color: color),
      ),
    );
  }

  Widget _buildDayWidget(DateTime date) {
    Color color;
    if (date.weekday == DateTime.saturday) {
      color = Colors.blue;
    } else if (date.weekday == DateTime.sunday) {
      color = Colors.red;
    } else {
      color = Colors.black;
    }

    return Center(
      child: Text(
        date.day.toString(),
        style: TextStyle(color: color),
      ),
    );
  }

  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return CustomPopup(selectedDate: _selectedDay);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('main page'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TableCalendar(
              locale: 'ko_KR',
              calendarFormat: _calendarFormat,
              firstDay: _firstDay,
              lastDay: _lastDay,
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
                _showPopup(context);
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
              headerStyle: HeaderStyle(
                titleCentered: true,
                titleTextFormatter: (date, locale) =>
                    DateFormat.MMMM(locale).format(date),
                formatButtonVisible: false,
                headerPadding: const EdgeInsets.symmetric(vertical: 16),
                titleTextStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                leftChevronVisible: false,
                rightChevronVisible: false,
                // leftChevronIcon: Icon(Icons.chevron_left),
                // rightChevronIcon: Icon(Icons.chevron_right),
              ),
              calendarStyle: CalendarStyle(
                selectedDecoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/crown-gb5a99fc9f_1280.png'),
                      fit: BoxFit.cover),
                  //color: Colors.pinkAccent,
                ),
                todayDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.pinkAccent,
                    width: 2,
                  ),
                ),
                todayTextStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                // weekendTextStyle: const TextStyle(color: Colors.red),
                holidayTextStyle: const TextStyle(color: Colors.red),
              ),
              calendarBuilders: CalendarBuilders(
                dowBuilder: (_, weekday) {
                  return _buildDowWidget(weekday);
                },
                defaultBuilder: (_, date, focusedDay) {
                  return _buildDayWidget(date);
                },
              ),
              daysOfWeekStyle: const DaysOfWeekStyle(
                weekendStyle: TextStyle(color: Colors.red),
              ),
              daysOfWeekHeight: 24,
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Container(
                color: Colors.grey[300],
                child: Stack(
                  children: [
                    Positioned(
                      top: 4,
                      right: 4,
                      child: IconButton(
                        icon: const Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 24,
                        ),
                        onPressed: () {
                          _showPopup(context);
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
