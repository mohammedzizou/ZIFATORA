import 'package:fatura_app/controllers/invoiceController.dart';

import 'package:fatura_app/screens/home_screen/widgets/container_invoice.dart';
import 'package:fatura_app/screens/invoice/producer/secreen_list_of_producer.dart';
import 'package:fatura_app/utils/storage_data/database.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class invoice extends StatelessWidget {
  invoice({Key? key}) : super(key: key);
  SQLdb sqLdb = SQLdb();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        //appBar: AppBar(title: Text("MAIN CASH")),
        body: Column(
      children: [
        Container(
          height: 90,
          width: size.width,
          color: Color(0xFF3d87aa),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 42,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("الصندوق الرئيسي",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    const Text("0",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.repeat_rounded,
                          color: Colors.white,
                          size: 16,
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: size.height - 149,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GetBuilder<invoiceController>(
                            init: invoiceController(),
                            builder: (controller) => container_invoice(
                              size: size,
                              icon: Icons.ac_unit,
                              title: 'انشاء فاتورة مبيع',
                              ontap: () {
                                //Get.to(invoice1());
                                // Get.lazyPut(() => itemsController());
                                Get.toNamed("/new");
                                //Get.toNamed("/add_items");
                                // Get.bottomSheet(invoice_det());
                                controller.time = TimeOfDay.now();
                                controller.date = DateTime.now();
                                controller.controller_text1.text = "02";
                                controller.balance = "Cash";
                                controller.Tax = false;
                              },
                            ),
                          ),
                          container_invoice(
                            size: size,
                            icon: Icons.ac_unit,
                            title: ' انشاء فاتورة شراء',
                            ontap: () async {
                              /*int response = await sqLdb.insertData(
                                  '''INSERT INTO 'artist'
                                   ('ArtistId','Name') 
                                   VALUES ('102','mohamme6')
                                   ''');*/
                              int response1 = await sqLdb.insertData(
                                  '''INSERT INTO 'album'
                                   ('AlbumId','Title','ArtistId') 
                                   VALUES ('7522','azizou','1822')
                                   ''');
                   //  print(response);   
                     print(response1);   
                         /*  int response1 = await sqLdb.insertData(
                                  "INSERT INTO 'Genre' ('Name') VALUES ('mohamme6')");
                              int response2 = await sqLdb.insertData(
                                  "INSERT INTO 'mm' ('Nam') VALUES ('mohame6')");
                              print(response1);
                              
                              print(response2);
                              List<Map> mm = await sqLdb
                                  .readData("SELECT * FROM 'Artist'");
                              print(mm);
                              List<Map> mm1 =
                                  await sqLdb.readData("SELECT * FROM 'Genre'");
                              print(mm1);*/
                              List<Map> mm2 =
                                  await sqLdb.readData("SELECT * FROM 'artist' ");
                              print(mm2);
                              List<Map> mm3 =
                                  await sqLdb.readData("SELECT * FROM 'album' ");
                              print(mm3);
                             // print(mm2[0]["Email"]);

                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          container_invoice(
                            size: size,
                            icon: Icons.ac_unit,
                            title: 'جرد المستودع',
                            ontap: () {},
                          ),
                          container_invoice(
                            size: size,
                            icon: Icons.ac_unit,
                            title: 'فواتير المرتجع و التوالف',
                            ontap: () {},
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      container_invoices_detail(
                          size: size,
                          icon: Icons.money_off,
                          title: 'عرض الفواتير السابقة',
                          height: 60, ontap: () {  },),
                      const SizedBox(
                        height: 25,
                      ),
                      container_invoices_detail(
                          size: size,
                          icon: Icons.money_off,
                          title: 'عروض الاْسعار -طلبات الشراء ',
                          height: 80, ontap: () {  },),
                      const SizedBox(
                        height: 25,
                      ),
                      container_invoices_detail(
                          size: size,
                          icon: Icons.money_off,
                          title: 'اجمالي المبيع والشراء اليومي',
                          height: 60, ontap: () {  },),
                      const SizedBox(
                        height: 25,
                      ),
                      container_invoices_detail(
                          size: size,
                          icon: Icons.money_off,
                          title: 'حركة المواد',
                          height: 60, ontap: () {  },),
                      const SizedBox(
                        height: 25,
                      ),
                      container_invoices_detail(
                          size: size,
                          icon: Icons.money_off,
                          title: 'حركة المواد حسب الحساب',
                          height: 60, ontap: () {  },),
                      const SizedBox(
                        height: 25,
                      ),
                      container_invoices_detail(
                          size: size,
                          icon: Icons.money_off,
                          title: 'تعديل وتصدير اْسعار المبيع والشراء',
                          height: 60, ontap: () {  },),
                      const SizedBox(
                        height: 25,
                      ),
                      container_invoices_detail(
                          size: size,
                          icon: Icons.money_off,
                          title: 'سياسة التسعير',
                          height: 60, ontap: () {  },),
                      const SizedBox(
                        height: 25,
                      ),
                      container_invoices_detail(
                          size: size,
                          icon: Icons.money_off,
                          title: 'ادخال بضاعة المستودع الحالية (فاتورة جرد)',
                          height: 80, ontap: () {  },),
                      const SizedBox(
                        height: 25,
                      ),
                      container_invoices_detail(
                          size: size,
                          icon: Icons.money_off,
                          title: 'تسوية المخزون واصلاحه',
                          height: 60, ontap: () {  },),
                      const SizedBox(
                        height: 25,
                      ),
                      container_invoices_detail(
                          size: size,
                          icon: Icons.money_off,
                          title: 'قائمة المواد',
                          height: 60, ontap: () { 
                            Get.to(listProducer());
                           },),
                      const SizedBox(
                        height: 25,
                      ),
                      container_invoices_detail(
                          size: size,
                          icon: Icons.money_off,
                          title: 'آخر اسعار للمواد بالعملات',
                          height: 60, ontap: () {  },),
                      const SizedBox(
                        height: 25,
                      ),
                      container_invoices_detail(
                          size: size,
                          icon: Icons.money_off,
                          title: 'مصمم الباركود',
                          height: 60, ontap: () {  },),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
