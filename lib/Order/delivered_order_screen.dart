import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';

import '../General/constants.dart';
import '../General/responsive.dart';


class DeliveredOrderScreen extends StatefulWidget {
  const DeliveredOrderScreen({Key? key}) : super(key: key);

  @override
  State<DeliveredOrderScreen> createState() => _DeliveredOrderScreenState();
}

class _DeliveredOrderScreenState extends State<DeliveredOrderScreen> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding*1.5),
          child: ListView(
            children: [
              const SizedBox(height: defaultPadding),
              Text('Order',style: TextStyle(fontWeight: FontWeight.w600,fontSize: _size.height*0.035)),
              const SizedBox(height: defaultPadding),
              InfoCard(),
              const SizedBox(height: defaultPadding),
              TextField(
                style:  TextStyle(color: Colors.black,fontSize:_size.height*0.025 ),
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.black54,fontSize:_size.height*0.025 ),
                  fillColor: Colors.transparent,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Colors.black45,
                        width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Colors.black45,
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
                      child: SvgPicture.asset("assets/svg_icons/Search.svg",color: Colors.black45,),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding),
              Container(

                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xfff3f3f3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child:   Column(
                  children:  [

                    const SizedBox(height: defaultPadding),
                    orderList(),
                    const SizedBox(height: defaultPadding),

                  ],
                ),
              ),
            ],

          ),
        ));
  }

  Widget InfoCard(){
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Responsive(
          mobile: cardGridView(
            crossAxisCount: _size.width < 650 ? 2 : 5,
            childAspectRatio: _size.width < 650 && _size.width > 350 ? 2 : 1.6,
          ),
          tablet: cardGridView(childAspectRatio: 2, crossAxisCount: 5),
          desktop: cardGridView(
            childAspectRatio: _size.width < 1400 ? 1.8 : 2.2, crossAxisCount: 5,
          ),
        ),
      ],
    );
  }


  var category= [
    'All Orders',
    'Pending',
    'Delivered',

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
        return Container(

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
                                :index==1?'assets/svg_icons/pending.svg'
                                :index==2?'assets/svg_icons/delivery(1).svg':'assets/svg_icons/users.svg',
                            color: Colors.white.withOpacity(.8),height: _size.height*0.03,)
                        ],
                      ),
                      SizedBox(height: _size.height*0.01,),
                      Text(category[index].toString(), style: TextStyle(fontSize: _size.height*0.025,fontWeight: FontWeight.w500,color: Colors.white),maxLines: 1, overflow: TextOverflow.ellipsis,),

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
        );
      },
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



  Widget orderList(){
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            Text('Delivered Orders ',style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w600,color: Colors.black))
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
                child: Center(child: Text('Delivery Agent',style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w500,color: Colors.white),)),
              ),
              Expanded(
                flex: 2,
                child: Center(child: Text('Delivery Address',style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w500,color: Colors.white),)),
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
                      child: Center(child: Text('Not Assigned',style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w500,color: Colors.black),)),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(child: Text('636, Arambagh, Hooghly-712601',style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w500,color: Colors.black),)),
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
}
