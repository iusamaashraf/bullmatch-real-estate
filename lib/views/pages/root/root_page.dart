import 'package:bullmatch/constants/colors.dart';
import 'package:bullmatch/constants/icons.dart';
import 'package:bullmatch/models/drawer_model.dart';
import 'package:bullmatch/views/pages/root/bottom_nav/clients/clients_page.dart';
import 'package:bullmatch/views/pages/root/bottom_nav/home/home_page.dart';
import 'package:bullmatch/views/pages/root/bottom_nav/properties/properties_page.dart';
import 'package:bullmatch/views/pages/root/calls/calls_page.dart';
import 'package:bullmatch/views/pages/root/documents/documents_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'components/row_data.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int selectedIndex = 0;
  bool isDrawerOpen = false;
  List<Widget> _pages = [
    HomePage(),
    ClientsPage(
      index: 1,
    ),
    PropertiesPage(),
    DocumentsPage(),
    CallsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // const RootHeader(),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Spacer(),
                          SvgPicture.asset(
                            IconClass.inAppLogo,
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isDrawerOpen = !isDrawerOpen;
                              });
                            },
                            child: SvgPicture.asset(
                              IconClass.menu,
                              height: 30,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Expanded(child: _pages[selectedIndex]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        bottomNavBar(Icons.home, 'Home', 0),
                        bottomNavBar(Icons.people, 'Clients', 1),
                        bottomNavBar(Icons.business, 'Properties', 2),
                        bottomNavBar(Icons.file_copy, 'Documents', 3),
                        bottomNavBar(Icons.phone_callback_sharp, 'Calls', 4),
                      ],
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
                isDrawerOpen
                    ? Container(
                        width: Get.width,
                        height: Get.height * 0.88,
                        decoration: BoxDecoration(
                            color: const Color(0xffF9F9F9),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(color: Colors.black12, blurRadius: 8)
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isDrawerOpen = false;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 9),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isDrawerOpen = false;
                                        });
                                      },
                                      child: SvgPicture.asset(
                                        IconClass.menuOpen,
                                        height: 29,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: Get.height * 0.03),
                              const CircleAvatar(
                                radius: 40,
                                backgroundColor: ColorClass.greyColor,
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 60,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Manager Account',
                                style: GoogleFonts.poppins(
                                    fontSize: 11, color: ColorClass.greyColor),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Spacer(
                                    flex: 2,
                                  ),
                                  Text(
                                    'Lior Ben Tzur',
                                    style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      color: const Color(0xff707070),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.12,
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.settings,
                                      size: 18,
                                      color: Color(0xff707070),
                                    ),
                                  )
                                ],
                              ),
                              Divider(
                                thickness: 1,
                                color: ColorClass.greyColor.withOpacity(0.5),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    RowData(
                                      onTap: () {},
                                      icon: Icons.phone,
                                      title: '050-321-4141',
                                    ),
                                    const SizedBox(height: 10),
                                    RowData(
                                      onTap: () {},
                                      icon: Icons.mail,
                                      title: 'adressmail@mail.com',
                                    ),
                                    const SizedBox(height: 10),
                                    RowData(
                                      onTap: () {},
                                      icon: Icons.language,
                                      title: 'Last connexion : 10/05/2022',
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 1,
                                color: ColorClass.greyColor.withOpacity(0.5),
                              ),
                              Expanded(
                                child: GridView.builder(
                                  itemCount: drawerList.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio: 1 / 1.2,
                                          crossAxisCount: 2),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: drawerList[index].color,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              boxShadow: const [
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 12)
                                              ]),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  drawerList[index].title!,
                                                  style: GoogleFonts.poppins(
                                                    color: index == 2
                                                        ? const Color(
                                                            0xff4B4B4B)
                                                        : Colors.white,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Align(
                                                  child: SvgPicture.asset(
                                                    drawerList[index].image!,
                                                    height: 100,
                                                  ),
                                                ),
                                                Text(
                                                  drawerList[index].number!,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.bold,
                                                    color: index == 2
                                                        ? const Color(
                                                            0xff4B4B4B)
                                                        : Colors.white,
                                                  ),
                                                ),
                                                Text(
                                                  'Last update ${drawerList[index].number!}',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.w200,
                                                    color: index == 2
                                                        ? const Color(
                                                            0xff4B4B4B)
                                                        : Colors.white,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomNavBar(IconData icon, String name, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Column(
        children: [
          Icon(
            icon,
            color: index == selectedIndex
                ? const Color(0xff4B4B4B)
                : ColorClass.greyColor,
          ),
          Text(
            name,
            style: GoogleFonts.poppins(
              color: index == selectedIndex
                  ? const Color(0xff4B4B4B)
                  : ColorClass.greyColor,
              fontWeight:
                  index == selectedIndex ? FontWeight.w600 : FontWeight.normal,
              fontSize: 9,
            ),
          )
        ],
      ),
    );
  }
}

