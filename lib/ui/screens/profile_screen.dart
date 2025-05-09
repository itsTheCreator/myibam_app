import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFEF6A4C),
        elevation: 0,
        title: const Text(
          'Mon Profil',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            onPressed: () {
              // TODO: Implémenter la modification du profil
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color(0xFFEF6A4C),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 50, color: Color(0xFF45A3C6)),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Yankiné Eliel',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'L3 Informatique',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildInfoSection(
              'Informations Personnelles',
              [
                _buildInfoTile('Email', 'elielyankine@gmail.com', Icons.email),
                _buildInfoTile('Téléphone', '+226 6406507', Icons.phone),
                _buildInfoTile('Date de naissance', '09/11/2003', Icons.cake),
                _buildInfoTile('Matricule', 'N00277620211', Icons.badge),
              ],
            ),
            const SizedBox(height: 16),
            _buildInfoSection(
              'Informations Académiques',
              [
                _buildInfoTile('Filière', 'Informatique', Icons.school),
                _buildInfoTile('Niveau', 'Licence 3', Icons.grade),
                _buildInfoTile('Année académique', '2024-2025', Icons.calendar_today),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection(String title, List<Widget> children) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF45A3C6),
              ),
            ),
          ),
          const Divider(height: 1),
          ...children,
        ],
      ),
    );
  }

  Widget _buildInfoTile(String title, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFEF6A4C), size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}