import 'package:fatura_app/constants/colors.dart';
import 'package:fatura_app/controllers/invoiceController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class producerDet extends StatelessWidget {
   
TextEditingController? controller1;
  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
        const SizedBox(
            height: 40,
          ),
        Text("معلومات المادة",style: TextStyle(color: Colors.black,fontSize: 20),),
         const SizedBox(
            height: 20,
          ),
        Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 35,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
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
                        hintText: "اسم المادة",
                        contentPadding: const EdgeInsets.only(
                            bottom: 10, left: 4, right: 4, top: -8)),
                  ),
                ),
                SizedBox(height: 10,),
        Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 35,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
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
                        hintText: "اسم آخر او رقم للمادة",
                        contentPadding: const EdgeInsets.only(
                            bottom: 10, left: 4, right: 4, top: -8)),
                  ),
                ),
                 GetBuilder<invoiceController>(
                  init: invoiceController(),
                  builder: (controller) => Column(
                              children: [
                                Row(mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Text(
                                      "مادة مستودعية",
                                      style: TextStyle(
                                          color: Color(0xFF3d87aa),
                                          fontSize: 14,
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
                                Row(mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Text(
                                      "مادة خدمية",
                                      style: TextStyle(
                                          color: Color(0xFF3d87aa),
                                          fontSize: 14,
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
                            )),
                             Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 35,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: const Color(0xFF3d87aa), width: 1.5),
                      borderRadius: BorderRadius.circular(12)),
                  child: const Center(child: Text("المواد الرئيسية",style: TextStyle(
                        color: Colors.black45,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),))
                ),
                SizedBox(height: 20,),
                Row(children: [
                    
                     Expanded(
                       child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 35,
                 
                  decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: const Color(0xFF3d87aa), width: 1.5),
                        borderRadius: BorderRadius.circular(12)),
                  child: TextFormField(
                    controller: controller1,
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
                          
                          contentPadding: const EdgeInsets.only(
                              bottom: 10, left: 4, right: 4, top: -8)),
                  ),
                ),
                     ),
                Padding(
                  padding: const EdgeInsets.only( right: 10),
                  child: Text("الحد الأدنى في المستودع للطلب",style: TextStyle(color: Colors.black,fontSize: 14),),
                ),
                ],),
                SizedBox(height: 20,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 35,
                 
                  decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: const Color(0xFF3d87aa), width: 1.5),
                        borderRadius: BorderRadius.circular(12)),
                  child: TextFormField(
                    controller: controller1,
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
                          hintText: "ملاحظات",
                          contentPadding: const EdgeInsets.only(
                              bottom: 10, left: 4, right: 4, top: -8)),
                  ),
                ),
      ],),
       floatingActionButton: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: ElevatedButton(
          child: const Text("حفظ"),
          onPressed: () {
           Get.to(producerDet());
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}