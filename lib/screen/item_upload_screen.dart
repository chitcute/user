import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kozarni_ecome/controller/home_controller.dart';
import 'package:kozarni_ecome/controller/upload_controller.dart';
import 'package:kozarni_ecome/data/constant.dart';
import 'package:kozarni_ecome/model/item.dart';
import 'package:kozarni_ecome/widgets/sizeprice_item_widget.dart';

class UploadItem extends StatefulWidget {
  const UploadItem({Key? key}) : super(key: key);

  @override
  State<UploadItem> createState() => _UploadItemState();
}

class _UploadItemState extends State<UploadItem> {
  final UploadController controller = Get.find();
  final HomeController homecontroller = Get.find();

  @override
  void dispose() {
    homecontroller.setEditItem(ItemModel.empty());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackground,
      appBar: AppBar(
        title: Text(
          "Chit Cute Kids & Baby",
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
        elevation: 5,
        backgroundColor: detailBackgroundColor,
        leading: IconButton(
          onPressed: Get.back,
          icon: Icon(
            Icons.arrow_back,
            color: appBarTitleColor,
          ),
        ),
      ),
      body: Form(
        key: controller.form,
        child: ListView(
          children: [
            // GestureDetector(
            //   onTap: controller.pickImage,
            //   child: Container(
            //     width: double.infinity,
            //     height: 200,
            //     margin: EdgeInsets.only(
            //       left: 20,
            //       right: 20,
            //       top: 20,
            //     ),
            //     child: Card(
            //       child: Obx(
            //         () => controller.filePath.isEmpty
            //             ? Center(
            //                 child: Icon(
            //                   Icons.image,
            //                 ),
            //               )
            //             : ClipRRect(
            //                 borderRadius: BorderRadius.all(
            //                   Radius.circular(7),
            //                 ),
            //                 child: Image.file(
            //                   File(
            //                     controller.filePath.value,
            //                   ),
            //                   fit: BoxFit.cover,
            //                 ),
            //               ),
            //       ),
            //     ),
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: TextFormField(
                controller: controller.photoController,
                validator: controller.validator,
                decoration: InputDecoration(
                  hintText: 'Photo Link',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: TextFormField(
                controller: controller.photo2Controller,
                validator: controller.validator,
                decoration: InputDecoration(
                  hintText: 'Photo Link 2',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: TextFormField(
                controller: controller.photo3Controller,
                validator: controller.validator,
                decoration: InputDecoration(
                  hintText: 'Photo Link 3',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: TextFormField(
                controller: controller.nameController,
                validator: controller.validator,
                decoration: InputDecoration(
                  hintText: 'Product အမည်',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: TextFormField(
                // textInputAction: TextInputAction.done,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                minLines: 1,
                maxLines: null,

                controller: controller.desc,
                validator: controller.validator,
                decoration: InputDecoration(
                  hintText: 'အသေးစိတ်ဖော်ပြချက်',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: TextFormField(
                controller: controller.priceController,
                validator: controller.validator,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'တစ်ထည်ဈေး (Ratail)',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: TextFormField(
                controller: controller.brandController,
                validator: controller.validator,
                decoration: InputDecoration(
                  hintText: 'ဘယ်နှစ်ထည် (Wholesale) :',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: TextFormField(
                controller: controller.discountpriceController,
                validator: controller.validator,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'ဘယ်နှစ်ထည်ဈေး (Wholesale)',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: TextFormField(
                controller: controller.deliverytimeController,
                validator: controller.validator,
                decoration: InputDecoration(
                  hintText: 'Stock အခြေအနေ',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: TextFormField(
                controller: controller.colorController,
                validator: controller.validator,
                decoration: InputDecoration(
                  hintText: 'အရောင်',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            //Add SizePrice Button
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: Obx(() {
                return Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: controller.isEmptySizePrice.value
                          ? Colors.red
                          : Colors.white,
                    )),
                    height: 50,
                    width: 100,
                    child: Row(children: [
                      //Add Icon
                      IconButton(
                        onPressed: () => controller.addSizePrice(),
                        icon: Icon(FontAwesomeIcons.plusCircle,
                            color: Colors.black),
                      ),
                      //Text
                      Text("Add Size"),
                    ]));
              }),
            ),
            //SizePrice Widget if list is not empty
            Obx(() => controller.sizePriceMap.isNotEmpty
                ? sizePriceListWidget()
                : const SizedBox(height: 0)),
            //
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: TextFormField(
                controller: controller.starController,
                validator: controller.validator,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Star',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: TextFormField(
                controller: controller.categoryController,
                validator: controller.validator,
                decoration: InputDecoration(
                  hintText: 'အမျိုးအစား',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
              child: ElevatedButton(
                style: buttonStyle,
                onPressed: controller.upload,
                child: Obx(
                  () => controller.isUploading.value
                      ? CircularProgressIndicator(
                          color: scaffoldBackground,
                        )
                      : Text(homecontroller.editItem.value.id.isNotEmpty
                          ? "Edit"
                          : "upload"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//Size Price List Widget
  Widget sizePriceListWidget() {
    return Obx(() {
      return AnimatedContainer(
          height: (controller.sizePriceMap.length * 50) + 80,
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 600),
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: ListView(
            children: controller.sizePriceMap.entries.map((map) {
              return SizePriceItemWidget(
                key: ValueKey(map.key),
                id: map.key,
                sizeText: map.value.sizeText,
                price: "${map.value.price}",
              );
            }).toList(),
          ));
    });
  }
}
