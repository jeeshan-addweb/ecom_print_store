
import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';

class LoginWithEmailWidget extends StatefulWidget {
  const LoginWithEmailWidget({super.key});

  @override
  State<LoginWithEmailWidget> createState() => _LoginWithEmailWidgetState();
}

class _LoginWithEmailWidgetState extends State<LoginWithEmailWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Email address",style:  TextStyle(color: Colors.grey)),
                           const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(6),
                              ),
                        child: const TextField(
                          decoration: InputDecoration(
                            hintText: "Enter your email",
                            hintStyle:  TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 14,
                            ),
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.email, color: Colors.white),
                          label:  Text("SEND CODE",style: TextStyle(color: AppColors.white),),
                        
                          style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                            backgroundColor: Color(0xFF25D366),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            textStyle: const TextStyle(
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                        ],
                      );
  }
}