import 'package:bullmatch/constants/colors.dart';
import 'package:bullmatch/models/business_header_model.dart';
import 'package:bullmatch/models/properties_model.dart';
import 'package:bullmatch/views/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PropertiesPage extends StatefulWidget {
  const PropertiesPage({super.key});

  @override
  State<PropertiesPage> createState() => _PropertiesPageState();
}

class _PropertiesPageState extends State<PropertiesPage> {
  final TextEditingController searchController = TextEditingController();
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Row(
          children: [
            SvgPicture.asset(
              'assets/images/add_property.svg',
              fit: BoxFit.cover,
            )
          ],
        ),
        backgroundColor: ColorClass.darkPurpleColor,
        isExtended: true,
      ),
      body: Container(
        width: Get.width,
        height: Get.height * 0.8,
        decoration: BoxDecoration(
            color: const Color(0xffF2F2F2).withOpacity(.6),
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Color(0x00000029),
                blurRadius: 8,
                offset: Offset(0, 3),
              ),
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.05, vertical: Get.height * 0.02),
          child: Column(
            children: [
              SearchField(controller: searchController),
              SizedBox(height: Get.height * 0.02),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    businessHeaderModelList.length,
                    (index) => Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Text(
                            businessHeaderModelList[index].title!,
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: index == selectedIndex
                                  ? Colors.black
                                  : ColorClass.greyColor,
                              fontWeight: index == selectedIndex
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                        const Text(' - ')
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              Expanded(
                child: ListView.builder(
                  itemCount: propertiesList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            width: 2, color: ColorClass.darkPurpleColor),
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.business),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    propertiesList[index].title!,
                                    style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    propertiesList[index].rooms!,
                                    style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Text(
                                    propertiesList[index].sellerName!,
                                    style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        propertiesList[index].budget!,
                                        style: GoogleFonts.poppins(
                                            fontSize: 10,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.file_download_outlined,
                                      color: ColorClass.darkPurpleColor,
                                    ),
                                  ),
                                  Text(
                                    'Match',
                                    style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        color: ColorClass.darkPurpleColor,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 5),
                                  const Icon(
                                    Icons.arrow_forward,
                                    size: 17,
                                    color: Color(0xff4B4B4B),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
