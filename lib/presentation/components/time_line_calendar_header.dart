import 'package:flutter/material.dart';

class TimeLineCalendarHeader extends StatefulWidget {
  DateTime focusedMonth;
  final ValueChanged<DateTime> onMonthChanged;

  TimeLineCalendarHeader({
    Key? key,
    required this.focusedMonth,
    required this.onMonthChanged,
  }) : super(key: key);

  @override
  State<TimeLineCalendarHeader> createState() => _TimeLineCalendarHeaderState();
}

class _TimeLineCalendarHeaderState extends State<TimeLineCalendarHeader> {
  void _prevMonth() {
    setState(() {
      widget.onMonthChanged(
        DateTime(
          widget.focusedMonth.year,
          widget.focusedMonth.month - 1,
        ),
      );
    });
  }

  void _nextMonth() {
    setState(() {
      widget.onMonthChanged(
        DateTime(
          widget.focusedMonth.year,
          widget.focusedMonth.month + 1,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              _prevMonth();
            },
            icon: const Icon(Icons.chevron_left),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: -3,
                child: Text(
                  '${widget.focusedMonth.year}',
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                ),
              ),
              Text('${widget.focusedMonth.month}월'),
            ],
          ),
          IconButton(
            onPressed: () {
              _nextMonth();
            },
            icon: const Icon(Icons.chevron_right),
          )
        ],
      ),
    );
  }
}
