import 'package:ecom_print_store/constants/colors.dart';
import 'package:flutter/material.dart';


class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscurePassword = true;

  Widget buildTextField(String label, {bool isPassword = false, Widget? prefixIcon}) {
    return TextField(
      obscureText: isPassword && _obscurePassword,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300)),
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility,color: AppColors.grey,),
                onPressed: () {
                  setState(() => _obscurePassword = !_obscurePassword);
                },
              )
            : null,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "My account",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              const Text(
                "Sign Up",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        "Lets Get Started",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2C3E50),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Center(
                      child: Text(
                        "Enter your details below to create your account.",
                        style: TextStyle(color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text("First Name",style:  TextStyle(color: Colors.grey)),
                    const SizedBox(height: 6),
                    buildTextField("First Name",),
                    const SizedBox(height: 16),
                    const Text("Last Name",style:  TextStyle(color: Colors.grey)),
                    const SizedBox(height: 6),
                    buildTextField("Last Name"),
                    const SizedBox(height: 16),
                    const Text("Email",style:  TextStyle(color: Colors.grey)),
                    const SizedBox(height: 6),
                    buildTextField("Enter your email"),
                    const SizedBox(height: 16),
                    const Text("Phone Number",style:  TextStyle(color: Colors.grey)),
                    const SizedBox(height: 6),
                    TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300)),
                        hintText: "Enter your Phone number",
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            SizedBox(width: 12),
                            Text("🇮🇳"),
                            Icon(Icons.arrow_drop_down),
                            SizedBox(width: 8),
                          ],
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey.shade300)
                      
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text("Password",style:  TextStyle(color: Colors.grey)),
                    const SizedBox(height: 6),
                    buildTextField("Password", isPassword: true),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.person_add_alt_1, color: Colors.white),
                        label: Text("CREATE NEW ACCOUNT",style: TextStyle(color: AppColors.accentTextInputColor,)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF28A745),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account? "),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (v) {}),
                  const Text("Remember me"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
