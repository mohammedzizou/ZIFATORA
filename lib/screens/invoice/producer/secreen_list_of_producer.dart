import 'package:fatura_app/constants/colors.dart';
import 'package:fatura_app/controllers/items_controller.dart';
import 'package:fatura_app/screens/invoice/producer/producer_Det.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class listProducer extends GetView<ItemsController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
             
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 18),
                  height: 35,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: AppColors.kSecondaryColor,
                      border: Border.all(
                          color: const Color(0xFF3d87aa), width: 1.5),
                      borderRadius: BorderRadius.circular(12)),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: AppColors.kSecondaryColor,
                        filled: false,
                        hintText: "البحث في المواد",
                        contentPadding: const EdgeInsets.only(
                            bottom: 10, left: 4, right: 4, top: -8)),
                  ),
                ),
              ),
            ],
          ),
         
            
        ],
      ),
      floatingActionButton: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 18),
        child: ElevatedButton(
          child: const Text("اضافة"),
          onPressed: () {
           Get.to(producerDet());
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
