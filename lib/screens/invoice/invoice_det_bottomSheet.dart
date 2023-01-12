import 'package:fatura_app/controllers/invoiceController.dart';
import 'package:fatura_app/models/item_model.dart';
import 'package:fatura_app/screens/invoice/invoice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class invoice_det extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 600,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xFF3d87aa), width: 3.5),
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(15), topLeft: Radius.circular(15)),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Container(
              height: 40,
              width: size.width - 20,
              decoration: const BoxDecoration(
                color: Color(0xFF3d87aa),
                //  border: Border.all(color: Color(0xFF3d87aa), width: 1.5),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(22),
                    topLeft: Radius.circular(22)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    "Time",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Date",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Invoice",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
                height: 40,
                width: size.width - 20,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Color(0xFF3d87aa), width: 1),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(22),
                      bottomRight: Radius.circular(22)),
                ),
                child: GetBuilder<invoiceController>(
                  init: invoiceController(),
                  builder: (controller) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                          onTap: () => controller.time_day(context),
                          child: Container(
                              width: (size.width - 40) / 3,
                              child: Center(
                                  child: Text(
                                "${controller.time.hour}:${controller.time.minute}:00",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              )))),
                      GestureDetector(
                          onTap: () => controller.time_date(context),
                          child: Container(
                              width: (size.width - 20) / 3,
                              child: Center(
                                  child: Text(
                                "${controller.date.year}-${controller.date.month}-${controller.date.day}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              )))),
                      Container(
                          width: (size.width - 20) / 3,
                          height: 40,
                          padding: const EdgeInsets.only(
                            left: 45,
                            right: 10,
                          ),
                          child: Center(
                            child: TextField(
                                maxLines: 1,
                                keyboardType: TextInputType.number,
                                controller: controller.controller_text1,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                                decoration: const InputDecoration.collapsed(
                                  hintText: "",
                                )),
                          )),
                    ],
                  ),
                )),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    print("1");
                  },
                  icon: const Icon(Icons.menu),
                  color: const Color(0xFF3d87aa),
                  iconSize: 40,
                ),
                Container(
                    width: (size.width - 140),
                    height: 40,
                    padding: const EdgeInsets.only(
                      left: 30,
                      right: 15,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Color(0xFF3d87aa), width: 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child:  Center(
                      child: GetBuilder<invoiceController>(
                        init: invoiceController(),
                        builder: (controller) =>  TextField(
                          maxLines: 1,
                          controller: controller.CustomerController,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration.collapsed(
                            hintText: "      General Customer",
                          ))),
                    )),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.delete_sweep),
                  color: const Color(0xFF3d87aa),
                  iconSize: 40,
                ),
              ],
            ),
            const Text(
              "Balance:",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            GetBuilder<invoiceController>(
                        init: invoiceController(),
                        builder: (controller) => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      width: (size.width / 4),
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: Color(0xFF3d87aa), width: 1.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Center(
                        child: Text(
                          "دج",
                          style: TextStyle(
                              color: Colors.black26,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Row(
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      "on credit",
                                      style: TextStyle(
                                          color: Color(0xFF3d87aa),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Radio(
                                      focusColor: Color(0xFF3d87aa),
                                      value: "on credit",
                                      groupValue: controller.balance,
                                      onChanged: (value) {
                                        controller.raio_cash_nCredit(2, value!);
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "Cash",
                                      style: TextStyle(
                                          color: Color(0xFF3d87aa),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Radio(
                                      focusColor: const Color(0xFF3d87aa),
                                      value: "Cash",
                                      groupValue: controller.balance,
                                      onChanged: (value) {
                                        controller.raio_cash_nCredit(2, value!);
                                      },
                                    ),
                                  ],
                                )
                              ],
                            )
                  ],
                ),
                 controller.on_Credit(size)
              ],
            ),),
            const SizedBox(
              height: 8,
            ),
            Container(
                width: (size.width - 23),
                height: 40,
                padding: EdgeInsets.only(left: 120),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border:
                      Border.all(color: const Color(0xFF3d87aa), width: 1.5),
                  borderRadius: BorderRadius.circular(15),
                ),
                child:  Center(
                  child: GetBuilder<invoiceController>(
                        init: invoiceController(),
                        builder: (controller) => TextField(
                    controller:controller.noteController,
                      maxLines: 1,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                      decoration: InputDecoration.collapsed(
                        hintText: "           Note",
                      ))),
                )),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(height: 20,
                child: Divider(
                  color: Colors.black26,
                  height: 35,
                  thickness: 1.5,
                ),
              ),
            ),
            GetBuilder<invoiceController>(
              init: invoiceController(),
              builder: (controller) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                         const SizedBox(
                          width: 70,
                        ),
                        controller.tax_widget(2),
                       
                        const Text(
                          "Tax",
                          style: TextStyle(
                              color: Color(0xFF3d87aa),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                            height: 22,
                            width: 70,
                            padding: const EdgeInsets.only(right: 20),
                            child: Switch(
                                activeColor: const Color(0xFF3d87aa),
                                value: controller.Tax,
                                onChanged: (Value2) {
                                  controller.switch_Tax(Value2);
                                })),
                       
                      ],
                    ),
                    controller.tax_widget(1)
                   
                  ],
                ),
              ),
              
            ),
            GetBuilder<invoiceController>(
                        init: invoiceController(),
                        builder: (controller) =>  ElevatedButton(
                onPressed: () {
                  
                 
                     Get.back();
                 
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child:
                    const Text("                  Start Billiing                  ")))
          ],
        ),
      ),
    );
  }
}

