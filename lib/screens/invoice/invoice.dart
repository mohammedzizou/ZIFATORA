import 'package:fatura_app/constants/colors.dart';
import 'package:fatura_app/constants/strings.dart';
import 'package:fatura_app/controllers/invoiceController.dart';
import 'package:fatura_app/controllers/invoice_controller.dart';
import 'package:fatura_app/controllers/item_Controller.dart';
import 'package:fatura_app/models/invoice_model.dart';
import 'package:fatura_app/models/item_model.dart';
import 'package:fatura_app/screens/invoice/producer/add_producer.dart';
import 'package:fatura_app/screens/shared_widgets/custom_btn.dart';
import 'package:fatura_app/screens/shared_widgets/custom_input_eng.dart';
import 'package:flutter/material.dart';
import 'package:fatura_app/controllers/items_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'Item_Det.dart';
import 'invoice_det_bottomSheet.dart';

class invoice1 extends GetView<ItemsController> {

// ItemsController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        const SizedBox(
          height: 38,
        ),
        Center(
          child: Container(
            height: 50,
            width: size.width - 20,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              //  border: Border.all(color: Color(0xFF3d87aa), width: 1.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    
                  },
                  child: Container(
                    height: 50,
                    width: (size.width) / 3,
                    decoration: BoxDecoration(
                      color: const Color(0xFF3d87aa),
                      //  border: Border.all(color: Color(0xFF3d87aa), width: 1.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:  [
                        const Icon(
                          Icons.save_rounded,
                          color: Colors.white
                        ), 
                        const Text(
                          "حفظ الفاتورة",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(
                      Icons.share,
                      color: Color(0xFF3d87aa),
                    ),
                    Text(
                      "طباعة ومشاركة",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Get.bottomSheet(invoice_det());
                  },
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          Icons.mode,
                          color: Color(0xFF3d87aa),
                        ),
                        Text(
                          "تعديل الفاتورة ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            height: 15,
            child: Divider(
              color: Colors.black26,
              height: 35,
              thickness: 1,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Get.to(addProducer());
              },
              icon: const Icon(Icons.menu),
              color: const Color(0xFF3d87aa),
              iconSize: 40,
            ),
            Container(
                width: (size.width - 120),
                height: 40,
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 15,
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: const Color(0xFF3d87aa), width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: GetBuilder<invoiceController>(
                      init: invoiceController(),
                      builder: (controller) => const TextField(
                          maxLines: 1,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              color: Color(0xFF3d87aa),
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration.collapsed(
                            hintText: "ادخل اسم المادة لاضافتها للفاتورة",
                          ))),
                )),
            IconButton(
              onPressed: () {
                Get.defaultDialog(
                  title: AppStrings.ADD_ITEMS_DIALOG_TITLE,
                  content: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const Divider(),
                          CustomInput_eng(
                            width: 210,
                            label: "اسم المادة",
                            controller: controller.itemNameInputController,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomInput_eng(
                                  width: 100,
                                  label: AppStrings.ADD_ITEMS_PRICE,
                                  controller:
                                      controller.itemPriceInputController,
                                  type: TextInputType.number),
                              CustomInput_eng(
                                width: 100,
                                label: AppStrings.ADD_ITEMS_QTY,
                                controller: controller.itemQtyInputController,
                                type: TextInputType.number,
                              ),
                            ],
                          ),
                          CustomBtn(
                            label: AppStrings.ADD_BTN,
                            action: () {
                             /* controller.addItem(
                                  controller.itemNameInputController.text,
                                  5,
                                  4);*/
                                 
                                  
                                    print("  q = ${controller.itemQtyInputController.text}");
                                bool isValid = controller.validate();
                               
                                if (isValid) {
                                 Get.close(1);
                                }
                            },
                            color: AppColors.kPrimaryColor,
                            textColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.add_photo_alternate_outlined),
              color: const Color(0xFF3d87aa),
              iconSize: 40,
            ),
          ],
        ),
        Container(
          height: 20,
          width: size.width - 20,
          decoration: const BoxDecoration(
            color: Color(0xFF3d87aa),
            //  border: Border.all(color: Color(0xFF3d87aa), width: 1.5),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(22), topLeft: Radius.circular(22)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text(
                "الكمية",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                " الوحدة   ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "الافرادي   ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "الاجمالي",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            color: Colors.white,
            height: size.height - 212,
            padding: const EdgeInsets.only(top: 5),
            child:Obx(() {return controller.itemsList.isEmpty ? const Center(
                    child: Text("فارغ"),
                  )
                :
               ListView(children: controller.itemsList.map<Widget>((itemx) => itemDet(
                                    item: itemx, size: size,
                                  )).toList(),);})
              /* ListView.builder(
              itemCount: controller.itemCount.value,
              itemBuilder: (BuildContext context, int index) {
                return itemDet(
                  index: index,
                  name: controller.itemsList.value[index].name,
                  price: controller.itemsList.value[index].price,
                  qty: controller.itemsList.value[index].qty,
                  size: size,
                );
              },
            ),*/
          ),
        ),
        Container(
            height: 20,
            width: size.width - 20,
            decoration: const BoxDecoration(
              color: Color(0xFF3d87aa),
              //  border: Border.all(color: Color(0xFF3d87aa), width: 1.5),
            ),
            child: Center(child: Obx(() {
              return Text("المجموع [${controller.total.value.toStringAsFixed(2)}]  مبيع نقدي - محمد");
            })))
      ],
    )));
  }
}
