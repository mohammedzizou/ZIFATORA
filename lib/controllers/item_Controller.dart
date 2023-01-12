/*import 'package:fatura_app/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'invoice_controller.dart';

class itemsController extends GetxController {
  final Rx<List<Item>> itemsList = Rx<List<Item>>([]);
  //final RxDouble _total = 0.00.obs;
  TextEditingController itemNameInputController = TextEditingController();
  TextEditingController itemPriceInputController = TextEditingController();
  TextEditingController itemQtyInputController = TextEditingController();

 late Item itemModel;
 var itemCount =0.obs;
 @override
 void onClose(){
super.onClose();
itemNameInputController.dispose();
itemPriceInputController.dispose();
itemQtyInputController.dispose();
 }

 addItem(String itemName, double itemPrice,int itemQty){
itemModel =new Item(name: itemName,price: itemPrice,qty: itemQty);
itemsList.value.add(itemModel);
itemCount.value=itemsList.value.length;
 }
 void remove_item(int index) {
    itemsList.value.removeAt(index);
   itemCount.value=itemsList.value.length;
  }
  // validate form;
/*
  bool validate() {
    if (itemNameInputController.text.isEmpty ||
        itemPriceInputController.text.isEmpty ||
        itemQtyInputController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Please Fill all the required fields",
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } else if (!itemPriceInputController.text.isNum ||
        !itemQtyInputController.text.isNum) {
      Get.snackbar(
        "Error",
        "Item Price/Qty can only be a number",
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } else {
      add_item(
        item_name: itemNameInputController.text,
        item_price: double.parse(itemPriceInputController.text),
        item_qty: int.parse(itemQtyInputController.text),
      );
      itemNameInputController.clear();
      itemPriceInputController.clear();
      itemQtyInputController.clear();
      update();
      return true;
    }
  }

  // add new item
  void add_item(
      {required String item_name,
      required double item_price,
      required int item_qty}) {
    _itemsList.add(
      Item(
        name: item_name,
        price: item_price,
        qty: item_qty,
      ),
    );
    update();
    calcTotal();
  }

  void remove_item({required Item item}) {
    _itemsList.remove(item);
    update();
    calcTotal();
  }

  void clear_items() {
    _itemsList.clear();
    update();
    calcTotal();
  }

  void calcTotal() => _total.value = _itemsList.fold(
      0, (previousValue, next) => previousValue + (next.price * next.qty));*/
}*/
