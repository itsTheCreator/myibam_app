import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart';
import 'dart:math';
import 'package:intl/intl.dart';

void main() {
  runApp(CalendarControllerProvider(
    controller: EventController(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFEF6A4C),
        fontFamily: 'Roboto',
      ),
      home: const TimetableScreen(),
    );
  }
}

class TimetableScreen extends StatefulWidget {
  const TimetableScreen({Key? key}) : super(key: key);

  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  final EventController _eventController = EventController();
  final GlobalKey<WeekViewState> _weekViewKey = GlobalKey<WeekViewState>();
  String _activeFilter = 'Tous';
  final List<String> _filters = ['Tous', 'Cours','Devoirs', 'Évèn'];
  DateTime _focusedDate = DateTime(2025, 5, 1);
  DateTime _selectedDate = DateTime(2025, 5, 1);

  @override
  void initState() {
    super.initState();
    _addMockEvents();
  }

  void _addMockEvents() {
    // Définition des modules et professeurs
    final List<Map<String, dynamic>> coursInfo = [
      {
        'module': 'Programmation Mobile',
        'prof': 'Dr. Ouattara Dimitri',
        'color': const Color(0xFF45A3C6),
      },
      {
        'module': 'Base de Données Avancées',
        'prof': 'Prof. Traoré YAYA',
        'color': const Color(0xFFEF6A4C),
      },
      {
        'module': 'Intelligence Artificielle',
        'prof': 'Dr. Traoré YAYA',
        'color': const Color(0xFF4CAF50),
      },
      {
        'module': 'Réseaux Informatiques',
        'prof': 'Dr. Daboné',
        'color': const Color(0xFFFFA726),
      },
      {
        'module': 'Génie Logiciel',
        'prof': 'Prof. Sanou Daouda',
        'color': const Color(0xFF7E57C2),
      }
    ];

    // Horaires fixes pour les cours
    final List<Map<String, dynamic>> timeSlots = [
      {'start': 7, 'startMin': 30, 'end': 12, 'endMin': 30}, // 7h30-12h30
      {'start': 14, 'startMin': 0, 'end': 18, 'endMin': 0}, // 14h-18h
    ];

    // Générer l'emploi du temps pour le mois de mai
    for (int day = 1; day <= 31; day++) {
      final eventDate = DateTime(2025, 5, day);
      
      // Ne pas ajouter d'événements le weekend
      if (eventDate.weekday > 5) continue;

      // Un cours par bloc horaire (matin ou après-midi)
      final numEvents = 1 + Random().nextInt(2); // 1 ou 2 cours par jour
      final usedTimeSlots = <int>[];

      for (int i = 0; i < numEvents; i++) {
        // Sélectionner un créneau horaire non utilisé
        int timeSlotIndex;
        do {
          timeSlotIndex = Random().nextInt(timeSlots.length);
        } while (usedTimeSlots.contains(timeSlotIndex));
        usedTimeSlots.add(timeSlotIndex);

        // Sélectionner un cours aléatoire
        final courseIndex = Random().nextInt(coursInfo.length);
        final course = coursInfo[courseIndex];
        final timeSlot = timeSlots[timeSlotIndex];

        final startTime = DateTime(
          eventDate.year,
          eventDate.month,
          eventDate.day,
          timeSlot['start'],
          timeSlot['startMin'],
        );
        final endTime = DateTime(
          eventDate.year,
          eventDate.month,
          eventDate.day,
          timeSlot['end'],
          timeSlot['endMin'],
        );

        _eventController.add(CalendarEventData(
          date: startTime,
          endDate: endTime,
          title: course['module'],
          description: 'Prof: ${course["prof"]}\nSalle: B5',
          color: course['color'],
        ));
      }
    }

    if (mounted) {
      setState(() {});
    }
  }

  void _filterEvents() {
    // Filtering logic placeholder
    if (mounted) {
      setState(() {});
    }
  }

  String _weekdayAbbr(int weekday) {
    // 1=Monday, 7=Sunday
    const abbr = ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim'];
    return abbr[weekday - 1];
  }

