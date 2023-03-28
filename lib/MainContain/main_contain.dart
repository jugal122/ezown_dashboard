
import 'package:ezown_dashboard/General/constants.dart';
import 'package:ezown_dashboard/MainContain/Components/side_menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../DashBoard/dash_board_screen.dart';
import '../General/responsive.dart';
import 'Components/side_menu.dart';


class MainContain extends StatefulWidget {
  const MainContain({Key? key}) : super(key: key);

  @override
  State<MainContain> createState() => _MainContainState();
}

class _MainContainState extends State<MainContain> {

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
    return  Scaffold(
      key: _scaffoldKey,
      drawer:  drawer(),
      //appBar:
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: drawer(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: Column(
                children: [
                  Header(),
                  context.watch<SideMenuProvider>().currentScreen,
                ],
              ),
            ),
          ],
        ),
      ),
    );




  }

  Widget drawer(){
    final Size _size = MediaQuery.of(context).size;
    return  Drawer(
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
          DrawerListTile(
            isSelect: isOrderSelected?true:false,
            title: "Orders",
            svgSrc: "assets/svg_icons/shopping-bag(1).svg",
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
              // Provider.of<SideMenuProvider>(context, listen: false)
              //     .changeCurrentScreen(CustomScreensEnum.orderScreen);
            },
          ),
          isOrderSelected ?orderSubList(context):Container(),
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
          isSupplierSelected ?supplierSubList(context):Container(),
          DrawerListTile(
            isSelect: isShopKeeperSelected?true:false,
            title: "ShopKeeper",
            svgSrc: "assets/svg_icons/shop.svg",
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
          isShopKeeperSelected ?shopKeeperSubList(context):Container(),
          DrawerListTile(
            isSelect: isCustomerSelected?true:false,
            title: "Customer",
            svgSrc: "assets/svg_icons/users.svg",
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
            svgSrc: "assets/svg_icons/support(2).svg",
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
            svgSrc: "assets/svg_icons/language.svg",
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
            svgSrc: "assets/svg_icons/report.svg",
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

  Widget orderSubList(context){
    final Size _size = MediaQuery.of(context).size;
    return  Row(
      children: [
        SizedBox(width: _size.height*0.05,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: _size.height*0.02,),
            InkWell(
              onTap: (){
                Provider.of<SideMenuProvider>(context, listen: false)
                    .changeCurrentScreen(CustomScreensEnum.allOrderScreen);
              },
              child: Row(
                children: [
                  SizedBox(width: _size.height*0.007,),
                  SvgPicture.asset(
                    "assets/svg_icons/shopping-bag(1).svg",
                    color: Colors.white,
                    height: _size.height*0.027,),
                  SizedBox(width: _size.height*0.01,),
                  Text(
                    "All ",
                    style: TextStyle(color: isOrderSelected?Colors.white:Colors.white60,fontSize: _size.height*0.02),
                  ),
                ],
              ),
            ),
            SizedBox(height: _size.height*0.02,),
            InkWell(
              onTap: (){

                Provider.of<SideMenuProvider>(context, listen: false)
                    .changeCurrentScreen(CustomScreensEnum.pendingOrderScreen);
              },
              child: Row(
                children: [
                  SizedBox(width: _size.height*0.01,),
                  SvgPicture.asset(
                    "assets/svg_icons/pending.svg",
                    color: Colors.white,
                    height: _size.height*0.025,),
                  SizedBox(width: _size.height*0.01,),
                  Text(
                    "Pending ",
                    style: TextStyle(color: isOrderSelected?Colors.white:Colors.white60,fontSize: _size.height*0.02),
                  ),
                ],
              ),
            ),
            SizedBox(height: _size.height*0.015,),
            InkWell(
              onTap: (){
                Provider.of<SideMenuProvider>(context, listen: false)
                    .changeCurrentScreen(CustomScreensEnum.deliveredOrderScreen);
              },
              child: Row(
                children: [
                  SizedBox(width: _size.height*0.01,),
                  SvgPicture.asset(
                    "assets/svg_icons/delivery(1).svg",
                    color: Colors.white,
                    height: _size.height*0.025,),
                  SizedBox(width: _size.height*0.01,),
                  Text(
                    "Delivered",
                    style: TextStyle(color: isOrderSelected?Colors.white:Colors.white60,fontSize: _size.height*0.02),
                  ),
                ],
              ),
            ),

          ],
        ),
      ],
    );
  }
  Widget supplierSubList(context){
    final Size _size = MediaQuery.of(context).size;
    return  Row(
      children: [
        SizedBox(width: _size.height*0.05,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: _size.height*0.02,),
            InkWell(
              onTap: (){

                Provider.of<SideMenuProvider>(context, listen: false)
                    .changeCurrentScreen(CustomScreensEnum.verifiedSupplierScreen);
              },
              child: Row(
                children: [
                  SizedBox(width: _size.height*0.01,),
                  SvgPicture.asset(
                    "assets/svg_icons/verified.svg",
                    color: Colors.white,
                    height: _size.height*0.025,),
                  SizedBox(width: _size.height*0.01,),
                  Text(
                    "Verified ",
                    style: TextStyle(color: isSupplierSelected?Colors.white:Colors.white60,fontSize: _size.height*0.02),
                  ),
                ],
              ),
            ),
            SizedBox(height: _size.height*0.02,),
            InkWell(
              onTap: (){

                Provider.of<SideMenuProvider>(context, listen: false)
                    .changeCurrentScreen(CustomScreensEnum.notVerifiedSupplierScreen);
              },
              child: Row(
                children: [
                  SizedBox(width: _size.height*0.01,),
                  SvgPicture.asset(
                    "assets/svg_icons/not_verified.svg",
                    color: Colors.white,
                    height: _size.height*0.025,),
                  SizedBox(width: _size.height*0.01,),
                  Text(
                    "Not Verified ",
                    style: TextStyle(color: isSupplierSelected?Colors.white:Colors.white60,fontSize: _size.height*0.02),
                  ),
                ],
              ),
            ),
            SizedBox(height: _size.height*0.02,),
            InkWell(
              onTap: (){
                Provider.of<SideMenuProvider>(context, listen: false)
                    .changeCurrentScreen(CustomScreensEnum.requestSupplierScreen);
              },
              child: Row(
                children: [
                  SizedBox(width: _size.height*0.01,),
                  SvgPicture.asset(
                    "assets/svg_icons/request.svg",
                    color: Colors.white,
                    height: _size.height*0.025,),
                  SizedBox(width: _size.height*0.01,),
                  Text(
                    "Requested",
                    style: TextStyle(color: isSupplierSelected?Colors.white:Colors.white60,fontSize: _size.height*0.02),
                  ),
                ],
              ),
            ),

          ],
        ),
      ],
    );
  }

  Widget shopKeeperSubList(context){
    final Size _size = MediaQuery.of(context).size;
    return  Row(
      children: [
        SizedBox(width: _size.height*0.05,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: _size.height*0.02,),
            InkWell(
              onTap: (){

                Provider.of<SideMenuProvider>(context, listen: false)
                    .changeCurrentScreen(CustomScreensEnum.verifiedShopSkipperScreen);
              },
              child: Row(
                children: [
                  SizedBox(width: _size.height*0.01,),
                  SvgPicture.asset(
                    "assets/svg_icons/verified.svg",
                    color: Colors.white,
                    height: _size.height*0.025,),
                  SizedBox(width: _size.height*0.01,),
                  Text(
                    "Verified ",
                    style: TextStyle(color: isSupplierSelected?Colors.white:Colors.white60,fontSize: _size.height*0.02),
                  ),
                ],
              ),
            ),
            SizedBox(height: _size.height*0.02,),
            InkWell(
              onTap: (){

                Provider.of<SideMenuProvider>(context, listen: false)
                    .changeCurrentScreen(CustomScreensEnum.notVerifiedShopSkipperScreen);
              },
              child: Row(
                children: [
                  SizedBox(width: _size.height*0.01,),
                  SvgPicture.asset(
                    "assets/svg_icons/not_verified.svg",
                    color: Colors.white,
                    height: _size.height*0.025,),
                  SizedBox(width: _size.height*0.01,),
                  Text(
                    "Not Verified ",
                    style: TextStyle(color: isSupplierSelected?Colors.white:Colors.white60,fontSize: _size.height*0.02),
                  ),
                ],
              ),
            ),
            SizedBox(height: _size.height*0.02,),
            InkWell(
              onTap: (){
                Provider.of<SideMenuProvider>(context, listen: false)
                    .changeCurrentScreen(CustomScreensEnum.requestShopSkipperScreen);
              },
              child: Row(
                children: [
                  SizedBox(width: _size.height*0.01,),
                  SvgPicture.asset(
                    "assets/svg_icons/request.svg",
                    color: Colors.white,
                    height: _size.height*0.025,),
                  SizedBox(width: _size.height*0.01,),
                  Text(
                    "Requested",
                    style: TextStyle(color: isSupplierSelected?Colors.white:Colors.white60,fontSize: _size.height*0.02),
                  ),
                ],
              ),
            ),

          ],
        ),
      ],
    );
  }



  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
   Header(){
    return  Padding(
      padding:   EdgeInsets.symmetric(horizontal: defaultPadding,vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (!Responsive.isDesktop(context))
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed:(){
                if (!_scaffoldKey.currentState!.isDrawerOpen) {
                  _scaffoldKey.currentState!.openDrawer();
                }
              },
            ),
         // if (!Responsive.isMobile(context))
            Text(
              "Dashboard",
              style: Theme.of(context).textTheme.headline6,
            ),
        //  if (!Responsive.isMobile(context))
            Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),

          Container(
            margin: const EdgeInsets.only(left: defaultPadding),
            padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding/2,
              vertical: defaultPadding / 2,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Colors.black45),
            ),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/profile_pic.png",
                  height: 25,
                ),
                if (!Responsive.isMobile(context))
                  const Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                    child: Text("Deb Sarkar"),
                  ),
                const Icon(Icons.keyboard_arrow_down),
              ],
            ),
          )
        ],
      ),
    );
  }
}


class DrawerListTile extends StatelessWidget {
   DrawerListTile({
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


  bool isSubSelected = false;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))),
      selectedTileColor: Colors.white60,
      selected: isSelect,
      onTap: press,

      horizontalTitleGap: 0.0,
       dense: true,
      contentPadding: EdgeInsets.zero,
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: double.infinity,
            color: isSelect? Colors.blue:Colors.transparent,
            width: _size.height*0.005,
          ),
          SizedBox(width: _size.height*0.01,),
          SvgPicture.asset(
            svgSrc,
             color: isSelect?Colors.white:Colors.white60,
            height: _size.height*0.03,
          ),
          SizedBox(width: _size.height*0.02,),
        ],
      ),
      title: Text(
        title,
        style: TextStyle(color: isSelect?Colors.white:Colors.white60,fontSize: _size.height*0.02),
      ),
      // subtitle: (title.toLowerCase()=='orders' && isSelect) ?
      // orderSubList(context)
      //     : (title.toLowerCase()=='supplier' && isSelect)
      //     ? supplierSubList(context):null,
    );
  }




}

