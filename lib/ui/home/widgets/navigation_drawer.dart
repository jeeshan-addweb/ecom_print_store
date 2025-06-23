

import 'package:ecom_print_store/constants/assets.dart';
import 'package:ecom_print_store/ui/auth/login/login.dart';
import 'package:ecom_print_store/ui/contact_us/contact_us.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constants/colors.dart';
import '../../auth/controller.dart';

class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({super.key});

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
  
  // void shareAppLink() {
  //   Share.share(
  //       'https://play.google.com/store/apps/details?id=com.instagram.android&pcampaignid=web_share');
  // }

  ///String? token = sp?.getString('token');
 // final AuthController authController = Get.put(AuthController());
  //instance of PackageInfo
 // PackageInfo? packageInfo;

  // @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((Duration time);
  //  // _initPackageInfo();
  //   super.initState();
  // }

  // init() {
  //   _initPackageInfo();
  // }

  //init package info details
  // Future<void> _initPackageInfo() async {
  //   final info = await PackageInfo.fromPlatform();
  //   packageInfo = info;
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: _scaffoldKey,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(0), bottomRight: Radius.circular(20))),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // IconButton(
              //     onPressed: () {
              //       Navigator.pop(context);
              //     },
              //     icon: Icon(
              //       Icons.clear,
              //       color: AppColors.white,
              //       size: 30,
              //     )),
             
              Expanded(
                  flex: 4,
                  child: GestureDetector(
                    onTap: () {
              //        Get.find<DashboardController>().onTap(2);
                      Get.back();
                    },
                    child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Container(
                              //         height: 64,
                              //         width: 64,
                              //         decoration: BoxDecoration(
                              //             color: AppColors.grey,
                              //             shape: BoxShape.circle,
                              //             border: Border.all(
                              //                 color: AppColors.white
                              //                     .withOpacity(0.54),
                              //                 width: 4)),
                              //         child: ClipOval(
                              //             child: token == null
                              //                 ? Image.asset(
                              //                     AppImages.my_profile,
                              //                     fit: BoxFit.contain,
                              //                   )
                              //                 : Image.network(
                              //                     authController
                              //                             .userprofile
                              //                             .value
                              //                             .user
                              //                             ?.profileImage ??
                              //                         AppImages.profile,
                              //                     fit: BoxFit.cover,
                              //                   ))),
                              //     IconButton(
                              //         onPressed: () {
                              //           Navigator.pop(context);
                              //         },
                              //         icon: Icon(
                              //           Icons.clear,
                              //           color: AppColors.appColor,
                              //           size: 30,
                              //         )),
                              //   ],
                              // ),
                              // const SizedBox(
                              //   height: 8,
                              // ),
                              // token == null
                              //     ? Column(
                              //         crossAxisAlignment:
                              //             CrossAxisAlignment.start,
                              //         children: [
                              //           Text(
                              //             "Guest",
                              //             style: TextStyle(
                              //                 fontWeight: FontWeight.w700,
                              //                 fontSize: 20,
                              //                 color: AppColors.transparent),
                              //           ),
                              //           Text(
                              //             authController.userprofile.value.user
                              //                     ?.email ??
                              //                 "User",
                              //             style: TextStyle(
                              //                 fontWeight: FontWeight.w500,
                              //                 fontSize: 16,
                              //                 color: AppColors.hintTextColor),
                              //           ),
                              //         ],
                              //       )
                              //     : Column(
                              //         crossAxisAlignment:
                              //             CrossAxisAlignment.start,
                              //         children: [
                              //           Text(
                              //             authController.userprofile.value.user
                              //                     ?.name ??
                              //                 "",
                              //             style: TextStyle(
                              //                 fontWeight: FontWeight.w700,
                              //                 fontSize: 20,
                              //                 color: AppColors.transparent),
                              //           ),
                              //           Text(
                              //             authController.userprofile.value.user
                              //                     ?.email ??
                              //                 "",
                              //             style: TextStyle(
                              //                 fontWeight: FontWeight.w400,
                              //                 fontSize: 16,
                              //                 color: AppColors.hintTextColor),
                              //           ),
                              //         ],
                              //       ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: Divider(
                                  color: AppColors.grey,
                                  thickness: 1,
                                ),
                              ),
                            ]
                            )
                            ),
                  )),
              Expanded(
                flex: 10,
                child: ListView(
                    padding: const EdgeInsets.only(left: 10.0),
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(
                        parent: ClampingScrollPhysics()),
                    children: [
                      drawerItems(
                          visible:  true,
                          image: Assets.contactIcon,
                          name: "My Orders",
                          onPressed: () {
                           // Get.find<DashboardController>().onTap(1);
                            Get.back();
                                Navigator.push(context, MaterialPageRoute(builder: (_)=>ContactPage()));
                             
                            
                          }),
                      // const SizedBox(height: 10),
                      // drawerItems(
                      //     visible: token == null ? false : true,
                      //     image: AppImages.my_profile,
                      //     name: "My Profile",
                      //     onPressed: () {
                      //       Get.find<DashboardController>().onTap(2);
                      //       Get.back();
                      //       // Get.to(() => const DashboardScreen(
                      //       //       dashboardTabIndex: 1,
                      //       //     ));
                      //     }),
                      // const SizedBox(height: 10),
                      // drawerItems(
                      //     visible: token == null ? false : true,
                      //     image: AppImages.delivery_address,
                      //     name: "Delivery Address",
                      //     onPressed: () async {
                      //       Get.to(() => const MyAddressScreen());
                      //     }),
                      // const SizedBox(height: 10),
                      // drawerItems(
                      //     visible: token == null ? false : true,
                      //     image: AppImages.my_invoice,
                      //     name: "My Invoice",
                      //     onPressed: () {
                      //       Get.to(() => const MyInvoice());
                      //     }),
                      // const SizedBox(height: 10),
                      // drawerItems(
                      //     visible: token == null ? false : true,
                      //     image: AppImages.offers,
                      //     name: "Offers",
                      //     onPressed: () {
                      //       Get.to(() => const OffersScreen());
                      //     }),
                      // const SizedBox(height: 10),
                      // drawerItems(
                      //     visible: token == null ? false : true,
                      //     image: AppImages.wishlist,
                      //     name: "Wishlist",
                      //     onPressed: () {
                      //       Get.to(() => const WishlistScreen());
                      //     }),
                      // const SizedBox(height: 10),
                      // drawerItems(
                      //     visible: true,
                      //     image: AppImages.informative_screen,
                      //     name: "Informative Screens",
                      //     onPressed: () {
                      //       Get.to(() => const InformativeScreen());
                      //     }),
                      // const SizedBox(height: 10),
                      // drawerItems(
                      //     visible: true,
                      //     image: AppImages.faqs,
                      //     name: "FAQs",
                      //     onPressed: () {
                      //       Get.to(() => const FaqScreen());
                      //     }),
                      // const SizedBox(height: 10),
                      // drawerItems(
                      //     visible: token == null ? false : true,
                      //     image: AppImages.share,
                      //     name: "Share App",
                      //     onPressed: () {
                      //       debugPrint("tapped");
                      //       Share.share(
                      //           'https://play.google.com/store/apps/details?id=com.instagram.android&pcampaignid=web_share Your referral code is :- ${authController.userprofile.value.user?.referralCode}');
                      //     }),
                    ]),
              ),
              // Obx(() {
              //   return authController.isLoading.value
              //       ? Center(
              //           child: Lottie.asset("assets/animation/loading.json",
              //               width: 100, height: 100),
              //         )
              //       : token == null
              //           ? InkWell(
              //               onTap: () {
              //                 Get.to(() => const LoginScreen());
              //               },
              //               child: Container(
              //                 width: 130,
              //                 decoration: BoxDecoration(
              //                     color: AppColors.appColor,
              //                     borderRadius: BorderRadius.circular(30)),
              //                 child: Row(
              //                   children: [
              //                     IconButton(
              //                         onPressed: () {},
              //                         icon: const Icon(Icons.logout_rounded)),
              //                     const Text("Log in")
              //                   ],
              //                 ),
              //               ),
              //             )
              //           : InkWell(
              //               onTap: () {
              //                 showDialog(
              //                   context: context,
              //                   builder: (BuildContext context) {
              //                     return AlertDialog(
              //                       title: const Text("Sign Out"),
              //                       content: const Text(
              //                           "Are you sure you want to log out?"),
              //                       actions: [
              //                         TextButton(
              //                           child: const Text("No"),
              //                           onPressed: () {
              //                             Get.back();
              //                           },
              //                         ),
              //                         TextButton(
              //                           child: const Text("Yes"),
              //                           onPressed: () async {
              //                             try {
              //                               String result =
              //                                   await authController.signout();

              //                               Get.snackbar(
              //                                   duration: const Duration(
              //                                     seconds: 1,
              //                                   ),
              //                                   'Logout Success',
              //                                   result,
              //                                   backgroundColor: Colors.green,
              //                                   snackPosition:
              //                                       SnackPosition.BOTTOM);
              //                             } catch (e) {
              //                               Get.snackbar('Logout Failed',
              //                                   'Please try again later.',
              //                                   duration: const Duration(
              //                                     seconds: 1,
              //                                   ),
              //                                   colorText: Colors.white,
              //                                   backgroundColor: Colors.red,
              //                                   snackPosition:
              //                                       SnackPosition.BOTTOM);
              //                             }
              //                           },
              //                         ),
              //                       ],
              //                     );
              //                   },
              //                 );
              //               },
              //               child: Container(
              //                 width: 130,
              //                 decoration: BoxDecoration(
              //                     color: AppColors.appColor,
              //                     borderRadius: BorderRadius.circular(30)),
              //                 child: Row(
              //                   children: [
              //                     IconButton(
              //                         onPressed: () {},
              //                         icon: const Icon(Icons.logout_rounded)),
              //                     const Text("Log Out")
              //                   ],
              //                 ),
              //               ),
              //             );
              // })
            ],
          ),
        ),
      ),
    );
  }
}

drawerItems(
    {required String image,
    required String name,
    required bool visible,
    required Function()? onPressed}) {
  return Visibility(
    visible: visible,
    child: ListTile(
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      minVerticalPadding: 0,
      leading: SizedBox(
        width: 20,
        child: Image.asset(image, color: AppColors.black),
      ),
      minLeadingWidth: 20,
      title: Text(
        name,
        style: TextStyle(
            color: AppColors.black, fontSize: 16, fontWeight: FontWeight.w400),
      ),
      onTap: onPressed,
    ),
  );
}