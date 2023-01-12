import 'package:flutter/material.dart';

class container_invoices_detail extends StatelessWidget {
  container_invoices_detail(
      {Key? key,
      required this.size,
      required this.icon,
      required this.title,
      required this.height,required this.ontap})
      : super(key: key);
 final Function() ontap;
  final Size size;
  IconData icon;
  String title;
  double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: 10),
        height: height,
        width: size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black12, width: 0.5),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 1, color: Colors.black12, offset: Offset(1, 2))
            ]),
        child: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Icon(
              icon,
              color: const Color(0xFF3d87aa),
            ),
            const SizedBox(
              width: 12,
            ),
            Container(
                width: size.width - 80,
                child: Text(
                  title,
                  maxLines: 2,
                  style: const TextStyle(
                      color: Color(0xFF3d87aa),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}

class container_invoice extends StatelessWidget {
  container_invoice(
      {Key? key,
      required this.size,
      required this.icon,
      required this.title,
      required this.ontap})
      : super(key: key);

  final Size size;
  IconData icon;
  String title;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 90,
        width: (size.width - 30) / 2,
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF3d87aa), width: 1.5),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              color: const Color(0xFF3d87aa),
            ),
            Text(
              title,
              style: const TextStyle(
                  color: Color(0xFF3d87aa),
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
