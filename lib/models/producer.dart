class modalProducer {
  int? id;
  String? nameP;
  int? qty;
  double? price;
  modalProducer({this.id, this.nameP, this.price, this.qty});
  modalProducer.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        nameP = res['namep'],
        price = res['price'],
        qty = res['qty'];
        Map<String,Object?>toMap(){
          return{
          "id" :id,
          "namep":nameP,
          "price":price,
          "qty":qty
          };
        }
}
