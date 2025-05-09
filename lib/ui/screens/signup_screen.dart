import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _matriculeController = TextEditingController();
  bool _obscureText = true;
  bool _obscureConfirmText = true;
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
        width: MediaQuery.of(context).size.width * 0.25,
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool isPassword = false,
    bool isConfirmPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword ? _obscureText : (isConfirmPassword ? _obscureConfirmText : false),
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon, color: const Color(0xFFEF6A4C)),
          suffixIcon: (isPassword || isConfirmPassword)
              ? IconButton(
                  icon: Icon(
                    (isPassword ? _obscureText : _obscureConfirmText)
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      if (isPassword) {
                        _obscureText = !_obscureText;
                      } else {
                        _obscureConfirmText = !_obscureConfirmText;
                      }
                    });
                  },
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 20.0,
            left: 20.0,
            right: 20.0,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              const Text(
                'Inscription',
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildUserTypeCard('Étudiant', Icons.school),
                    _buildUserTypeCard('Enseignant', Icons.person),
                    _buildUserTypeCard('Parent', Icons.family_restroom),
                  ],
                ),
              ),
              const SizedBox(height: 30.0),
              _buildTextField(
                controller: _nameController,
                hint: "Nom complet",
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 16.0),
              _buildTextField(
                controller: _emailController,
                hint: "Email",
                icon: Icons.email_outlined,
              ),
              const SizedBox(height: 16.0),
              _buildTextField(
                controller: _matriculeController,
                hint: "Matricule",
                icon: Icons.badge_outlined,
              ),
              const SizedBox(height: 16.0),
              _buildTextField(
                controller: _passwordController,
                hint: "Mot de passe",
                icon: Icons.lock_outline,
                isPassword: true,
              ),
              const SizedBox(height: 16.0),
              _buildTextField(
                controller: _confirmPasswordController,
                hint: "Confirmer le mot de passe",
                icon: Icons.lock_outline,
                isConfirmPassword: true,
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement signup logic
                  Get.toNamed("mainScreen");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEF6A4C),
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  "S'inscrire",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Déjà un compte ? ",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text(
                      'Connectez-vous',
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
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _matriculeController.dispose();
    super.dispose();
  }
}