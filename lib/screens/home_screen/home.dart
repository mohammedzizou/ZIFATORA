import 'package:flutter/material.dart';

import 'Accounts/Accounts_screen.dart';
import 'Reports/reports_screen.dart';
import 'Settings/settings_screen.dart';
import 'invoice/invoice_screen.dart';


class home_1 extends StatefulWidget {
  home_1({Key? key}) : super(key: key);

  @override
  State<home_1> createState() => _home_1State();
}

class _home_1State extends State<home_1> with SingleTickerProviderStateMixin {
   int currentTab = 0;
  final List<Widget> pages = [ invoice(),accounts(), reports(),settings()];
  Widget currentScreen =  invoice();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentTab],
      bottomNavigationBar: BottomNavigationBar(
        
        currentIndex: currentTab,
        iconSize: 30,
        selectedFontSize: 13,
        unselectedFontSize: 12,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
        selectedItemColor:  const Color(0xFF3d87aa),
        unselectedItemColor: Colors.black,
        selectedIconTheme:const IconThemeData(color:  Color(0xFF3d87aa)) ,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_balance,
                
              ),

              label: "Invoice",
              ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                
              ),

              label: "Accounts",
              ),
             
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_balance_wallet,
               
              ),
              label: "Reports",
             ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
                
              ),
              label: "Settings",
              )
        ],
        onTap: (index){
          setState(() {
             currentTab = index;
          });
         
        },
      ),
    );
  }
}
