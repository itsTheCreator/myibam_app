import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:myibam_app/ui/screens/notification_screen.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agenda Étudiant',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const AgendaScreen(),
    );
  }
}

class AgendaScreen extends StatefulWidget {
  const AgendaScreen({Key? key}) : super(key: key);

  @override
  State<AgendaScreen> createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen> {
  late String _currentDate;

  @override
  void initState() {
    super.initState();
    _updateDate();
  }

  void _updateDate() {
    final now = DateTime.now();
    final formatter = DateFormat('EEEE, d MMMM', 'fr_FR');
    setState(() {
      _currentDate = formatter.format(now);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(62),
        child: Container(
          color: const Color(0xFFEF6A4C),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  // Photo de profil
                  const CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: Color(0xFF45A3C6)),
                  ),
                  const SizedBox(width: 12),
                  // Infos utilisateur
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Yankiné Eliel',
                        style: TextStyle(
                          color: Colors.white, 
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'L3 Informatique',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                  const Spacer(),
                  // Icônes
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotificationScreen(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.2),
                      ),
                      child: const Icon(Icons.notifications, color: Colors.white, size: 20),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.2),
                    ),
                    child: const Icon(Icons.settings, color: Colors.white, size: 20),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            // Contenu principal
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Message de bienvenue
                    Row(
                      children: const [
                        Text(
                          'Bonjour, Eliel ',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '👋',
                          style: TextStyle(fontSize: 22),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Voici ton programme d'aujourd'hui",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 20),
                    
                    // Date du jour
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Aujourd\'hui',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              _currentDate,
                              style: const TextStyle(color: Colors.black54, fontSize: 16),
                            ),
                          ],
                        ),
                        // Switch
                        Container(
                          width: 50,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0xFF2C5282),
                          ),
                          padding: const EdgeInsets.all(2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 21,
                                height: 21,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    
                    // --------- BLOC MATIN ---------
                    _buildTimeBlock(
                      title: 'Matin',
                      timeRange: '7h30 - 12h30',
                      backgroundColor: const Color(0xFFF8F8FC),
                      courses: [
                        CourseItem(
                          title: 'Développement Mobile',
                          teacher: 'M. Ouattara Dimitri',
                          time: '10:00 - 12:00',
                          isActive: true,
                          color: const Color(0xFF45A3C6),
                          accentColor: Colors.red,
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // --------- BLOC APRÈS-MIDI ---------
                    _buildTimeBlock(
                      title: 'Après-midi',
                      timeRange: '14h - 18h',
                      backgroundColor: const Color(0xFFFFF8F5),
                      courses: [
                        CourseItem(
                          title: 'Base de Données',
                          teacher: 'Dr. YAYA T.',
                          time: '14:00 - 16:00',
                          isActive: false,
                          color: Colors.white,
                        ),
                        CourseItem(
                          title: 'Projet Tutoré',
                          teacher: 'M. Blanc - Lab B',
                          time: '16:00 - 18:00',
                          isActive: false,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Section travaux à venir
                    const Text(
                      'Travaux à venir',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // Liste des travaux
                    _buildAssignment(
                      title: 'Rendu TP Android',
                      course: 'Développement Mobile',
                      date: '03 Mai',
                      color: const Color(0xFF2C5282),
                    ),
                    
                    _buildAssignment(
                      title: 'Examen SQL',
                      course: 'Base de Données',
                      date: '09 Mai',
                      color: const Color(0xFFE76F51),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
  
  Widget _buildTimeBlock({
    required String title,
    required String timeRange,
    required Color backgroundColor,
    required List<CourseItem> courses,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // En-tête du bloc horaire
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(
                        CupertinoIcons.clock,
                        size: 18,
                        color: Color(0xFF2C5282),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          timeRange,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(
                  CupertinoIcons.chevron_down,
                  size: 16,
                  color: Colors.black.withOpacity(0.5),
                ),
              ],
            ),
          ),
          
          // Liste des cours pour ce bloc
          ...courses.map((course) => _buildCourseItem(course)).toList(),
          
          const SizedBox(height: 8),
        ],
      ),
    );
  }
  
  Widget _buildCourseItem(CourseItem course) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: course.color,
        borderRadius: BorderRadius.circular(12),
        border: course.isActive 
            ? null 
            : Border.all(color: Colors.grey.withOpacity(0.2)),
        boxShadow: course.isActive
            ? [
                BoxShadow(
                  color: course.color.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ]
            : null,
      ),
      child: Row(
        children: [
          if (course.isActive && course.accentColor != null)
            Container(
              width: 8,
              height: 70,
              decoration: BoxDecoration(
                color: course.accentColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
              child: const Center(
                child: CircleAvatar(
                  radius: 3,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          course.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: course.isActive ? Colors.white : Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          course.teacher,
                          style: TextStyle(
                            color: course.isActive 
                                ? Colors.white.withOpacity(0.9) 
                                : Colors.black54,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    course.time,
                    style: TextStyle(
                      color: course.isActive 
                          ? Colors.white.withOpacity(0.9) 
                          : Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildAssignment({
    required String title,
    required String course,
    required String date,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withOpacity(0.9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Icon(
                title.contains('Examen') 
                    ? CupertinoIcons.doc_text
                    : CupertinoIcons.arrow_up_doc,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  course,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFEEF2F6),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              date,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Color(0xFF2C5282),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
}

class CourseItem {
  final String title;
  final String teacher;
  final String time;
  final bool isActive;
  final Color color;
  final Color? accentColor;
  
  CourseItem({
    required this.title,
    required this.teacher,
    required this.time,
    required this.isActive,
    required this.color,
    this.accentColor,
  });
}