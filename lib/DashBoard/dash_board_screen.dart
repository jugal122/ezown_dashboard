
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../General/constants.dart';
import '../General/responsive.dart';
import '../MainContain/Components/side_menu_provider.dart';


class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Expanded(
      child: ListView(
        children: [
          const SizedBox(height: defaultPadding/2),
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding*1.5),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image:AssetImage('assets/images/top_bg.jpg'),
                      fit: BoxFit.fill
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: defaultPadding),
                    TextField(
                       style:  TextStyle(color: Colors.white70,fontSize:_size.height*0.025 ),
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(color: Colors.white70,fontSize:_size.height*0.025 ),
                        fillColor: Colors.transparent,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1.0),
                        ),
                        suffixIcon: InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(defaultPadding * 0.75),
                            margin: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            child: SvgPicture.asset("assets/svg_icons/Search.svg",color: Colors.white,),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*0.2),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
                    padding: const EdgeInsets.symmetric(horizontal: defaultPadding*1.5),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xfff3f3f3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:   Column(
                      children: [

                        const SizedBox(height: defaultPadding),
                       // const Divider(thickness: 1.5,),
                        InfoCard(),

                        const SizedBox(height: defaultPadding),

                      ],
                    ),
                  ),
                  const SizedBox(height: defaultPadding),
                  if (!Responsive.isMobile(context))
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
                          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xfff3f3f3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:   Column(
                            children:  [

                              const SizedBox(height: defaultPadding),
                              lastTenOrderList(),
                              const SizedBox(height: defaultPadding),

                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
                          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xfff3f3f3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:   Column(
                            children:  [

                              const SizedBox(height: defaultPadding),
                              last7DayChart(),
                              const SizedBox(height: defaultPadding),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (Responsive.isMobile(context))
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
                        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xfff3f3f3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:   Column(
                          children:  [

                            const SizedBox(height: defaultPadding),
                            lastTenOrderList(),
                            const SizedBox(height: defaultPadding),

                          ],
                        ),
                      ),
                      const SizedBox(height: defaultPadding,),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
                        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xfff3f3f3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:   Column(
                          children:  [

                            const SizedBox(height: defaultPadding),
                            last7DayChart(),
                            const SizedBox(height: defaultPadding),

                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),

    );
  }


  var customerList = [
    'Deb Sarkar',
    'Deb Sarkar',
    'Deb Sarkar',
    'Deb Sarkar',
    'Deb Sarkar',
    'Deb Sarkar',
    'Deb Sarkar',
    'Deb Sarkar',
    'Deb Sarkar',
    'Deb Sarkar',

  ];
  var dateList = [
    '25-03-2023',
    '25-03-2023',
    '25-03-2023',
    '19-03-2023',
    '19-03-2023',
    '19-03-2023',
    '18-03-2023',
    '17-03-2023',
    '17-03-2023',
    '17-03-2023',

  ];
  var priceList = [
    '2550.00',
    '2000.00',
    '350.00',
    '15200.00',
    '3500.00',
    '250.00',
    '6500.00',
    '10000.00',
    '860.00',
    '980.00',

  ];
  var statusList = [
    '1',
    '2',
    '3',
    '4',
    '3',
    '2',
    '1',
    '4',
    '2',
    '3',
  ];
  var productList = [
    "Purina Dog Chow-Small Dog-16.5LB Bag",
  "LexMod Earl Fabric Sofa in Blue",
  "Cole Haan Men's Caldwell Cap Toe Oxford Dress Shoes",
  "Neutrogena Light Therapy Acne Treatment Mask",
  "LexMod Earl Fabric Sofa in Blue",
  "Cole Haan Men's Caldwell Cap Toe Oxford Dress Shoes",
  "Neutrogena Light Therapy Acne Treatment Mask",
  "LexMod Earl Fabric Sofa in Blue",
  "Purina Dog Chow-Small Dog-16.5LB Bag",
  "Cole Haan Men's Caldwell Cap Toe Oxford Dress Shoes",
  ];



  Widget lastTenOrderList(){
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            Text('Last 10 Orders ',style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w600,color: Colors.black))
          ],
        ),
        const SizedBox(height: defaultPadding/2,),
        Container(
          height: _size.height*0.05,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color(0xff3d414a),
          ),
          child: Row(
            children:  [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text('Customer',style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w500,color: Colors.white),),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(child: Text('Date',style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w500,color: Colors.white),)),
              ),
              Expanded(
                flex: 1,
                child: Center(child: Text('Price',style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w500,color: Colors.white),)),
              ),
              Expanded(
                flex: 2,
                child: Text('Product',style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w500,color: Colors.white),),
              ),
              Expanded(
                flex: 1,
                child: Center(child: Text('Status',style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w500,color: Colors.white),)),
              ),
            ],
          ),
        ),
        ListView.builder(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: customerList.length,
            itemBuilder: (context, index){
              return Container(
               padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: index%2==0 ?Colors.white:Colors.transparent,
                ),
                child: Row(
                  children:  [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Row(
                          children: [
                            Container(
                              height: _size.height*0.035,
                              width: _size.height*0.035,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                "assets/images/profile_pic.png",
                             fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(width: 5,),
                            Flexible(child: Text(customerList[index],style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w500,color: Colors.black),)),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(child: Text(dateList[index],style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w500,color: Colors.black),)),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(child: Text(priceList[index],style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w500,color: Colors.black),)),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(productList[index],style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w500,color: Colors.black),),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color:  statusList[index]=='1'?Colors.black.withOpacity(0.3)
                                :statusList[index]=='2'?Colors.blue.withOpacity(0.3)
                                :statusList[index]=='3'?Colors.green.withOpacity(0.3)
                                :Colors.red.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color:  statusList[index]=='1'?Colors.black
                                :statusList[index]=='2'?Colors.blue
                                :statusList[index]=='3'?Colors.green
                                :Colors.red)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Center(
                                child: Text(statusList[index]=='1'?'Confirmed'
                                    :statusList[index]=='2'?'Shipped'
                                    :statusList[index]=='3'?'Delivered'
                                    :'Cancel',style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w500,
                                    color:
                                    statusList[index]=='1'?Colors.black
                                        :statusList[index]=='2'?Colors.blue
                                        :statusList[index]=='3'?Colors.green
                                        :Colors.red

                                ),),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
        )

      ],
    );
  }

  late List<ExpenseData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }


  Widget last7DayChart(){
    return  Container(
      child: SfCartesianChart(
        title: ChartTitle(
            text: 'Last 7 days order status'),
        legend: Legend(isVisible: true),
        tooltipBehavior: _tooltipBehavior,
        series: <ChartSeries>[
          StackedColumnSeries<ExpenseData, String>(
              dataSource: _chartData,
              xValueMapper: (ExpenseData exp, _) => exp.expenseCategory,
              yValueMapper: (ExpenseData exp, _) => exp.confirmed,
              name: 'Confirmed',
              markerSettings: const MarkerSettings(
                isVisible: true,
              )),
          StackedColumnSeries<ExpenseData, String>(
              dataSource: _chartData,
              xValueMapper: (ExpenseData exp, _) => exp.expenseCategory,
              yValueMapper: (ExpenseData exp, _) => exp.shipped,
              name: 'Shipped',
              markerSettings: const MarkerSettings(
                isVisible: true,
              )),
          StackedColumnSeries<ExpenseData, String>(
              dataSource: _chartData,
              xValueMapper: (ExpenseData exp, _) => exp.expenseCategory,
              yValueMapper: (ExpenseData exp, _) => exp.cancel,
              name: 'Canceled',
              markerSettings: const MarkerSettings(
                isVisible: true,
              )),
          StackedColumnSeries<ExpenseData, String>(
              dataSource: _chartData,
              xValueMapper: (ExpenseData exp, _) => exp.expenseCategory,
              yValueMapper: (ExpenseData exp, _) => exp.delivered,
              name: 'Delivered',
              markerSettings: const MarkerSettings(
                isVisible: true,
              )),
        ],
        primaryXAxis: CategoryAxis(),
      ),
    );
  }



  Widget InfoCard(){
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Responsive(
          mobile: cardGridView(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 && _size.width > 350 ? 2 : 1.6,
          ),
          tablet: cardGridView(childAspectRatio: 2, crossAxisCount: 4),
          desktop: cardGridView(
            childAspectRatio: _size.width < 1400 ? 1.8 : 2.2, crossAxisCount: 4,
          ),
        ),
      ],
    );
  }


  var category= [
    'Orders',
    'Supplier',
    'ShopKeeper',
    'Customer',
  ];


  Widget cardGridView({required double childAspectRatio, required int crossAxisCount}){
    final Size _size = MediaQuery.of(context).size;
    return  MasonryGridView.count(
      crossAxisCount: crossAxisCount,
      physics:const NeverScrollableScrollPhysics(),
      mainAxisSpacing: defaultPadding,
      crossAxisSpacing: defaultPadding,
      shrinkWrap: true,
      itemCount: category.length,

      itemBuilder: (context, index) {
        return InkWell(
          onTap: (){
            if( index==0) {
              Provider.of<SideMenuProvider>(context, listen: false)
                .changeCurrentScreen(CustomScreensEnum.allOrderScreen);
            }
          },
          child: Container(

            decoration:  BoxDecoration(
                gradient: LinearGradient(
                    colors:
                    [
                     (index%4==0) ? const Color(0xff20149d): (index%4==1) ?  const Color(0xff2a84d1) : (index%4==2) ?  const Color(0xfff7990c)  :  const Color(0xffdb3a3a),
                      (index%4==0) ?  const Color(0xff311fd6) : (index%4==1) ?  const Color(0xff3398fc) : (index%4==2) ? const Color(0xfff9ac13)  :  const Color(0xffe45050),

                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Stack(
             // fit: StackFit.expand,
              children: [

                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding:  EdgeInsets.all(_size.height*0.015),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('500',  style: TextStyle(fontSize: _size.height*0.04,fontWeight: FontWeight.bold,color: Colors.white),maxLines: 1, overflow: TextOverflow.ellipsis,),
                            SvgPicture.asset(
                              index==0?'assets/svg_icons/order.svg'
                              :index==1?'assets/svg_icons/supplier.svg'
                                  :index==2?'assets/svg_icons/shop.svg':'assets/svg_icons/users.svg',


                              color: Colors.white.withOpacity(.8),height: _size.height*0.03,)
                          ],
                        ),
                        SizedBox(height: _size.height*0.01,),
                         Text(category[index].toString(), style: TextStyle(fontSize: _size.height*0.025,fontWeight: FontWeight.w500,color: Colors.white),maxLines: 1, overflow: TextOverflow.ellipsis,),



                       // const Text('Last one hour posts',  style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),maxLines: 1, overflow: TextOverflow.ellipsis,),


                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: _size.height*0.01,bottom: _size.height*0.01,
                  child: Icon(Icons.arrow_circle_right,color: Colors.white,size: _size.height*0.03,),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<ExpenseData> getChartData() {
    final List<ExpenseData> chartData = [
      ExpenseData('25/3', 55, 40, 2, 48),
      ExpenseData('24/3', 33, 45, 1, 28),
      ExpenseData('23/3', 43, 23, 3, 34),
      ExpenseData('22/3', 32, 54, 5, 54),
      ExpenseData('21/3', 56, 18, 4, 55),
      ExpenseData('20/3', 23, 54, 8, 56),
      ExpenseData('19/3', 23, 54, 8, 56),
    ];
    return chartData;
  }

}


class ExpenseData {
  ExpenseData(
      this.expenseCategory, this.confirmed, this.shipped, this.cancel, this.delivered);
  final String expenseCategory;
  final num confirmed;
  final num shipped;
  final num cancel;
  final num delivered;
}
