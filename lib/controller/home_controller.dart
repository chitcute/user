import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kozarni_ecome/data/constant.dart';
import 'package:kozarni_ecome/data/enum.dart';
import 'package:kozarni_ecome/model/hive_item.dart';
import 'package:kozarni_ecome/model/hive_purchase.dart';
import 'package:kozarni_ecome/model/hive_size_price.dart';
import 'package:kozarni_ecome/model/item.dart';
import 'package:kozarni_ecome/model/purchase.dart';
import 'package:kozarni_ecome/model/size_price.dart';
import 'package:kozarni_ecome/model/township.dart';
import 'package:kozarni_ecome/model/user.dart';
import 'package:kozarni_ecome/service/api.dart';
import 'package:kozarni_ecome/service/auth.dart';
import 'package:kozarni_ecome/service/database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class HomeController extends GetxController {
  final Auth _auth = Auth();
  final Database _database = Database();
  final Api _api = Api();
  final ImagePicker _imagePicker = ImagePicker();
  Box<HivePurchase> purchaseHiveBox =
      Hive.box(purchaseBox); //Current User's Order History Database

  final RxBool authorized = false.obs;
  final Rx<AuthUser> user = AuthUser().obs;

  final RxBool phoneState = false.obs;
  final codeSentOnWeb = false.obs; //codeSentOnWeb on Web
  final TextEditingController _phoneCodeController =
      TextEditingController(); //On Web
  late SharedPreferences
      sharedPref; //Share Preference to Store User's Order Data
  String? townshipName; //Township Name
  var paymentOptions = PaymentOptions.None.obs; //Payment Option Initial Value
  var checkOutStep = 0.obs; //Check Out Step
  var bankSlipImage = "".obs;
  Township? township;

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController verificationController = TextEditingController();

  final RxString _codeSentId = ''.obs;
  final RxInt _codeSentToken = 0.obs;

  final RxList<PurchaseItem> myCart = <PurchaseItem>[].obs;
  Map<String, dynamic> townShipNameAndFee = {}; //Township Name and Fee
  var discountPercentage = 0.obs; //Discount Percentage For Usual Product
  var totalUsualPrice = 0.obs; //Total Usual Product Addition Price
  var totalHotPrice = 0.obs; //Total Hot Product Addition Price
  var discountPrice = 0.0.obs;
  var totalUsualProductCount = 0.obs;
  var totalHotProductCount = 0.obs;

  int mouseIndex = -1; //Mouse Region
  var purchaseId = "".obs;

  void setPurchaseId(String id) {
    if (purchaseId.value == id) {
      purchaseId.value = "";
    } else {
      purchaseId.value = id;
    }
  }

  void changeMouseIndex(int i) {
    // Change Mouse Region
    mouseIndex = i;
    debugPrint("On Mouse Exist************");
    update();
  }

  //Set Township Name
  void setTownShipNameAndShip({required String name, required String fee}) {
    townShipNameAndFee = {
      "townName": name,
      "fee": int.parse(fee),
    };
    update();
  }

  //Set Shipping Fee
  void setTownshipName(String? val) {
    townshipName = val!;
    update();
  }

  //Set Township Name
  void setTownship(Township value) {
    township = value;
    update();
  }

  //Change Payment Option
  void changePaymentOptions(PaymentOptions option) {
    paymentOptions.value = option;
  }

  //Change Step Index
  void changeStepIndex(int value) {
    checkOutStep.value = value;
  }

  //Set Bank Slip Image
  void setBankSlipImage(String image) {
    bankSlipImage.value = image;
  }

  void addToCart(ItemModel itemModel, String color, String size, int price) {
    final isHotSales = itemModel.category == "Hot Sales";
    try {
      final PurchaseItem _item = myCart.firstWhere(
        (item) =>
            item.id == itemModel.id &&
            item.color == color &&
            item.size == size &&
            item.price == price,
      );
      myCart.value = myCart.map((element) {
        if (_item.id == element.id) {
          return PurchaseItem(
            element.id,
            element.count + 1,
            element.size,
            element.color,
            element.isHotDeal,
            element.price,
          );
        }
        return element;
      }).toList();
    } catch (e) {
      final hotOrUsual = isHotSales ? "Hot Deals" : "Usual Deals";
      //This is the first item.not already contain before.So,we add new one
      myCart.add(PurchaseItem(
          itemModel.id, 1, "$size\n $hotOrUsual", color, isHotSales, price));
    }
  }

  //Get MainPrice
  double getMainPrice(int sizePrice, String discountText, int percentage) {
    int discount = 0;
    try {
      discount = int.parse(discountText.split(" ").first);
    } catch (e) {
      discount = 0;
      debugPrint("*******************Discount Text Error");
      //TODO: TO SHOW it was wrong when upload discountText when admin upload.
    }
    double discountPrice = 0;
    if (discount != 0) {
      final originalPrice = sizePrice * discount;
      discountPrice = originalPrice - (originalPrice * (percentage / 100));
    }
    return discountPrice;
  }

  double getSubtotalPrice(int usualPrice, int hotPrice) {
    discountPrice.value =
        usualPrice - (usualPrice * (discountPercentage.value / 100));
    return discountPrice.value + hotPrice;
  }

  final RxList<ItemModel> items = <ItemModel>[].obs;

  final RxList<ItemModel> searchitems = <ItemModel>[].obs;

  final Rx<ItemModel> selectedItem = ItemModel.empty().obs;

  void setSelectedItem(ItemModel item) {
    selectedItem.value = item;
  }

  final Rx<ItemModel> editItem = ItemModel.empty().obs;

  void setEditItem(ItemModel itemModel) {
    debugPrint("***********${itemModel.id}**********");
    editItem.value = itemModel;
  }

  ItemModel getItem(String id) {
    try {
      return items.firstWhere((e) => e.id == id);
    } catch (e) {
      return ItemModel.empty();
    }
  }

  List<ItemModel> getItems() => category.value == 'All'
      ? items
      : items.where((e) => e.category == category.value).toList();

  List<String> categoryList() {
    final List<String> _data = [
      'All',
    ];

    for (var i = 0; i < items.length; i++) {
      if (!_data.contains(items[i].category)) {
        _data.add(items[i].category);
      }
    }

    if (items.isEmpty) {
      _data.clear();
    }
    return _data;
  }

  List<ItemModel> pickUp() =>
      items.where((e) => e.category == 'New Products').toList();

  List<ItemModel> hot() =>
      items.where((e) => e.category == 'Hot Sales').toList();

  void removeItem(String id) => items.removeWhere((item) => item.id == id);

  //int shipping() => myCart.isEmpty ? 0 : shippingFee;

  void addCount(PurchaseItem p) {
    myCart.value = myCart.map((element) {
      if (element.id == p.id &&
          element.color == p.color &&
          element.size == p.size &&
          element.isHotDeal == p.isHotDeal) {
        return PurchaseItem(
          element.id,
          element.count + 1,
          element.size,
          element.color,
          element.isHotDeal,
          element.price,
        );
      }
      return element;
    }).toList();
    update([myCart]);
    updateSubTotal(true);
  }

  void remove(PurchaseItem p) {
    bool needToRemove = false;
    myCart.value = myCart.map((element) {
      if (element.id == p.id &&
          element.color == p.color &&
          element.size == p.size) {
        if (element.count > 1) {
          return PurchaseItem(element.id, element.count - 1, element.size,
              element.color, element.isHotDeal, element.price);
        }
        needToRemove = true;
        return element;
      }
      return element;
    }).toList();
    if (needToRemove) {
      myCart.removeWhere((element) =>
          element.id == p.id &&
          element.color == p.color &&
          element.size == p.size);
    }
    updateSubTotal(true);
  }

  int subTotal = 0;
  void updateSubTotal(bool isUpdate) {
    if (subTotal != 0) {
      subTotal = 0;
    }
    //int price = 0;
    int usualPrice = 0;
    int hotSalePrice = 0;
    int hotSaleCount = 0;
    int usualSaleCount = 0;
    for (var i = 0; i < myCart.length; i++) {
      if (myCart[i].isHotDeal) {
        hotSalePrice += myCart[i].price * myCart[i].count;
        hotSaleCount += myCart[i].count;
      } else {
        usualPrice += myCart[i].price * myCart[i].count;
        usualSaleCount += myCart[i].count;
      }
    } //When Loop is complete we calculate all criteria
    if (usualSaleCount < 3) {
      discountPercentage.value = 0;
    } else if (usualSaleCount >= 3 && usualSaleCount <= 4) {
      discountPercentage.value = 3;
    } else if (usualSaleCount >= 5 && usualSaleCount <= 9) {
      discountPercentage.value = 5;
    } else if (usualSaleCount >= 10) {
      discountPercentage.value = 10;
    }
    subTotal = getSubtotalPrice(usualPrice, hotSalePrice).round();
    totalUsualPrice.value = usualPrice;
    totalHotPrice.value = hotSalePrice;
    totalUsualProductCount.value = usualSaleCount;
    totalHotProductCount.value = hotSaleCount;
    debugPrint("*************$subTotal");
    if (isUpdate) {
      update();
    }
  }

  //Get HiveItem
  HiveItem changeHiveItem(ItemModel model) {
    return HiveItem(
      id: model.id,
      photo: model.photo,
      photo2: model.photo2,
      photo3: model.photo3,
      name: model.name,
      brand: model.brand,
      deliverytime: model.deliverytime,
      price: model.price,
      discountprice: model.discountprice,
      desc: model.desc,
      color: model.color,
      sizePrice: model.sizePrice
          .map((e) => HiveSizePrice(
                id: e.id,
                sizeText: e.sizeText,
                price: e.price,
              ))
          .toList(),
      star: model.star,
      category: model.category,
    );
  }

  //Get ItemModel
  ItemModel changeItemModel(HiveItem model) {
    return ItemModel(
      id: model.id,
      photo: model.photo,
      photo2: model.photo2,
      photo3: model.photo3,
      name: model.name,
      brand: model.brand,
      deliverytime: model.deliverytime,
      price: model.price,
      discountprice: model.discountprice,
      desc: model.desc,
      color: model.color,
      sizePrice: model.sizePrice
          .map((e) => SizePrice(
                id: e.id,
                sizeText: e.sizeText,
                price: e.price,
              ))
          .toList(),
      star: model.star,
      category: model.category,
    );
  }

  final RxList<PurchaseModel> _purchcases = <PurchaseModel>[].obs; ////

  List<PurchaseModel> purchcasesCashOn() {
    return _purchcases.where((item) => item.bankSlipImage == null).toList();
  }

  List<PurchaseModel> purchcasesPrePay() {
    return _purchcases.where((item) => item.bankSlipImage != null).toList();
  } //////////////////

  final RxBool isLoading = false.obs;

  Future<void> proceedToPay() async {
    if (isLoading.value) return;
    isLoading.value = true;
    Get.back();
    try {
      final list = getUserOrderData();
      final _purchase = PurchaseModel(
        items: myCart
            .map((cart) =>
                "${cart.id},${cart.color},${cart.size},${cart.count},${cart.price}")
            .toList(),
        name: list[0],
        email: list[1],
        phone: int.parse(list[2]),
        address: list[3],
        bankSlipImage: bankSlipImage.value.isEmpty ? null : bankSlipImage.value,
        deliveryTownshipInfo: [
          townShipNameAndFee["townName"],
          townShipNameAndFee["fee"]
        ],
        totalPrice: subTotal,
        dateTime: DateTime.now(),
      );
      final hivePurchase = HivePurchase(
        id: Uuid().v1(),
        items: _purchase.items,
        totalPrice: _purchase.totalPrice,
        deliveryTownshipInfo: _purchase.deliveryTownshipInfo,
        dateTime: _purchase.dateTime!,
      );
      await _database.writePurchaseData(_purchase).then((value) {
        Get.snackbar("လူကြီးမင်း Order တင်ခြင်း", 'အောင်မြင်ပါသည်');
        //Then we write this order into LocalDatabase
        purchaseHiveBox.put(hivePurchase.id, hivePurchase);
      }); //submit success
      myCart.clear();
      navIndex.value = 0;
      update([myCart, navIndex]);
    } catch (e) {
      Get.snackbar("လူကြီးမင်း Order တင်ခြင်း", 'မအောင်မြင်ပါ');
      print("proceed to pay error $e");
    }
    //Get.back();
    isLoading.value = false;
  }

  Future<void> login() async {
    try {
      if (_codeSentId.value.isNotEmpty || phoneState.value) {
        await confirm();
        return;
      }
      //Change method base on Platform Conditionally
      if (kIsWeb) {
        debugPrint("Web Sign In"); //Debug Print
        //web login
        await _auth.loginInWeb(
          phoneNumber: phoneController.text,
          enterCode: (callBack) => showDialogToEnterPhoneCode(
            (phoneCode) => callBack(phoneCode),
          ),
        ); //FOR WEB SIGNIN WITH PHONE
      } else {
        await _auth.login(
          phoneNumber: phoneController.text,
          verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
          codeAutoRetrievalTimeout: (String verificationId) {},
          codeSent: (String verificationId, int? forceResendingToken) {
            _codeSentId.value = verificationId;
            _codeSentToken.value = forceResendingToken ?? 0;
            update([_codeSentId, _codeSentToken]);
          },
          verificationFailed: (FirebaseAuthException error) {},
        );
        phoneState.value = true;
      }
    } catch (e) {
      print("login error $e");
    }
  }

  Future<void> confirm() async {
    try {
      await _auth.loginWithCerdential(PhoneAuthProvider.credential(
        verificationId: _codeSentId.value,
        smsCode: verificationController.text,
      ));
      _codeSentId.value = '';
      phoneState.value = false;
      phoneController.clear();
      verificationController.clear();
    } catch (e) {
      print("confirm error is $e");
    }
  }

  Future<void> logout() async {
    try {
      await _auth.logout();
    } catch (e) {
      print("logout error is $e");
    }
  }

  Future<void> uploadProfile() async {
    try {
      final XFile? _file =
          await _imagePicker.pickImage(source: ImageSource.gallery);

      if (_file != null) {
        await _api.uploadFile(
          _file.path,
          fileName: user.value.user?.uid,
          folder: profileUrl,
        );
        await _database.write(
          profileCollection,
          data: {
            'link': user.value.user?.uid,
          },
          path: user.value.user?.uid,
        );
        user.value.update(
          newProfileImage: '$baseUrl$profileUrl${user.value.user?.uid}',
        );
        update([user]);
      }
    } catch (e) {
      print("profile upload error $e");
    }
  }

  //Get User's Order Data
  List<String> getUserOrderData() {
    return sharedPref.getStringList("userOrder") ?? [];
  }

  //Set User's Order Data or Not
  Future<void> setUserOrderData({
    required String name,
    required String email,
    required String phone,
    required String address,
  }) async {
    //Making Purchase Model
    try {} catch (e) {}
    final list = getUserOrderData();
    //Check data already contain with the same data inside SharedPreference
    if (list.isEmpty) {
      await sharedPref
          .setStringList("userOrder", [name, email, phone, address]);
    } else if ( //Something is changed by User,then we restore
        (name != list[0]) ||
            (email != list[1]) ||
            (phone != list[2]) ||
            (address != list[3])) {
      await sharedPref
          .setStringList("userOrder", [name, email, phone, address]);
    }
  }

  @override
  void onInit() async {
    super.onInit();
    sharedPref = await SharedPreferences.getInstance();
    if (getUserOrderData().isNotEmpty) {
      checkOutStep.value = 1;
    } // SharedPreference to Stroe
    _database.watch(itemCollection).listen((event) {
      items.value =
          event.docs.map((e) => ItemModel.fromJson(e.data())).toList();
    });
    _auth.onAuthChange().listen((_) async {
      user.value = AuthUser(user: _);
      if (_ == null) {
        authorized.value = false;
      } else {
        authorized.value = true;
        await _database.write(
          userCollection,
          data: {
            'uid': _.uid,
            'phone': _.phoneNumber,
          },
          path: _.uid,
        );
        final DocumentSnapshot<Map<String, dynamic>> _data =
            await _database.read(userCollection, path: _.uid);
        user.value = user.value.update(
          newIsAdmin: _data.exists,
        );
        final DocumentSnapshot<Map<String, dynamic>> _profile =
            await _database.read(profileCollection, path: _.uid);
        user.value = user.value.update(
          newProfileImage: _profile.data()?['link'],
        );
        if (user.value.isAdmin) {
          _database.watchOrder(purchaseCollection).listen((event) {
            if (event.docs.isEmpty) {
              _purchcases.clear();
            } else {
              _purchcases.value = event.docs
                  .map((e) => PurchaseModel.fromJson(e.data(), e.id))
                  .toList();
            }
          });
        }
      }
    });
  }

  final RxInt navIndex = 0.obs;

  void changeNav(int i) {
    navIndex.value = i;
  }

  final RxString category = 'All'.obs;

  void changeCat(String name) {
    category.value = name;
  }

  final RxBool isSearch = false.obs;

  void search() => isSearch.value = !isSearch.value;

  void onSearch(String name) {
    isSearch.value = true;
    searchitems.value = items
        .where((p0) => p0.name.toLowerCase().contains(name.toLowerCase()))
        .toList();
  }

  void clear() => isSearch.value = false;

  void searchItem(String name) {
    isSearch.value = !isSearch.value;
  }

  //Check weather show dialog or not
  showDialogToEnterPhoneCode(void Function(String code) callBack) {
    final size = MediaQuery.of(Get.context!).size;
    Get.defaultDialog(
      title: "Phone Verification",
      content: SizedBox(
        height: size.height * 0.2,
        width: size.width * 0.2,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Text FIELD
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextFormField(
                  controller: _phoneCodeController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your code',
                  ),
                ),
              ),
              //Space
              const SizedBox(height: 10),
              //CONFIRM
              TextButton(
                onPressed: () {
                  //CALL BACK TO ORIGINAL SIGNINWITHPHONENUMBER
                  callBack(_phoneCodeController.text);
                  Get.back();
                },
                child: Text("Confirm"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
