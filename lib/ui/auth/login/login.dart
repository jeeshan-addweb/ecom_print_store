import 'package:ecom_print_store/ui/auth/login/widgets/login_with_WH.dart';
import 'package:ecom_print_store/ui/auth/login/widgets/login_with_email.dart';
import 'package:ecom_print_store/ui/auth/login/widgets/login_with_username.dart';
import 'package:ecom_print_store/ui/auth/register/register.dart';
import 'package:ecom_print_store/ui/auth/register/register_page.dart';
import 'package:ecom_print_store/ui/home/home_page.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../global_widgets/footer_widget.dart';



class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int selectedMethod = 0; 




  Widget buildMethodTab(String text, int index) {
    bool isSelected = selectedMethod == index;
    return GestureDetector(
      onTap: () => setState(() => selectedMethod = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          boxShadow: isSelected
              ? [BoxShadow(color: Colors.black12, blurRadius: 4)]
              : [],
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.blueGrey, fontSize: 14,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA),
      body: SingleChildScrollView(
       
        child: SafeArea(
          child: Column(
              
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (_)=>HomePage()));
                },
                child: Text("Skipp"),),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "My account",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                  const SizedBox(height: 12),
                const Text(
                  "Login",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          "Welcome back",
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
                          "Choose a sign-in method to continue",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildMethodTab("WhatsApp", 0),
                          buildMethodTab("Email OTP", 1),
                          buildMethodTab("Email and\nPassword", 2),
                        ],
                      ),
                      const SizedBox(height: 24),
                      selectedMethod==0?LoginWithWhWidget():selectedMethod==1?LoginWithEmailWidget():selectedMethod==2?LoginWithUsernameWidget():SizedBox(),
                     
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("You don’t have an account? "),
                          GestureDetector(
                            onTap: () {
Navigator.push(context, MaterialPageRoute(builder: (_)=>SignUpScreen()));



                            },
                            child: const Text(
                              "Signup",
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
             
          
                 CustomFooter()
                
            ],
          ),
        ),
      ),
     );
  }
}
