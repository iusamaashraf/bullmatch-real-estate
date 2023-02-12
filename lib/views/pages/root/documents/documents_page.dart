import 'package:bullmatch/constants/colors.dart';
import 'package:bullmatch/models/document_model.dart';
import 'package:bullmatch/views/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DocumentsPage extends StatefulWidget {
  const DocumentsPage({super.key});

  @override
  State<DocumentsPage> createState() => _DocumentsPageState();
}

class _DocumentsPageState extends State<DocumentsPage> {
  final TextEditingController searchController = TextEditingController();
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                title: Text('This is a dialog'),
                content: Text('This dialog has a border radius of 12.'),
              );
            },
          );
        },
        label: Row(
          children: [
            SvgPicture.asset(
              'assets/images/createnewdocument.svg',
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
              Expanded(
                child: ListView.builder(
                  itemCount: documentList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              documentList[index].image!,
                              fit: BoxFit.cover,
                              height: Get.height * 0.08,
                            ),
                            const SizedBox(width: 5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  documentList[index].pdf!,
                                  style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  documentList[index].pages!,
                                  style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () => setState(() => documentList[index]
                                  .isCheck = !documentList[index].isCheck!),
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    color: documentList[index].isCheck!
                                        ? ColorClass.darkPurpleColor
                                        : Colors.transparent,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: ColorClass.darkPurpleColor)),
                                child: Center(
                                  child: Icon(
                                    Icons.done,
                                    size: 12,
                                    color: documentList[index].isCheck!
                                        ? Colors.white
                                        : Colors.transparent,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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
