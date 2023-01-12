import 'package:fatura_app/controllers/invoice_controller.dart';
import 'package:fatura_app/controllers/items_controller.dart';
import 'package:get/get.dart';

class NewInvoiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut( () => InvoiceController(),);
    Get.put(ItemsController(), permanent: true);
  }
}
