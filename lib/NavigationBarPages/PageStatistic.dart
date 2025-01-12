import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:percent_indicator/percent_indicator.dart';



class Event {
  final String name;

  Event(this.name);

  @override
  String toString() => name; // Represents the event by its name
}

class PageStatistic extends StatefulWidget {
  const PageStatistic({super.key});

  @override
  State<PageStatistic> createState() => _PageStatistic();
}

class _PageStatistic extends State<PageStatistic> {
  // Store the event calendar
  Map<DateTime, List<Event>> event = {};
  // Text controller
  final TextEditingController _eventController = TextEditingController();

  late final ValueNotifier<List<Event>> _SelectedEvents;

  // Variables
  DateTime today = DateTime.now();
  DateTime? _SelectedDay;
  int DailyStreakVar = 0;
  double quest_percent3 = 0, quest_percent2 = 0, quest_percent1 = 0 ;

  @override
  void initState() {
    super.initState();
    _SelectedDay = today;
    _SelectedEvents = ValueNotifier(_getEventForDay(_SelectedDay!));
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
      _SelectedDay = day; // Update the selected day
      _SelectedEvents.value = _getEventForDay(_SelectedDay!);
    });
  }

  List<Event> _getEventForDay(DateTime day) {
    // Retrieve all events from the selected day
    return event[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {

    //for(int Printing = 0; Printing / 2 == 0; Printing ++){
      //event.forEach((key,value)=> print('Key = $key | value = $value'));
    //}
    
    CalendarFormat calendarFormat = CalendarFormat.week; // Changed to month for better usability
    return Container(
      child: ListView(
        children: [
          Column(
            children: [
              // Button for event
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        scrollable: true,
                        title: const Text("Event today's name"),
                        content: Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextField(
                            controller: _eventController,
                            decoration: const InputDecoration(hintText: "Enter event name"),
                          ),
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              if (_eventController.text.isNotEmpty) {
                                // Store event name into the map
                                if (event[_SelectedDay] == null) {
                                  event[_SelectedDay!] = [];
                                }
                                event[_SelectedDay!]!.add(Event(_eventController.text));
                                Navigator.of(context).pop();
                                _eventController.clear(); // Clear the text field
                                _SelectedEvents.value = _getEventForDay(_SelectedDay!);
                                quest_percent1 += 0.2;
                                quest_percent2 += 0.2;
                                quest_percent3 += 0.2;
                              }
                            },
                            child: const Text("Submit"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Icon(Icons.add),
              ),

              // TableCalendar
              TableCalendar(
                calendarFormat: calendarFormat,
                locale: "en_US",
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: today,
                eventLoader: _getEventForDay,
                onDaySelected: _onDaySelected,
                selectedDayPredicate: (day) => isSameDay(day, today),
                calendarBuilders: const CalendarBuilders(),
                headerStyle: const HeaderStyle(formatButtonVisible: false),
                availableGestures: AvailableGestures.all,
                calendarStyle: CalendarStyle(
                  markerDecoration: BoxDecoration(color: const Color.fromARGB(224, 78, 18, 18), borderRadius: BorderRadius.circular(10)),
                  ),
              ),
            

              
              ClipRRect(//Barbell WO image
                borderRadius: BorderRadius.circular(20),  // Adjust this for more/less rounded corners
                child: Container(
                  margin:const EdgeInsets.all(10),
                  width: 500,     // Set width of the container
                  height: 200,    // Set height of the container
                  child: Image.asset(
                    'images/WObarbel_image.png',  // Path to the image file
                    fit: BoxFit.fill,             // Ensure the image covers the entire area
                  ),
                ),
              ),


              //WO history box
              SizedBox(
                height: 200,
                child: ValueListenableBuilder<List<Event>>(
                  valueListenable: _SelectedEvents,
                  builder: (context, value, _) {
                    return ListView.builder(
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            onTap: () => print("Event tapped: ${value[index]}"),
                            title: Text('${value[index]}'), // This will use toString()
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              Row( // Daily STreak Judul
                children: [ 
                  Container(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: const Text(
                      "Daily Streak", 
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 28),
                    ),
                  ),
                ]
               ),
              Container( //Box Dailly streak
                padding: const EdgeInsets.only(left: 10),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(225, 199, 41, 41),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 5),
                height: 80,
                child: Row(
                  children: [
                    Text("Daily Streaks $DailyStreakVar", style: const TextStyle(fontSize: 20),),
                    const Icon(Icons.stream_sharp),
                  ],
                )
              ),

              Row( // Achievment Judul
                children: [ 
                  Container(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: const Text(
                      "Achievment", 
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 28),
                    ),
                  ),
                ]
              ),

              
              Column(
                children : [//the quest1
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: LinearPercentIndicator(
                      width : MediaQuery.of(context).size.width - 300,
                      lineHeight: 20.0,
                      percent: quest_percent1,
                      progressColor: Colors.red,
                      barRadius: const Radius.circular(10),
                      leading: const Expanded(
                        flex: 2,
                        child: Text("barbel squats = 10 reps 100 repetition"),
                        ),
                      trailing : Expanded(
                        flex: 1,
                        child: Image.asset('images/WObarbel_image.png',)
                      )
                    ),
                  ),

                  Padding(//the quest2
                    padding: const EdgeInsets.all(15.0),
                    child: LinearPercentIndicator(
                      width : MediaQuery.of(context).size.width - 300,
                      lineHeight: 20.0,
                      percent: quest_percent2,
                      progressColor: Colors.red,
                      barRadius: const Radius.circular(10),
                      leading: const Expanded(
                        flex: 2,
                        child: Text("barbel jump = 10 reps 100 repetition"),
                        ),
                      trailing : Expanded(
                        flex: 1,
                        child: Image.asset('images/WObarbel_image.png',)
                      )
                    ),
                  ),

                  Padding(//the quest3
                    padding: const EdgeInsets.all(15.0),
                    child: LinearPercentIndicator(
                      width : MediaQuery.of(context).size.width - 300,
                      lineHeight: 20.0,
                      percent: quest_percent3,
                      progressColor: Colors.red,
                      barRadius: const Radius.circular(10),
                      leading: const Expanded(
                        flex: 2,
                        child: Text("barbel kuyang = 10 reps 100 repetition"),
                        ),
                      trailing : Expanded(
                        flex: 1,
                        child: Image.asset('images/WObarbel_image.png',)
                      )
                    ),
                  ),
                ]
              ),

              Container( //Box Task
                padding: const EdgeInsets.only(left: 10),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(225, 199, 41, 41),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                margin: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 10),
                height: 70,
                child: const Row(
                  children: [
                    Text("Daily Task ", style: TextStyle(fontSize: 20),)
                  ],
                )
              ),

              Row(// task box 1
                children : [
                  Container( //subBox task 1
                    padding: const EdgeInsets.only(left: 10),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(225, 199, 41, 41),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    margin: const EdgeInsets.only(left: 30, right: 30, bottom: 5, top: 10),
                    height: 60,
                    width : MediaQuery.of(context).size.width - 200,
                    child: const Row(
                      children: [
                        Expanded(child: Text("Lakukan daily login ", style: TextStyle(fontSize: 20),))
                      ],
                    )
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularPercentIndicator( //Circular Percent indicator1
                      radius: 60.0,
                      lineWidth: 13.0,
                      percent: 0.5,
                      animateFromLastPercent: true,
                      center: const Text(
                        "50%",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Colors.purple,
                    ),
                  ),
                ]
              ),

              Row(// task box 2
                children : [
                  Container( //subBox task 2
                    padding: const EdgeInsets.only(left: 10),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(225, 199, 41, 41),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    margin: const EdgeInsets.only(left: 30, right: 30, bottom: 5, top: 10),
                    height: 60,
                    width : MediaQuery.of(context).size.width - 200,
                    child: const Row(
                      children: [
                        Expanded(child: Text("Lakukan gerakan push up 1 set", style: TextStyle(fontSize: 20),))
                      ],
                    )
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularPercentIndicator( //Circular Percent indicator2
                      radius: 60.0,
                      lineWidth: 13.0,
                      percent: 1,
                      animateFromLastPercent: true,
                      center: const Text(
                        "100%",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Colors.purple,
                    ),
                  ),
                ]
              )
            ],
          )
        ],
      ),
    );
  }
}