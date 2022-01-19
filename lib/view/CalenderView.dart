import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jiffy/jiffy.dart';
import 'package:meeting_app/widgets/utils.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderView extends StatefulWidget {
  const CalenderView({Key? key}) : super(key: key);

  @override
  _CalenderViewState createState() => _CalenderViewState();
}

class _CalenderViewState extends State<CalenderView> {
  int selectedTool = 0;
  String finalString = '';
  String dateString = '';
  var buttons = [
    '09:00 AM',
    '12:30 PM',
    '03:30 PM',
    '06:00 PM',
    '08:30 PM',
    '11:30 PM'
  ];
  List<dynamic> tools = [
    {
      'image': 'https://cdn-icons-png.flaticon.com/128/732/732244.png',
      'selected_image': 'https://cdn-icons-png.flaticon.com/128/732/732244.png',
      'name': 'Sketch',
      'description': 'The digital design platform.',
    },
    {
      'image': 'https://img.icons8.com/color/2x/adobe-xd.png',
      'selected_image': 'https://img.icons8.com/color/2x/adobe-xd--v2.gif',
      'name': 'Adobe XD',
      'description': 'Fast & powerful UI/UX design solution.',
    },
    {
      'image': 'https://img.icons8.com/color/2x/figma.png',
      'selected_image': 'https://img.icons8.com/color/2x/figma--v2.gif',
      'name': 'Figma',
      'description': 'The collaborative interface design tool.',
    }
  ];

  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    //print('_onDaySelected');
    //print(finalString);
    //print(dateString);
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
              ),
            ),
          ],
        ),
        title: Text(
          'Pick Date & Time',
          style: TextStyle(fontSize: 16, color: Colors.black, height: 1.2),
          //GoogleFonts.rubik(fontSize: 16, height: 1.2, color: Colors.black),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TableCalendar<Event>(
                firstDay: kFirstDay,
                lastDay: kLastDay,
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                rangeStartDay: _rangeStart,
                rangeEndDay: _rangeEnd,
                eventLoader: _getEventsForDay,
                startingDayOfWeek: StartingDayOfWeek.monday,
                calendarStyle: CalendarStyle(
                  // Use `CalendarStyle` to customize the UI
                  outsideDaysVisible: false,
                ),
                onDaySelected: _onDaySelected,
                onRangeSelected: _onRangeSelected,
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text('Available Slots',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10,
              ),
              Text('Current Date',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 20,
              ),
              GroupButton(
                isRadio: false,
                spacing: 10,
                groupingType: GroupingType.wrap,
                direction: Axis.horizontal,
                selectedButtons: const [0, 2],
                onSelected: (index, isSelected) {
                  if (isSelected) {
                    finalString = buttons[index];
                    dateString =
                        finalString + ', ' + Jiffy(_selectedDay).yMMMMd;
                    //print(finalString);
                    //print(dateString);
                  }
                  print('$index button is selected $isSelected');
                },
                buttons: buttons,
                buttonWidth: MediaQuery.of(context).size.width / 3 - 30,
                buttonHeight: 40,
                selectedTextStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.black,
                ),
                selectedColor: HexColor('#F5DF5D'),
                unselectedColor: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                disabledButtons: [0, 4],
                runSpacing: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.pop(context, dateString);
                      },
                      color: Colors.black,
                      height: 30,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding: EdgeInsets.only(
                          left: 50, right: 50, bottom: 10, top: 10),
                      child: Center(
                        child: Text(
                          "Pick",
                          style: GoogleFonts.rubik(
                              fontSize: 14, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
