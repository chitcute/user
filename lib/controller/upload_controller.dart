import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kozarni_ecome/controller/home_controller.dart';
import 'package:kozarni_ecome/data/constant.dart';
import 'package:kozarni_ecome/model/item.dart';
import 'package:kozarni_ecome/model/size_price.dart';
import 'package:kozarni_ecome/service/api.dart';
import 'package:kozarni_ecome/service/database.dart';
import 'package:uuid/uuid.dart';

class UploadController extends GetxController {
  final RxBool isUploading = false.obs;
  var isEmptySizePrice = false.obs;
  var isEmptyDiscountPercentage = false.obs;
  final HomeController _homeController = Get.find();

  @override
  void onInit() {
    super.onInit();

    if (_homeController.editItem.value.id.isNotEmpty) {
      photoController.text = _homeController.editItem.value.photo;
      photo2Controller.text = _homeController.editItem.value.photo2;
      photo3Controller.text = _homeController.editItem.value.photo3;
      nameController.text = _homeController.editItem.value.name;
      deliverytimeController.text = _homeController.editItem.value.deliverytime;
      brandController.text = _homeController.editItem.value.brand;
      priceController.text = _homeController.editItem.value.price.toString();
      discountpriceController.text =
          _homeController.editItem.value.discountprice.toString();
      colorController.text = _homeController.editItem.value.color;
      starController.text = _homeController.editItem.value.star.toString();
      categoryController.text = _homeController.editItem.value.category;
      desc.text = _homeController.editItem.value.desc;
      sizePriceMap.value = Map.fromIterable(
        _homeController.editItem.value.sizePrice,
        key: (element) => element.id,
        value: (element) => element,
      );
    }
  }

  final Api _api = Api();
  final Database _database = Database();
  final ImagePicker _imagePicker = ImagePicker();

  final RxString filePath = ''.obs;

  final GlobalKey<FormState> form = GlobalKey();

  final TextEditingController photoController = TextEditingController();
  final TextEditingController photo2Controller = TextEditingController();
  final TextEditingController photo3Controller = TextEditingController();
  final TextEditingController deliverytimeController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController desc = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController discountpriceController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController sizeController = TextEditingController();
  final TextEditingController starController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  RxMap<String, SizePrice> sizePriceMap = <String, SizePrice>{}.obs;

  //Add SIZEPRICE object into List
  void addSizePrice() {
    final obj = SizePrice.empty();
    sizePriceMap.putIfAbsent(obj.id, () => obj);
  }

  //Change SizePrice's sizeText
  void changeSizePriceText(String value, String id) {
    sizePriceMap[id] = sizePriceMap[id]!.copyWith(sizeText: value);
  }

  //Change SizePrice's price
  void changeSizePricePrice(String value, String id) {
    sizePriceMap[id] =
        sizePriceMap[id]!.copyWith(price: value.isEmpty ? 0 : int.parse(value));
  }

  //Delete SizePrice
  void deleteSizePrice(String id) {
    sizePriceMap.remove(id);
  }

  Future<void> pickImage() async {
    try {
      final XFile? _file =
          await _imagePicker.pickImage(source: ImageSource.gallery);
      if (_file != null) filePath.value = _file.path;
    } catch (e) {
      print("pickImage error $e");
    }
  }

  String? validator(String? data) => data?.isEmpty == true ? 'empty' : null;

  Future<void> upload() async {
    if (sizePriceMap.isNotEmpty) {
      isEmptySizePrice.value = false;
    }
    if (isUploading.value) return;
    try {
      isUploading.value = true;
      if (form.currentState?.validate() == true
          //  &&

          // filePath.value.isNotEmpty
          &&
          sizePriceMap.isNotEmpty) {
        final DateTime dateTime = DateTime.now();

        // await _api.uploadFile(
        //   filePath.value,
        //   folder: itemUrl,
        //   fileName:
        //       "${dateTime.year}${dateTime.month}${dateTime.day}${dateTime.hour}${dateTime.minute}${dateTime.second}",
        // );

        if (_homeController.editItem.value.id.isNotEmpty) {
          await _database.update(
            itemCollection,
            path: _homeController.editItem.value.id,
            data: _homeController.editItem.value
                .copyWith(
                  photo: photoController.text,
                  photo2: photo2Controller.text,
                  photo3: photo3Controller.text,
                  deliverytime: deliverytimeController.text,
                  brand: brandController.text,
                  name: nameController.text,
                  color: colorController.text,
                  price: int.parse(priceController.text),
                  discountprice: int.parse(discountpriceController.text),
                  star: int.parse(starController.text),
                  desc: desc.text,
                  category: categoryController.text,
                  sizePrice: sizePriceMap.entries.map((e) => e.value).toList(),
                )
                .toJson(),
          );
        } else {
          await _database.write(
            itemCollection,
            data: ItemModel.empty()
                .copyWith(
                  id: Uuid().v1(),
                  photo: photoController.text,
                  photo2: photo2Controller.text,
                  photo3: photo3Controller.text,
                  deliverytime: deliverytimeController.text,
                  brand: brandController.text,
                  name: nameController.text,
                  color: colorController.text,
                  price: int.parse(priceController.text),
                  discountprice: int.parse(discountpriceController.text),
                  star: int.parse(starController.text),
                  desc: desc.text,
                  category: categoryController.text,
                  sizePrice: sizePriceMap.entries.map((e) => e.value).toList(),
                )
                .toJson(),
          );
        }
        isUploading.value = false;
        Get.snackbar('Success', 'Uploaded successfully!');
        filePath.value = '';
        photoController.clear();
        photo2Controller.clear();
        photo3Controller.clear();
        brandController.clear();
        deliverytimeController.clear();
        discountpriceController.clear();
        nameController.clear();
        desc.clear();
        priceController.clear();
        colorController.clear();
        sizeController.clear();
        starController.clear();
        categoryController.clear();
        isEmptySizePrice.value = false;
        isEmptyDiscountPercentage.value = false;
        sizePriceMap.clear();
        return;
      } else {
        sizePriceMap.isEmpty
            ? isEmptySizePrice.value = true
            : isEmptySizePrice.value = false; //to show error
      }
      isUploading.value = false;
      Get.snackbar('Required', 'Image is required');
    } catch (e) {
      isUploading.value = false;
      print("upload error $e");
    }
  }
}