  List<DateTime> _getDaysInWeek(DateTime date) {
    final daysInWeek = <DateTime>[];
    // Trouver le premier jour de la semaine (lundi)
    final monday = date.subtract(Duration(days: date.weekday - 1));
    for (int i = 0; i < 7; i++) {
      daysInWeek.add(monday.add(Duration(days: i)));
    }
    return daysInWeek;
  }

  Widget _buildDayCell(DateTime date) {
    final isToday = date.year == DateTime.now().year &&
        date.month == DateTime.now().month &&
        date.day == DateTime.now().day;
    final isSelected = date.year == _selectedDate.year &&
        date.month == _selectedDate.month &&
        date.day == _selectedDate.day;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedDate = date;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.13,
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFFEF6A4C)
              : (isToday ? const Color(0xFF45A3C6) : Colors.white),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isToday && !isSelected
                ? const Color(0xFF45A3C6)
                : Colors.grey.shade300,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateFormat('E', 'fr_FR').format(date).substring(0, 3).toUpperCase(),
              style: TextStyle(
                color: isSelected || isToday ? Colors.white : Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              date.day.toString(),
              style: TextStyle(
                color: isSelected || isToday ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<CalendarEventData> _getEventsForPeriod(bool isMorning) {
    // Filtrer les événements selon le type sélectionné
    final events = _eventController.getEventsOnDay(_selectedDate).where((event) {
      if (_activeFilter != 'Tous') {
        return event.title.startsWith(_activeFilter);
      }
      return true;
    }).toList();

    // Filtrer selon la période (matin/après-midi)
    return events.where((event) {
      final hour = event.date.hour;
      if (isMorning) {
        return hour >= 7 && hour < 13;
      } else {
        return hour >= 14 && hour < 18;
      }
    }).toList();
  }

  Widget _buildTimeBlock(
    String title,
    String timeRange,
    Color color,
    List<CalendarEventData> events,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: Row(
              children: [
                Icon(
                  title == 'Matin'
                      ? Icons.wb_sunny_outlined
                      : Icons.wb_twilight_outlined,
                  color: color,
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                const Spacer(),
                Text(
                  timeRange,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          if (events.isEmpty)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Aucun événement prévu',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontStyle: FontStyle.italic,
                ),
              ),
            )
          else
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];
                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey.shade200,
                        width: index < events.length - 1 ? 1 : 0,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 4,
                        height: 40,
                        decoration: BoxDecoration(
                          color: event.color,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              event.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              event.description ?? '',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Emploi du temps',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFFEF6A4C),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.chevron_left, color: Colors.black),
                      onPressed: () {
                        setState(() {
                          _focusedDate = _focusedDate.subtract(const Duration(days: 7));
                          _selectedDate = _focusedDate;
                        });
                      },
                    ),
                    Text(
                      DateFormat('MMMM yyyy', 'fr_FR').format(_focusedDate),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.chevron_right, color: Colors.black),
                      onPressed: () {
                        setState(() {
                          _focusedDate = _focusedDate.add(const Duration(days: 7));
                          _selectedDate = _focusedDate;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _getDaysInWeek(_focusedDate)
                        .map((date) => _buildDayCell(date))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _filters.map((filter) {
                  final isActive = _activeFilter == filter;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _activeFilter = filter;
                      });
                      _filterEvents();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isActive ? const Color(0xFFEF6A4C) : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isActive
                              ? const Color(0xFFEF6A4C)
                              : Colors.grey.shade300,
                        ),
                      ),
                      child: Text(
                        filter,
                        style: TextStyle(
                          color: isActive ? Colors.white : Colors.grey.shade700,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildTimeBlock(
                  'Matin',
                  '7h30 - 12h30',
                  const Color(0xFF45A3C6),
                  _getEventsForPeriod(true),
                ),
                const SizedBox(height: 16),
                _buildTimeBlock(
                  'Après-midi',
                  '14h00 - 18h00',
                  const Color(0xFFEF6A4C),
                  _getEventsForPeriod(false),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}