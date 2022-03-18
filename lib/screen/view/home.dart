import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kozarni_ecome/controller/home_controller.dart';
import 'package:kozarni_ecome/data/constant.dart';
import 'package:kozarni_ecome/model/hive_item.dart';
import 'package:kozarni_ecome/routes/routes.dart';
import 'package:kozarni_ecome/widgets/home_category.dart';
import 'package:kozarni_ecome/widgets/home_items.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => controller.isSearch.value
            ? StaggeredGridView.countBuilder(
                staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                shrinkWrap: true,
                physics: ScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                itemCount: controller.searchitems.length,
                itemBuilder: (_, i) => Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.setSelectedItem(controller.searchitems[i]);
                        Get.toNamed(detailScreen);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(),
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Hero(
                                  tag: controller.getItems()[i].photo,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: CachedNetworkImage(
                                      imageUrl: controller.getItems()[i].photo,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, left: 24, right: 20),
                                      child: Text(
                                        controller.getItems()[i].name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5,
                                          bottom: 5,
                                          left: 30,
                                          right: 20),
                                      child: Text(
                                        "${controller.getItems()[i].price} Kyats",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    
                  ],
                ),
              )
            : ListView(
                children: [
                  // HomePickUp(),
                  HomeCategory(),
                  HomeItems(),
                ],
              ),
      ),
    );
  }
}
