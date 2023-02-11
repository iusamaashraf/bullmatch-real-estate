import 'package:bullmatch/constants/colors.dart';
import 'package:bullmatch/constants/icons.dart';
import 'package:bullmatch/models/alphabet_model.dart';
import 'package:bullmatch/views/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ClientsPage extends StatelessWidget {
  ClientsPage({super.key, required this.index});
  final int index;
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Row(
          children: const [
            Icon(
              Icons.person_add,
              color: Colors.white,
            ),
            SizedBox(width: 10),
            Text(
              'Create a new client',
            )
          ],
        ),
        backgroundColor: ColorClass.primaryColor,
        isExtended: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
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
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.04, vertical: Get.height * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchField(controller: searchController),
                  SizedBox(height: Get.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      alphabetList.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Text(
                          alphabetList[index].alphabet.toString(),
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              color: index == 2 ? Colors.black : Colors.grey,
                              fontWeight: index == 2
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.blue),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.person,
                                      size: 15,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'MOR COHEN',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .copyWith(color: Colors.black),
                                        ),
                                        Text(
                                          '4 Rooms',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .copyWith(
                                                  color: Colors.black,
                                                  fontSize: 10),
                                        ),
                                        Text(
                                          'Holon',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .copyWith(
                                                  color: Colors.black,
                                                  fontSize: 10),
                                        ),
                                        Text(
                                          'Budget 14 000 000 000 \$',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .copyWith(
                                                  color: Colors.black,
                                                  fontSize: 10),
                                        )
                                      ],
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                        onTap: () {},
                                        child: SvgPicture.asset(
                                            IconClass.ringingPhone)),
                                    const SizedBox(width: 10),
                                    GestureDetector(
                                      onTap: () {},
                                      child: const Icon(
                                        Icons.whatsapp,
                                        size: 18,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: Get.height * 0.02),
        ],
      ),
    );
  }
}
