import 'package:ecom_print_store/common_widgets/common_text_field.dart';
import 'package:ecom_print_store/common_widgets/top_aligned_checkbox.dart';
import 'package:ecom_print_store/constants/colors.dart';
import 'package:flutter/material.dart';





class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();

  

  static Widget _buildDropdown(String label, List<String> items) {
    return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(label,style: const TextStyle(color: AppColors.title415161),),
        
        Container(
          decoration: BoxDecoration(color: AppColors.white,borderRadius: BorderRadius.circular(0),border: Border.all(color: AppColors.greyDEDEDE)),
          child: InputDecorator(
            
            decoration:const InputDecoration( border: InputBorder.none),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
            padding:const EdgeInsets.fromLTRB(8, 0, 8, 0),
                isDense: true,
                isExpanded: true,
                value: items.first,
                items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                onChanged: (val) {},
              ),
            ),
          ),
        ),
      ],
    );
  }

  static Widget _buildOrderSummary(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(1),border: Border.all(color: AppColors.greyDEDEDE)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              const Text('Your order', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16,),
              const Divider(color: AppColors.greyDEDEDE,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Product',style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.title415161)),
                Text('Subtotal',style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.title415161)),
              ],
            ),
            const SizedBox(height: 8),
             const Divider(color: AppColors.greyDEDEDE,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Dark Text Printed T-Shirt × 1',style: TextStyle(color: AppColors.title415161),),
                Text(' ₹25.00',style: TextStyle(color: AppColors.title415161),),
              ],
            ),
            const SizedBox(height: 8),
             const Divider(color: AppColors.greyDEDEDE,),
             const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Subtotal',style: TextStyle(color: AppColors.title415161),),
                Text('₹25.00',style: TextStyle(color: AppColors.title415161),),
              ],
            ),
            const SizedBox(height: 8),
            const Divider(color: AppColors.greyDEDEDE,)