// import 'package:bullmatch/constants/colors.dart';
// import 'package:bullmatch/views/pages/mainscreen.dart';
// import 'package:bullmatch/views/settings.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

// import 'bottom_nav/clients/clients_page.dart';
// import 'bottom_nav/home/home_page.dart';
// import 'bottom_nav/properties/properties_page.dart';
// import 'calls/calls_page.dart';
// import 'documents/documents_page.dart';

// class RootPage extends StatefulWidget {
//   const RootPage({super.key});

//   @override
//   State<RootPage> createState() => _RootPageState();
// }

// class _RootPageState extends State<RootPage> {
//   PersistentTabController? _controller;
//   int index = 1;
//   @override
//   void initState() {
//     _controller = PersistentTabController(initialIndex: index);
//     super.initState();
//   }

//   List<Widget> _buildScreens() {
//     return [
//       HomePage(),
//       ClientsPage(
//         index: 1,
//       ),
//       PropertiesPage(),
//       DocumentsPage(),
//       CallsPage(),
//     ];
//   }

//   List<PersistentBottomNavBarItem> _navBarsItems() {
//     return [
//       PersistentBottomNavBarItem(
//         icon: const Icon(
//           Icons.home,
//           size: 25,
//         ),
//         title: ("Home"),
//         activeColorPrimary: const Color(0xff4B4B4B),
//         inactiveColorPrimary: ColorClass.greyColor,
//       ),
//       PersistentBottomNavBarItem(
//         icon: const Icon(Icons.people),
//         title: ("Clients"),
//         activeColorPrimary: const Color(0xff4B4B4B),
//         inactiveColorPrimary: ColorClass.greyColor,
//       ),
//       PersistentBottomNavBarItem(
//         icon: const Icon(Icons.business),
//         title: ("Properties"),
//         activeColorPrimary: const Color(0xff4B4B4B),
//         inactiveColorPrimary: ColorClass.greyColor,
//       ),
//       PersistentBottomNavBarItem(
//         icon: const Icon(Icons.file_copy),
//         title: ("Settings"),
//         activeColorPrimary: const Color(0xff4B4B4B),
//         inactiveColorPrimary: ColorClass.greyColor,
//       ),
//       PersistentBottomNavBarItem(
//         icon: const Icon(Icons.phone_callback_sharp),
//         title: ("Settings"),
//         activeColorPrimary: const Color(0xff4B4B4B),
//         inactiveColorPrimary: ColorClass.greyColor,
//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PersistentTabView(
//       context,
//       controller: _controller,
//       screens: _buildScreens(),
//       items: _navBarsItems(),
//       confineInSafeArea: true,
//       backgroundColor: Colors.white, // Default is Colors.white.
//       handleAndroidBackButtonPress: true, // Default is true.
//       resizeToAvoidBottomInset:
//           true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
//       stateManagement: true, // Default is true.
//       hideNavigationBarWhenKeyboardShows:
//           true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
//       decoration: NavBarDecoration(
//         borderRadius: BorderRadius.circular(10.0),
//         colorBehindNavBar: Colors.white,
//       ),
//       popAllScreensOnTapOfSelectedTab: true,
//       popActionScreens: PopActionScreensType.all,
//       itemAnimationProperties: const ItemAnimationProperties(
//         // Navigation Bar's items animation properties.
//         duration: Duration(milliseconds: 200),
//         curve: Curves.ease,
//       ),
//       screenTransitionAnimation: const ScreenTransitionAnimation(
//         // Screen transition animation on change of selected tab.
//         animateTabTransition: true,
//         curve: Curves.ease,
//         duration: Duration(milliseconds: 200),
//       ),
//       navBarStyle:
//           NavBarStyle.style2, // Choose the nav bar style with this property.
//     );
//   }
// }
