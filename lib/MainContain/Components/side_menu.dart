import 'package:ezown_dashboard/General/constants.dart';
import 'package:ezown_dashboard/MainContain/Components/side_menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';


class SideMenu extends StatelessWidget {
   SideMenu({Key? key}) : super(key: key);
  bool isDashboardSelected = true;
  bool isOrderSelected = false;
  bool isSupplierSelected = false;
  bool isShopKeeperSelected = false;
  bool isCustomerSelected = false;
  bool isExecutiveSelected = false;
  bool isLanguageSelected = false;
  bool isReportSelected = false;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return StatefulBuilder(
      builder: (context, setState) {
        return Drawer(
          backgroundColor: Color(0xff3d414a),
          child: ListView(
            children: [
              Container(
                height: _size.height*0.1,
                padding: EdgeInsets.symmetric(horizontal: _size.width*0.04,vertical: _size.height*0.01),
                child: Image.asset("assets/images/ezowmLogo.png",fit: BoxFit.contain),
              ),
              DrawerListTile(
                isSelect: isDashboardSelected?true:false,
                title: "Dashboard",
                svgSrc: "assets/svg_icons/menu_dashbord.svg",
                press: () {

                 Provider.of<SideMenuProvider>(context, listen: false)
                     .changeCurrentScreen(CustomScreensEnum.dashboardScreen);
                 setState((){
                   isDashboardSelected =true;
                   isOrderSelected = false;
                   isSupplierSelected = false;
                   isShopKeeperSelected = false;
                   isCustomerSelected = false;
                   isExecutiveSelected = false;
                   isLanguageSelected = false;
                   isReportSelected = false;
                 });
                },
              ),
              // ListTile(
              //   dense: true,
              //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              //   selectedTileColor: Colors.white60,
              //   onTap: (){
              //     // setState((){
              //     //   isDashboardSelected =false;
              //     //   isOrderSelected = true;
              //     //   isSupplierSelected = false;
              //     //   isShopKeeperSelected = false;
              //     //   isCustomerSelected = false;
              //     //   isExecutiveSelected = false;
              //     //   isLanguageSelected = false;
              //     //   isReportSelected = false;
              //     // });
              //     Provider.of<SideMenuProvider>(context, listen: false)
              //         .changeCurrentScreen(CustomScreensEnum.orderScreen);
              //   },
              //   horizontalTitleGap: 0.0,
              //   leading: SvgPicture.asset(
              //     "assets/svg_icons/order1.svg",
              //     // color: isSelect?Colors.white:Colors.white60,
              //     height: _size.height*0.03,
              //   ),
              //   title: Text(
              //     "Orders",
              //     style: TextStyle(color: isOrderSelected?Colors.white:Colors.white60),
              //   ),
              //   subtitle:  Column(
              //     children: [
              //     InkWell(
              //       onTap: (){
              //         Provider.of<SideMenuProvider>(context, listen: false)
              //             .changeCurrentScreen(CustomScreensEnum.orderScreen);
              //       },
              //       child: Row(
              //         children: [
              //           SvgPicture.asset(
              //           "assets/svg_icons/order1.svg",
              //           // color: isSelect?Colors.white:Colors.white60,
              //           height: _size.height*0.03,),
              //           Text(
              //             "All ",
              //             style: TextStyle(color: isOrderSelected?Colors.white:Colors.white60),
              //           ),
              //         ],
              //       ),
              //     ),
              //     Row(
              //       children: [
              //         SvgPicture.asset(
              //         "assets/svg_icons/order1.svg",
              //         // color: isSelect?Colors.white:Colors.white60,
              //         height: _size.height*0.03,),
              //         Text(
              //           "Pending ",
              //           style: TextStyle(color: isOrderSelected?Colors.white:Colors.white60),
              //         ),
              //       ],
              //     ),
              //     Row(
              //       children: [
              //         SvgPicture.asset(
              //         "assets/svg_icons/order1.svg",
              //         // color: isSelect?Colors.white:Colors.white60,
              //         height: _size.height*0.03,),
              //         Text(
              //           "Delivered",
              //           style: TextStyle(color: isOrderSelected?Colors.white:Colors.white60),
              //         ),
              //       ],
              //     ),
              //
              //     ],
              //   ),
              // ),

              DrawerListTile(
                isSelect: isOrderSelected?true:false,
                title: "Orders",
                svgSrc: "assets/svg_icons/order.svg",
                press: () {
                  setState((){
                    isDashboardSelected =false;
                    isOrderSelected = true;
                    isSupplierSelected = false;
                    isShopKeeperSelected = false;
                    isCustomerSelected = false;
                    isExecutiveSelected = false;
                    isLanguageSelected = false;
                    isReportSelected = false;
                  });
                  Provider.of<SideMenuProvider>(context, listen: false)
                      .changeCurrentScreen(CustomScreensEnum.allOrderScreen);
                },
              ),
              DrawerListTile(
                isSelect: isSupplierSelected?true:false,
                title: "Supplier",
                svgSrc: "assets/svg_icons/supplier.svg",
                press: () {
                  setState((){
                    isDashboardSelected =false;
                    isOrderSelected = false;
                    isSupplierSelected = true;
                    isShopKeeperSelected = false;
                    isCustomerSelected = false;
                    isExecutiveSelected = false;
                    isLanguageSelected = false;
                    isReportSelected = false;
                  });
                },
              ),
              DrawerListTile(
                isSelect: isShopKeeperSelected?true:false,
                title: "ShopKeeper",
                svgSrc: "assets/svg_icons/shops.svg",
                press: () {
                  setState((){
                    isDashboardSelected =false;
                    isOrderSelected = false;
                    isSupplierSelected = false;
                    isShopKeeperSelected = true;
                    isCustomerSelected = false;
                    isExecutiveSelected = false;
                    isLanguageSelected = false;
                    isReportSelected = false;
                  });
                },
              ),
              DrawerListTile(
                isSelect: isCustomerSelected?true:false,
                title: "Customer",
                svgSrc: "assets/svg_icons/user.svg",
                press: () {
                  setState((){
                    isDashboardSelected =false;
                    isOrderSelected = false;
                    isSupplierSelected = false;
                    isShopKeeperSelected = false;
                    isCustomerSelected = true;
                    isExecutiveSelected = false;
                    isLanguageSelected = false;
                    isReportSelected = false;
                  });
                },
              ),
              DrawerListTile(
                isSelect: isExecutiveSelected?true:false,
                title: "Executive",
                svgSrc: "assets/svg_icons/support.svg",
                press: () {
                  setState((){
                    isDashboardSelected =false;
                    isOrderSelected = false;
                    isSupplierSelected = false;
                    isShopKeeperSelected = false;
                    isCustomerSelected = false;
                    isExecutiveSelected = true;
                    isLanguageSelected = false;
                    isReportSelected = false;
                  });
                },
              ),
              DrawerListTile(
                isSelect: isLanguageSelected?true:false,
                title: "Language",
                svgSrc: "assets/svg_icons/support.svg",
                press: () {
                  setState((){
                    isDashboardSelected =false;
                    isOrderSelected = false;
                    isSupplierSelected = false;
                    isShopKeeperSelected = false;
                    isCustomerSelected = false;
                    isExecutiveSelected = false;
                    isLanguageSelected = true;
                    isReportSelected = false;
                  });
                },
              ),
              DrawerListTile(
                isSelect: isReportSelected?true:false,
                title: "Report",
                svgSrc: "assets/svg_icons/support.svg",
                press: () {
                  setState((){
                    isDashboardSelected =false;
                    isOrderSelected = false;
                    isSupplierSelected = false;
                    isShopKeeperSelected = false;
                    isCustomerSelected = false;
                    isExecutiveSelected = false;
                    isLanguageSelected = false;
                    isReportSelected = true;
                  });
                },
              ),




            ],
          ),
        );
      }
    );
  }

}




class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
    required this.isSelect,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;
  final bool isSelect;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      selectedTileColor: Colors.white60,
      selected: isSelect,
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
       // color: isSelect?Colors.white:Colors.white60,
        height: _size.height*0.03,
      ),
      title: Text(
        title,
        style: TextStyle(color: isSelect?Colors.white:Colors.white60),
      ),
    );
  }
}
