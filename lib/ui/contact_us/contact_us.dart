import 'package:ecom_print_store/ui/global_widgets/custom_buttons.dart';
import 'package:ecom_print_store/ui/global_widgets/footer_widget.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';



class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return 
       Scaffold(
        backgroundColor: const Color(0xFFF8F8F8),
        body: SafeArea(
          child: SingleChildScrollView(
            // padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),
                      const Text(
                        'Say Hello.',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2C3E50),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Lorem ipsum dolor sit amet, consectetur\nadipisicing elit. Ut elit tellus, luctus nec\nullamcorper mattis, pulvinar dapibus leo.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: 30,
                        height: 2,
                        color: Colors.redAccent,
                      ),
                      const SizedBox(height: 24),
                  
                      // Contact Info
                    const  Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Icon(Icons.location_on, color: Colors.redAccent),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              '212 7th St SE, Washington, DC 20003, USA',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    const  Row(
                        children: const [
                          Icon(Icons.email, color: Colors.redAccent),
                          SizedBox(width: 10),
                          Text(
                            'info@example.com',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    const  Row(
                        children: const [
                          Icon(Icons.phone, color: Colors.redAccent),
                          SizedBox(width: 10),
                          Text(
                            '123-456-7890/91',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                  
                      // Contact Form
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Ask Your Queries',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color(0xFF2C3E50),
                              ),
                            ),
                            const SizedBox(height: 20),
                          const  TextField(
                              decoration: InputDecoration(
                                hintText: 'Your Email',
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                              ),
                            ),
                            const SizedBox(height: 16),
                          const  TextField(
                              decoration: InputDecoration(
                                hintText: 'Subject',
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                              ),
                            ),
                            const SizedBox(height: 16),
                          const  TextField(
                              maxLines: 4,
                              decoration: InputDecoration(
                                hintText: 'Message',
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(12),
                              ),
                            ),
                            const SizedBox(height: 20),
          AddToCartButton(buttonColor: AppColors.redFF5151 ,textValue: "SEND MESSAGE", textColor: AppColors.accentTextInputColor, onClick: (){})
                          ],
                        ),
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
