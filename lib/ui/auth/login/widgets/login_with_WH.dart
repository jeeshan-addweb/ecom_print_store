import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';

class LoginWithWhWidget extends StatefulWidget {
  const LoginWithWhWidget({super.key});

  @override
  State<LoginWithWhWidget> createState() => _LoginWithWhWidgetState();
}

class _LoginWithWhWidgetState extends State<LoginWithWhWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("WhatsApp Number",style:TextStyle(color: Colors.grey),),
                           const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(6),
                              ),
                        child: Row(
                          children: [
                            Container(
                              
                              child: Row(
                                children: const [
                                  Text("🇮🇳"),
                                  SizedBox(width: 6),
                                  Icon(Icons.arrow_drop_down),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Enter your WhatsApp number",
                                  hintStyle:  TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 14,
                                  ),
                                ),
                                keyboardType: TextInputType.phone,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.whatshot, color: Colors.white),
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