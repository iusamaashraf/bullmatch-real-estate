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

import 'components/root_header.dart';
import 'components/row_data.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int selectedIndex = 0;
  bool isDrawerOpen = false;
  final _pages = [
    HomePage(),
    ClientsPage(),
    PropertiesPage(),
    DocumentsPage(),
    CallsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorClass.scaffoldColor,
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
