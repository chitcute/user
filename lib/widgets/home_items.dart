import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kozarni_ecome/controller/home_controller.dart';
import 'package:kozarni_ecome/data/constant.dart';
import 'package:kozarni_ecome/model/hive_item.dart';
import 'package:kozarni_ecome/routes/routes.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeItems extends StatelessWidget {
  const HomeItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 10),
        child: StaggeredGridView.countBuilder(
          staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
          shrinkWrap: true,
          physics: ScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          itemCount: controller.getItems().length,
          itemBuilder: (_, i) => GestureDetector(
            onTap: () {
              controller.setSelectedItem(controller.getItems()[i]);
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
                        child: Stack(
                          children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: CachedNetworkImage(
                              imageUrl: controller.getItems()[i].photo,
                              fit: BoxFit.cover,
                            ),
                          ),
                            // ValueListenableBuilder(
                            //   valueListenable:
                            //   Hive.box<HiveItem>(boxName).listenable(),
                            //   builder: (context, Box<HiveItem> box, widget) {
                            //     final currentObj =
                            //     box.get(controller.selectedItem.value.id);
                            //
                            //     if (!(currentObj == null)) {
                            //       return IconButton(
                            //           onPressed: () {
                            //             box.delete(currentObj.id);
                            //           },
                            //           icon: Icon(
                            //             FontAwesomeIcons.solidHeart,
                            //             color: Colors.red,
                            //             size: 20,
                            //           ));
                            //     }
                            //     return IconButton(
                            //         onPressed: () {
                            //           box.put(
                            //               controller.selectedItem.value.id,
                            //               controller.changeHiveItem(controller.selectedItem.value));
                            //         },
                            //         icon: Icon(
                            //           Icons.favorite_outline,
                            //           color: Colors.red,
                            //           size: 20,
                            //         ));
                            //   },
                            // ),
                         ],
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
                                top: 5, bottom: 5, left: 30, right: 20),
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
        ),
      ),
    );
  }
}

/*class AddToCart extends StatefulWidget {
  final ItemModel itemModel;
  const AddToCart({
    Key? key,
    required this.itemModel,
  }) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  String? colorValue;
  String? sizeValue;
  final HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          value: colorValue,
          hint: Text('Color', style: TextStyle(fontSize: 12)),
          onChanged: (String? e) {
            setState(() {
              colorValue = e;
            });
          },
          items: widget.itemModel.color
              .split(',')
              .map((e) => DropdownMenuItem(
            value: e,
            child: Text(e, style: TextStyle(fontSize: 12)),
          ))
              .toList(),
        ),
        SizedBox(
          height: 20,
        ),
        DropdownButtonFormField(
          value: sizeValue,
          hint: Text("Size", style: TextStyle(fontSize: 12)),
          onChanged: (String? e) {
            setState(() {
              sizeValue = e;
            });
          },
          items: widget.itemModel.size
              .split(',')
              .map((e) => DropdownMenuItem(
            value: e,
            child: Text(e, style: TextStyle(fontSize: 12)),
          ))
              .toList(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: ElevatedButton(
            style: buttonStyle,
            onPressed: () {
              if (colorValue != null && sizeValue != null) {
                controller.addToCart(widget.itemModel, colorValue!, sizeValue!,);
                Get.back();
              }
            },
            child: Text("၀ယ်ယူရန်"),
          ),
        )
      ],
    );
  }
}*/
