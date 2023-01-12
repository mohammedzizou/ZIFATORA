import 'package:fatura_app/constants/colors.dart';

import 'package:fatura_app/controllers/items_controller.dart';
import 'package:fatura_app/models/item_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class itemDet extends  StatelessWidget{
  itemDet({Key? key, required this.size,required this.item})
      : super(key: key);
  ItemsController controller = Get.find();
  Size size;
  List allControllersList =[];
  Item item;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      height: 90,
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          border: Border(
              right: BorderSide(color: Colors.grey.shade500, width: 1.5),
              bottom: BorderSide(color: Colors.grey.shade500, width: 1.5))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding:  const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               IconButton(icon: const Icon(
                  Icons.add_circle,
                  color: Color(0xFF3d87aa),
                  size: 28,
                ),
                onPressed: () {
                  item.qty++;
                  
                },),
                Text(
                  (item != null) ? item.name : "null",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                IconButton(icon:
                 const Icon( Icons.delete,
                  color: Color(0xFF3d87aa),
                  size: 28,),
                  onPressed: () {
                     (item != null)
                        ? controller.remove_item(item: item)
                        : print("null");
                     
                  },

                ),
              ],
            ),
          ),
         
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 31,
                      width: 81,
                      decoration: BoxDecoration(
                          color: AppColors.kSecondaryColor,
                          border: Border.all(
                              color: const Color(0xFF3d87aa), width: 1.5),
                          borderRadius: BorderRadius.circular(12)),
                      child: TextFormField(
                        
                        controller: controller.itemQtyInputController1,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: AppColors.kSecondaryColor,
                            filled: false,
                            hintText: (item != null) ? "${item.qty}" : "-", //"الكمية",
                            contentPadding: const EdgeInsets.only(
                                bottom: 10, left: 4, right: 4, top: -8)),
                      ),
                    ),
                    Container(
                      height: 29,
                      width: 60,
                      color: const Color(0xFF3d87aa),
                      child: const Center(
                        child: Text(
                          "الوحدة",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      height: 31,
                      width: 81,
                      decoration: BoxDecoration(
                          color: AppColors.kSecondaryColor,
                          border: Border.all(
                              color: const Color(0xFF3d87aa), width: 1.5),
                          borderRadius: BorderRadius.circular(12)),
                      child: TextFormField(
                        controller: controller.itemPriceInputController1,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: AppColors.kSecondaryColor,
                            filled: false,
                            hintText:(item != null) ? item.price.toStringAsFixed(2) : "-", // "الوحدة",
                            contentPadding: const EdgeInsets.only(
                                bottom: 10, left: 4, right: 4, top: -8)),
                      ),
                    ),
                    Container(
                      height: 31,
                      width: 81,
                      decoration: BoxDecoration(
                          color: AppColors.kSecondaryColor,
                          border: Border.all(
                              color: const Color(0xFF3d87aa), width: 1.5),
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(child: Text((item.price*item.qty).toStringAsFixed(0), style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),))/*TextFormField(
                        controller: controller.RetailController,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: AppColors.kSecondaryColor,
                            filled: false,
                            hintText: "المجموع",
                            contentPadding: EdgeInsets.only(
                                bottom: 10, left: 4, right: 4, top: -8)),
                      ),*/
                    ),
                  ],
                ),
              ),
        ],
      ),
    );
  }
}
