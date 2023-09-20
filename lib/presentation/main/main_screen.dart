import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:princess_diaries/presentation/components/future_popup.dart';
import 'package:princess_diaries/presentation/main/main_view_model.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final CalendarFormat _calendarFormat = CalendarFormat.month;

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
    final dowText = DateFormat.E().format(date)[0];

    return Center(
      child: Text(
        dowText,
        style: TextStyle(
          color: Colors.black.withOpacity(0.5),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildDayWidget(DateTime date) {
    Color color;

    if (date == DateTime.now()) {
      color = Colors.black;
    } else if (date.isBefore(DateTime.now())) {
      color = Colors.black;
    } else {
      color = Colors.grey;
    }

    return Center(
      child: Text(
        date.day.toString(),
        style: TextStyle(color: color),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    final state = viewModel.state;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          DateFormat.yMMMM('ko_KR').format(viewModel.focusedMonth),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // TODO : 공유 기능
              showDialog(
                context: context,
                builder: (_) {
                  return const FuturePopup();
                },
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              context.push('/settings');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TableCalendar(
                locale: 'ko_KR',
                calendarFormat: _calendarFormat,
                firstDay: _firstDay,
                lastDay: _lastDay,
                focusedDay: _focusedDay,
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                  viewModel.changeMonth(_focusedDay);
                },
                // eventLoader: (day) {
                //   final List<Post> events = [];
                //   state.posts.map((post) {
                //     if (post.postingTime == day) {
                //       events.add(post);
                //     }
                //   }).toList();
                //   return events ?? [];
                // },
                headerStyle: HeaderStyle(
                  titleCentered: true,
                  titleTextFormatter: (date, locale) {
                    return DateFormat.yMMMM().format(date);
                  },
                  formatButtonVisible: false,
                  headerPadding: const EdgeInsets.symmetric(vertical: 16),
                  titleTextStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  leftChevronVisible: true,
                  rightChevronVisible: true,
                ),
                calendarStyle: const CalendarStyle(
                  outsideDaysVisible: false,
                  todayDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFF7B7D3),
                  ),
                  todayTextStyle: TextStyle(
                    color: Color(0xFFED0F69),
                    fontWeight: FontWeight.bold,
                  ),
                  holidayTextStyle: TextStyle(color: Colors.red),
                  markerDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/icon-question-mark.png'),
                        fit: BoxFit.cover),
                  ),
                ),
                calendarBuilders: CalendarBuilders(
                  dowBuilder: (_, weekday) {
                    return _buildDowWidget(weekday);
                  },
                  defaultBuilder: (_, date, focusedDay) {
                    return _buildDayWidget(date);
                  },
                  // markerBuilder: (_, date, event) {
                  //   if (event.isNotEmpty) {
                  //     return Container(
                  //       decoration: const BoxDecoration(
                  //         shape: BoxShape.circle,
                  //         image: DecorationImage(
                  //             image:
                  //                 AssetImage('assets/icon-question-mark.png'),
                  //             fit: BoxFit.cover),
                  //       ),
                  //     );
                  //   }
                  // },
                ),
                daysOfWeekStyle: const DaysOfWeekStyle(
                  weekendStyle: TextStyle(color: Colors.red),
                ),
                daysOfWeekHeight: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
