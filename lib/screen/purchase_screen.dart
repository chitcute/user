import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kozarni_ecome/controller/home_controller.dart';
import 'package:kozarni_ecome/data/constant.dart';
import 'package:kozarni_ecome/model/purchase.dart';
import 'package:kozarni_ecome/model/township.dart';
import 'package:photo_view/photo_view.dart';

class PurchaseScreen extends StatelessWidget {
  const PurchaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: scaffoldBackground,
        appBar: AppBar(
          title: Text(
            "𝐂𝐢𝐧𝐝𝐲 Branded Export Fashion",
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
          bottom: TabBar(
              unselectedLabelColor: Colors.grey.shade400,
              labelColor: Colors.grey.shade700,
              tabs: [
                Tab(
                  text: "Cash On Delivery",
                ),
                Tab(text: "Pre-Pay"),
              ]),
        ),
        body: TabBarView(
          children: [
            cashOnDeliveryCustomer(),
            prePayCustomer(),
          ],
        ),
      ),
    );
  }

  Widget cashOnDeliveryCustomer() {
    HomeController controller = Get.find();
    return ListView.builder(
      itemCount: controller.purchcasesCashOn().length,
      itemBuilder: (_, i) {
        List town = controller.purchcasesCashOn()[i].deliveryTownshipInfo;
        final shipping = town[1];
        final townName = town[0];
        return ListTile(
          title: Text(
              "${controller.purchcasesCashOn()[i].name} 0${controller.purchcasesCashOn()[i].phone}"),
          subtitle: Text(
              "${controller.purchcasesCashOn()[i].dateTime?.day}/${controller.purchcasesCashOn()[i].dateTime?.month}/${controller.purchcasesCashOn()[i].dateTime?.year}"),
          trailing: IconButton(
            onPressed: () {
              Get.defaultDialog(
                title: "Customer ၀ယ်ယူခဲ့သော အချက်အလက်များ",
                titleStyle: TextStyle(fontSize: 12),
                radius: 5,
                content: purchaseDialogBox(
                    i: i,
                    total: controller.purchcasesCashOn()[i].totalPrice,
                    shipping: shipping,
                    township: townName,
                    list: controller.purchcasesCashOn()),
              );
            },
            icon: Icon(Icons.info),
          ),
        );
      },
    );
  }

  Widget prePayCustomer() {
    HomeController controller = Get.find();
    return ListView.builder(
      itemCount: controller.purchcasesPrePay().length,
      itemBuilder: (_, i) {
        List town = controller.purchcasesPrePay()[i].deliveryTownshipInfo;
        final shipping = town[1];
        final townName = town[0];
        return AspectRatio(
          aspectRatio: 16 / 4,
          child: Card(
            elevation: 5,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Name,Phone and Date ListTile
                  Flexible(
                    flex: 2,
                    child: ListTile(
                      onTap: () {
                        print(controller.purchcasesPrePay()[i].items.length);
                        Get.defaultDialog(
                          title: "Customer ၀ယ်ယူခဲ့သော အချက်အလက်များ",
                          titleStyle: TextStyle(fontSize: 12),
                          radius: 5,
                          content: purchaseDialogBox(
                              i: i,
                              total:
                                  controller.purchcasesPrePay()[i].totalPrice,
                              shipping: shipping,
                              township: townName,
                              list: controller.purchcasesPrePay()),
                        );
                      },
                      title: Text(
                          "${controller.purchcasesPrePay()[i].name} 0${controller.purchcasesPrePay()[i].phone}"),
                      subtitle: Text(
                          "${controller.purchcasesPrePay()[i].dateTime?.day}/${controller.purchcasesPrePay()[i].dateTime?.month}/${controller.purchcasesPrePay()[i].dateTime?.year}"),
                    ),
                  ),
                  //PhotoView
                  Flexible(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        //Show Dialog PhotoView
                        showDialog(
                          //barrierColor: Colors.white.withOpacity(0),
                          context: Get.context!,
                          builder: (context) {
                            return photoViewer(
                                heroTags: controller
                                        .purchcasesPrePay()[i]
                                        .bankSlipImage ??
                                    "");
                          },
                        );
                      },
                      child: Hero(
                        tag: controller.purchcasesPrePay()[i].bankSlipImage ??
                            "",
                        child: CachedNetworkImage(
                          imageUrl:
                              controller.purchcasesPrePay()[i].bankSlipImage ??
                                  "",
                          fit: BoxFit.fill,
                          progressIndicatorBuilder: (context, url, status) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  value: status.progress,
                                ),
                              ),
                            );
                          },
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        );
      },
    );
  }

  //PhotoViewer
  Widget photoViewer({required String heroTags}) {
    return Center(
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: PhotoView(
          imageProvider: NetworkImage(heroTags),
          loadingBuilder: (context, progress) => Center(
            child: Container(
              width: 20.0,
              height: 20.0,
              child: const CircularProgressIndicator(),
            ),
          ),
          backgroundDecoration:
              BoxDecoration(color: Colors.white.withOpacity(0)),
          gaplessPlayback: false,
          //customSize: MediaQuery.of(context).size,
          heroAttributes: PhotoViewHeroAttributes(
            tag: heroTags,
            transitionOnUserGestures: true,
          ),
          //scaleStateChangedCallback: this.onScaleStateChanged,
          enableRotation: true,
          //controller:  controller,
          minScale: PhotoViewComputedScale.contained * 0.8,
          maxScale: PhotoViewComputedScale.covered * 3,
          initialScale: PhotoViewComputedScale.contained,
          basePosition: Alignment.center,
          //scaleStateCycle: scaleStateCycle
        ),
      ),
    );
  }

  Widget purchaseDialogBox({
    required int i,
    required int total, //Change Variables
    required int shipping,
    required String township,
    required List<PurchaseModel> list,
  }) {
    HomeController controller = Get.find();
    /*final deliTownShip = townshipList
        .where(
          (town) => town.fee == shipping,
        )
        .first
        .name;*/
    return Column(
      children: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text("Invoice Id"),
        //     Text("${list[i].id}"),
        //   ],
        // ),
        // SizedBox(
        //   height: 5,
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Text("Purchase Date"),
            Text(
              "၀ယ်ယူခဲ့သော နေ့ရက် - ${list[i].dateTime?.day}/${list[i].dateTime?.month}/${list[i].dateTime?.year}",
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Text("Name"),
            Text(
              list[i].name,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Text("Ph No."),
            Text(
              "0${list[i].phone}",
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Text("Email"),
            Text(
              list[i].email,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),

        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Text("Address"),
            Expanded(
                child: Text(
              list[i].address,
              style: TextStyle(fontSize: 14),
            )),
          ],
        ),
        SizedBox(
          height: 25,
        ),
        Container(
          width: 400,
          height: 150,
          child: ListView.builder(
            padding: EdgeInsets.all(0),
            itemCount: list[i].items.length,
            itemBuilder: (_, o) => Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${o + 1}. ${controller.getItem(
                          list[i].items[o].toString().split(',')[0],
                        ).name}",
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${list[i].items[o].toString().split(',')[1]}",
                          style: TextStyle(fontSize: 10),
                        ),
                        Text(
                          "${list[i].items[o].toString().split(',')[2]}",
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  Text(
                    "${list[i].items[o].toString().split(',').last} x  ${list[i].items[o].toString().split(',')[3]} ထည်",
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
          ),
        ),
        //Delivery Township
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "ပို့ဆောင်ရမည့်မြို့နယ် -",
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(width: 10),
            Text(
              township,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "စုစုပေါင်း",
              style: TextStyle(fontSize: 14),
            ),
            Text(
              "$total + Deli $shipping Ks",
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ],
    );
  }
}