,             const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Shipping:',style: TextStyle(color: AppColors.title415161),),
                Text('Free shipping',style: TextStyle(color: AppColors.title415161),),
              ],
            ),
            const SizedBox(height: 8),
            
            const Divider(color: AppColors.greyDEDEDE,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total:',style: TextStyle(color: AppColors.title415161)),
                Text('₹25.00',style: TextStyle(color: AppColors.title415161)),
              ],
            ),
            
       const SizedBox(height: 20),
            const Text('Payment Method', style: TextStyle(fontWeight: FontWeight.bold)),
            RadioListTile(value: true, groupValue: true, onChanged: (_) {}, title: const Text('Credit Card (Stripe)')),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Pay with your credit card via Stripe",style: TextStyle(color: AppColors.title415161),),
                   Container(
                    color: AppColors.white,
                     child: Row(
                       children: [
                         Expanded(
                           child: TextField(
                           decoration: 
                           InputDecoration(
                                                    border: InputBorder.none,
                            )
                                             ),
                         ),
 InkWell(onTap: () {}, child: Container(decoration:BoxDecoration(
  color: AppColors.black,
  
  
  borderRadius: BorderRadius.circular(8)
  
  ),child: Padding(
   padding: const EdgeInsets.all(8.0),
   child:  Text('Autofill link',style: TextStyle(color: AppColors.white),),
 ))),


                       ],
                     ),
                   ),
                  const SizedBox(height: 8),
                 
                  const Text('Test Mode Enabled: Use demo card 4242 4242 4242 4242')
                ],
              ),
            ),
            RadioListTile(value: false, groupValue: true, onChanged: (_) {}, title: const Text('Cash on delivery')),
            const SizedBox(height: 10),
            const Text(
              'Your personal data will be used to process your order, support your experience throughout this website, and for other purposes described in our privacy policy.',
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 20),
            SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {
Navigator.push(context, MaterialPageRoute(builder: (_)=>CheckoutPage()));

                          },
                          icon: const Icon(Icons.whatshot, color: Colors.white),
                          label:  Text("PROCEED TO CHECKOUT",style: TextStyle(color: AppColors.white),),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                            backgroundColor: AppColors.redFF5151,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            textStyle: const TextStyle(
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
      
          ],
        ),
      ),
    );
  }

  static Widget _buildOfferSection() {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.green), borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            color: Colors.green,
            width: double.infinity,
            child: const Center(child: Text('10% offer', style: TextStyle(color: Colors.white))),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(width: 60, height: 60, color: Colors.grey.shade300),
              const SizedBox(width: 10),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Black Printed Coffee Mug'),
                    Text('₹50.00 ₹45.00', style: TextStyle(decoration: TextDecoration.lineThrough)),
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.remove)),
                  const Text('1'),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text('Color: "Blue", Size: Medium'),
          Row(
            children: [
              Checkbox(value: false, onChanged: (_) {}),
              const Text('Get this exclusive offer now!'),
            ],
          )
        ],
      ),
    );
  }
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: AppColors.pageColor,
      appBar: AppBar(
    
        title: const Text('Checkout', style: TextStyle(color: Colors.black)),
        centerTitle: false,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CheckboxListTile(
              value: false,
              onChanged: (_) {},
              title: const Text.rich(
                TextSpan(
                  text: 'Returning customer? ',
                  children: [TextSpan(text: 'Click here to login', style: TextStyle(color: Colors.red))],
                ),
              ),
              controlAffinity: ListTileControlAffinity.leading,
            ),
            CheckboxListTile(
              value: false,
              onChanged: (_) {},
              title: const Text.rich(
                TextSpan(
                  text: 'Have a coupon? ',
                  children: [TextSpan(text: 'Click here to enter your code', style: TextStyle(color: Colors.red))],
                ),
              ),
              controlAffinity: ListTileControlAffinity.leading,
            ),
            const SizedBox(height: 20),
            const Text('Billing details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: AppColors.greyDEDEDE)),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(child: CommonTextField.buildTextField('First name*')),
                const SizedBox(width: 10),
                Expanded(child: CommonTextField.buildTextField('Last name*')),
              ],
            ),
            const SizedBox(height: 10),
            CommonTextField.buildTextField('Company name (optional)'),
            const SizedBox(height: 10),
            CheckoutPage._buildDropdown('Country / Region', ['India']),
            const SizedBox(height: 10),
            CommonTextField.buildTextField('Street address*'),
            const SizedBox(height: 10),
            CommonTextField.buildTextField('Apartment, suite, unit, etc. (optional)'),
            const SizedBox(height: 10),
            CommonTextField.buildTextField('Town / City*'),
            const SizedBox(height: 10),
            CheckoutPage._buildDropdown('State*', ['Gujarat']),
            const SizedBox(height: 10),
            CommonTextField.buildTextField('PIN Code*'),
            const SizedBox(height: 10),
            CommonTextField.buildTextField('Phone*', prefixIcon: const Icon(Icons.phone)),
            const SizedBox(height: 10),
            CommonTextField.buildTextField('Email address*'),
            const SizedBox(height: 20),
          
             TopAlignedCheckboxTile(value: false, onChanged: (_){}, title: const Text("I would like to receive exclusive emails with discounts and product information"))
            // CheckboxListTile(
              
            //   value: false,
            //   onChanged: (_) {},
            //   title: const Text('I would like to receive exclusive emails with discounts and product information'),
            //   controlAffinity: ListTileControlAffinity.leading,
            // ),
            ,const ExpansionTile(
              title: const Text('Ship to a different address?'),
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(labelText: 'Order notes (optional)'),
                    maxLines: 3,
                  ),
                )
              ],
            ),
            const Divider(),
          
            const SizedBox(height: 10),
            CheckoutPage._buildOrderSummary(context),
           // const SizedBox(height: 20),
          //  CheckoutPage._buildOfferSection(),
           
          ],
        ),
      ),
    );
  }
}
