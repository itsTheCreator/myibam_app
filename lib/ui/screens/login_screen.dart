import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:myibam_app/routes/app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  String? _selectedUserType;

  Widget _buildUserTypeCard(String type, IconData icon) {
    bool isSelected = _selectedUserType == type;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedUserType = type;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width*0.25,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF45A3C6) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? const Color(0xFF45A3C6) : Colors.grey.shade300,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 22,
              color: isSelected ? Colors.white : const Color(0xFFEF6A4C),
            ),
            const SizedBox(height: 6),
            Text(
              type,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Stack(
            children: [
              // Contenu du formulaire de connexion
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Connexion',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFEF6A4C),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30.0),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                            _buildUserTypeCard('Étudiant', Icons.school),
                          _buildUserTypeCard('Enseignant', Icons.person),
                          _buildUserTypeCard('Parent', Icons.family_restroom),
                          ],)
                          
                        ],
                      ),
                    ),
                    const SizedBox(height: 30.0),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: "Email",
                            prefixIcon: Icon(Icons.person_outline, color: Color(0xFFEF6A4C)),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: TextField(
                          controller: _passwordController,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            hintText: 'Mot de passe',
                            prefixIcon: Icon(Icons.lock_outline, color: Color(0xFFEF6A4C)),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText ? Icons.visibility_off : Icons.visibility,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Mot de passe oublié ?',
                            style: TextStyle(color: Colors.black87),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      ElevatedButton(
                        onPressed: () {
                          Get.toNamed("mainScreen");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFEF6A4C),
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text(
                          'Se connecter',
                          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        children: [
                          const Expanded(
                            child: Divider(color: Colors.black),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'Ou Connectez-vous avec',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          const Expanded(
                            child: Divider(color: Colors.black),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _socialButton(Icons.g_mobiledata, Colors.red),
                          const SizedBox(width: 20.0),
                          _socialButton(Icons.facebook, Colors.blue),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Pas de compte ? ",
                            style: TextStyle(color: Colors.black),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.toNamed(AppRoutes.signupScreen);
                            },
                            child: const Text(
                              'Inscrivez-vous',
                              style: TextStyle(
                                color: Color(0xFFEF6A4C),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
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

  Widget _socialButton(IconData icon, Color color) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Icon(
        icon,
        color: color,
      ),
    );
  }
}