import 'package:ezown_dashboard/DashBoard/dash_board_screen.dart';
import 'package:ezown_dashboard/Order/delivered_order_screen.dart';
import 'package:ezown_dashboard/Order/order_screen.dart';
import 'package:ezown_dashboard/Order/pending_order_screen.dart';
import 'package:ezown_dashboard/ShopKeeper/verified_shopkeeper.dart';
import 'package:ezown_dashboard/Supplier/not_verified_supplier_screen.dart';
import 'package:ezown_dashboard/Supplier/request_supplier_screen.dart';
import 'package:ezown_dashboard/Supplier/verified_supplier_screen.dart';
import 'package:flutter/material.dart';

class SideMenuProvider extends ChangeNotifier {
  late Widget _currentScreen = const DashBoardScreen();
  Widget get currentScreen => _currentScreen;
  set currentScreen(Widget newScreen) {
    _currentScreen = newScreen;
    notifyListeners();
  }

  void changeCurrentScreen(CustomScreensEnum screen){
    switch(screen){
      case CustomScreensEnum.dashboardScreen:
        currentScreen = const DashBoardScreen();
        break;
      case CustomScreensEnum.allOrderScreen:
        currentScreen = const OrderScreen();
        break;
      case CustomScreensEnum.pendingOrderScreen:
        currentScreen = const PendingOrderScreen();
        break;
      case CustomScreensEnum.deliveredOrderScreen:
        currentScreen = const DeliveredOrderScreen();
        break;
      case CustomScreensEnum.verifiedSupplierScreen:
        currentScreen = const VerifiedSupplierScreen();
        break;
      case CustomScreensEnum.notVerifiedSupplierScreen:
        currentScreen = const NotVerifiedSupplierScreen();
        break;
      case CustomScreensEnum.requestSupplierScreen:
        currentScreen = const RequestSupplierScreen();
        break;
      case CustomScreensEnum.verifiedShopSkipperScreen:
        currentScreen = const VerifiedShopKeeper();
        break;
      case CustomScreensEnum.notVerifiedShopSkipperScreen:
        currentScreen = const RequestSupplierScreen();
        break;
        case CustomScreensEnum.requestShopSkipperScreen:
      currentScreen = const RequestSupplierScreen();
      break;

      default:
        currentScreen = const DashBoardScreen();
        break;
    }
  }
}

enum CustomScreensEnum {
  dashboardScreen,
  allOrderScreen,
  pendingOrderScreen,
  deliveredOrderScreen,
  verifiedSupplierScreen,
  notVerifiedSupplierScreen,
  requestSupplierScreen,
  verifiedShopSkipperScreen,
  notVerifiedShopSkipperScreen,
  requestShopSkipperScreen,
}