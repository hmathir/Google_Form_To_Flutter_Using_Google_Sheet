import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final iconList = <IconData>[
      IconlyLight.bookmark,
      IconlyLight.discount,
      Icons.credit_card,
      IconlyLight.profile,
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text('Student Info'),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
          actions: [
            IconButton(onPressed: () {
              controller.getData();//Refresh the joke
            }, icon: Icon(Icons.restart_alt),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            IconlyBold.home,
            color: Colors.deepOrange,
          ),
          backgroundColor: Colors.black,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: iconList,
          activeIndex: 2,
          backgroundColor: Colors.black,
          activeColor: Colors.deepOrange,
          inactiveColor: Colors.white,
          onTap: (int) {},
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.smoothEdge,
        ),
        body: Obx(() {
          if (controller.isLoaded.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(

            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.dataList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var data = controller.dataList;
                return Card(
                  color: Colors.black12,
                  margin: EdgeInsets.all(5),
                  shadowColor: Color(0xff2DBC77),
                  shape:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Color(0xff2DBC77), width: 1)
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                data[index].image,
                              )),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey[300],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [ Text(data[index].name, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                                      Text(data[index].number.toString(), style: TextStyle(color: Colors.white),),
                                  ]),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Get.defaultDialog(
                                              title: 'Details About ' +
                                                  data[index].name,
                                              backgroundColor: Color(0xff2DBC77),
                                              content: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(height: 15),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        height: 100,
                                                        width: 100,
                                                        child: ClipRRect(borderRadius: BorderRadius.circular(50),child: Image.network(data[index].image)),
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(50),
                                                          color: Colors.grey[300],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 20,),
                                                  Text('Name: ' + data[index].name, style: TextStyle(color: Colors.white),),
                                                  Text('Phone: ' +
                                                      data[index].number.toString(),style: TextStyle(color: Colors.white),),
                                                  Text('Email: ' + data[index].email, style: TextStyle(color: Colors.white),),
                                                  Text('Address: ' + data[index].address, style: TextStyle(color: Colors.white),),
                                                ],
                                              ));
                                        },
                                        child: Text('Details'),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }));
  }
}
