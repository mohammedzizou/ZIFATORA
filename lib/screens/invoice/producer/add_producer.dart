import 'package:fatura_app/constants/colors.dart';
import 'package:fatura_app/controllers/items_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class addProducer extends GetView<ItemsController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          const SizedBox(
            height: 38,
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.menu,
                  size: 22,
                ),
                onPressed: () {},
              ),
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
          const Center(
              child: Text(
            "يمكنك تعديل صور المواد من قاىْمة المواد",
            style: TextStyle(color: Colors.orange),
          )),
          Expanded(
              child: Container(
                  width: size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15),
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.itemNameInputController.text = "kk";
                            controller.itemPriceInputController.text = "2";
                            controller.itemQtyInputController.text = "1";
                          },
                          child: Container(
                            height: 120,
                            decoration: BoxDecoration(
                                color: AppColors.kSecondaryColor,
                                border: Border.all(
                                    color: const Color(0xFF3d87aa), width: 1.5),
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.black,
                                    radius: 40,
                                  ),
                                ),
                                const Text("joulax"),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [Text("  0"), Text("30  ")],
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.itemNameInputController.text = "mm";
                            controller.itemPriceInputController.text = "5";
                            controller.itemQtyInputController.text = "1";
                          },
                          child: Container(
                            height: 120,
                            decoration: BoxDecoration(
                                color: AppColors.kSecondaryColor,
                                border: Border.all(
                                    color: const Color(0xFF3d87aa), width: 1.5),
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.black,
                                    radius: 40,
                                  ),
                                ),
                                const Text("joulax"),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [Text("  0"), Text("30  ")],
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 120,
                          decoration: BoxDecoration(
                              color: AppColors.kSecondaryColor,
                              border: Border.all(
                                  color: const Color(0xFF3d87aa), width: 1.5),
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 40,
                                ),
                              ),
                              const Text("joulax"),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [Text("  0"), Text("30  ")],
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 120,
                          decoration: BoxDecoration(
                              color: AppColors.kSecondaryColor,
                              border: Border.all(
                                  color: const Color(0xFF3d87aa), width: 1.5),
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 40,
                                ),
                              ),
                              const Text("joulax"),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [Text("  0"), Text("30  ")],
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 120,
                          decoration: BoxDecoration(
                              color: AppColors.kSecondaryColor,
                              border: Border.all(
                                  color: const Color(0xFF3d87aa), width: 1.5),
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 40,
                                ),
                              ),
                              const Text("joulax"),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [Text("  0"), Text("30  ")],
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 120,
                          decoration: BoxDecoration(
                              color: AppColors.kSecondaryColor,
                              border: Border.all(
                                  color: const Color(0xFF3d87aa), width: 1.5),
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 40,
                                ),
                              ),
                              const Text("joulax"),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [Text("  0"), Text("30  ")],
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 120,
                          decoration: BoxDecoration(
                              color: AppColors.kSecondaryColor,
                              border: Border.all(
                                  color: const Color(0xFF3d87aa), width: 1.5),
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 40,
                                ),
                              ),
                              const Text("joulax"),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [Text("  0"), Text("30  ")],
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 120,
                          decoration: BoxDecoration(
                              color: AppColors.kSecondaryColor,
                              border: Border.all(
                                  color: const Color(0xFF3d87aa), width: 1.5),
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 40,
                                ),
                              ),
                              const Text("joulax"),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [Text("  0"), Text("30  ")],
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 120,
                          decoration: BoxDecoration(
                              color: AppColors.kSecondaryColor,
                              border: Border.all(
                                  color: const Color(0xFF3d87aa), width: 1.5),
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 40,
                                ),
                              ),
                              const Text("joulax"),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [Text("  0"), Text("30  ")],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                  /* Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               
              ],
            )*/
                  )),
                 
        ],
      ),
      floatingActionButton: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 18),
        child: ElevatedButton(
          child: const Text("اضافة"),
          onPressed: () {
            bool isValid = controller.validate();

            if (isValid) {
              Get.close(1);
            }
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
