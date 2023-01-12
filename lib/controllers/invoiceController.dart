import 'package:flutter/material.dart';
import 'package:get/get.dart';

class invoiceController extends GetxController {
  TimeOfDay time = new TimeOfDay.now();
  DateTime date = new DateTime.now();
  TimeOfDay? time1;
  DateTime? date1;

  String balance = "Cash";
 String tax1 ="B2C";
  TextEditingController controller_text1 = new TextEditingController();
   TextEditingController noteController = new TextEditingController();
   TextEditingController CustomerController = new TextEditingController();
   TextEditingController RetailController = new TextEditingController();
   TextEditingController amountController = new TextEditingController();
    
  bool Tax = false;
  bool VAT_Included = false;

  void time_day(context) async {
    time1 = await showTimePicker(context: context, initialTime: time);
    if (time1 == null) return;
    time = time1!;
    update();
  }

  void time_date(context) async {
    date1 = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date1 == null) return;

    date = date1!;
    update();
  }

  void raio_cash_nCredit(int nRadio, Object value) {
    if (nRadio == 1) {
      balance = value.toString();
    } else {
      balance = value.toString();
    }
    update();
  }
  void raio_B2C(int nRadio, Object value) {
    if (nRadio == 1) {
      tax1 = value.toString();
    } else {
      tax1 = value.toString();
    }
    update();
  }
 
bool tax_color (){
  if (tax1=="B2C_C") {
    return false;
  } else {
    return true;
  }
  
}
  void switch_VAT(bool value1) {
    VAT_Included = value1;
    update();
  }

  void switch_Tax(bool value2) {
    Tax = value2;
    update();
  }

  Widget tax_widget(int Value) {
    if (Tax == true) {
      if (Value == 1) {
        return Column(
          children: [
            radio_Select_tax()
           
          ],
        );
      } else {
        return Row(
          children: [
            const Text(
              "VAT Included",
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
                    value: VAT_Included,
                    onChanged: (Value1) {
                      switch_VAT(Value1);
                    }))
          ],
        );
      }
    }
    return const SizedBox();
  }

  Widget radio_Select_tax() {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 8),
      child: Column(
        children: [
          Container( height: 35,
                    decoration: BoxDecoration(
                      color:tax_color()?Color(0xFF3d87aa): Colors.transparent,
                      border: Border.all(color: Color(0xFF3d87aa), width: 1.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
            child: Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                 Text(
                  "Tax gate from B2C client company",
                  style: TextStyle(
                      color:tax_color()? Colors.black :Color(0xFF3d87aa),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Radio(
                  focusColor: Color(0xFF3d87aa),
                  value: "B2C",
                  groupValue: tax1,
                  onChanged: (value) {
                     raio_B2C(1,value!);
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
            Container(  
                    
                    height: 35,
                    decoration: BoxDecoration(
                      color:tax_color()?Colors.transparent:Color(0xFF3d87aa) ,
                      border: Border.all(color: Color(0xFF3d87aa), width: 1.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                        child: Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                 Text(
                  "B2C company to company tax gate",
                  style: TextStyle(
                      color:tax_color()?const Color(0xFF3d87aa): Colors.black ,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Radio(
                  focusColor: const Color(0xFF3d87aa),
                  value: "B2C_C",
                  groupValue: tax1,
                  onChanged: (value) {
                    raio_B2C(2,value!);
                  },
                ),
              ],
            ),)
          
        ],
      ),
    );
  }
Widget on_Credit(Size size){
  if (balance=="on credit") {
    return  Container(
                width: (size.width - 23),
                height: 40,
                padding: EdgeInsets.only(left: 120),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border:
                      Border.all(color: const Color(0xFF3d87aa), width: 1.5),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                  child: TextField(
                    keyboardType:TextInputType.number ,
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                      decoration: InputDecoration.collapsed(
                        hintText: "    Cash payment",
                      )),
                ));
  } else {
    return SizedBox();
  }
  
}




}
