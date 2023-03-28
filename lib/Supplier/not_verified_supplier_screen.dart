import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../General/constants.dart';
import '../General/responsive.dart';
import '../MainContain/Components/side_menu_provider.dart';


class NotVerifiedSupplierScreen extends StatefulWidget {
  const NotVerifiedSupplierScreen({Key? key}) : super(key: key);

  @override
  State<NotVerifiedSupplierScreen> createState() => _NotVerifiedSupplierScreenState();
}

class _NotVerifiedSupplierScreenState extends State<NotVerifiedSupplierScreen> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding*1.5),
          child: ListView(
            children: [
              const SizedBox(height: defaultPadding),
              Text('Supplier',style: TextStyle(fontWeight: FontWeight.w600,fontSize: _size.height*0.035)),
              const SizedBox(height: defaultPadding),
              InfoCard(),
              const SizedBox(height: defaultPadding),
              TextField(
                style:  TextStyle(color: Colors.black,fontSize:_size.height*0.025 ),
                decoration: InputDecoration(
                  hintText: "Search Supplier",
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
                    supplierList(),
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
    'Total',
    'Request',
    'Verified',
    'Not-Verified',


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
            index==2?Provider.of<SideMenuProvider>(context, listen: false)
                .changeCurrentScreen(CustomScreensEnum.verifiedSupplierScreen)
                :index==3?Provider.of<SideMenuProvider>(context, listen: false)
                .changeCurrentScreen(CustomScreensEnum.notVerifiedSupplierScreen)
                :index==1?Provider.of<SideMenuProvider>(context, listen: false)
                .changeCurrentScreen(CustomScreensEnum.requestSupplierScreen):null;
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
                              index==2?'assets/svg_icons/verified.svg'
                                  :index==3?'assets/svg_icons/not_verified.svg'
                                  :index==1?'assets/svg_icons/request.svg':'assets/svg_icons/users.svg',
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
    '1234567890',
    '1234567890',
    '1234567890',
    '1234567890',
    '1234567890',
    '1234567890',
    '1234567890',
    '1234567890',
    '1234567890',
    '1234567890',
  ];

  var productList = [
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



  final _scrollController = ScrollController();
  final _scrollController2 = ScrollController();
  Widget supplierList(){
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            Text('Not Verified Supplier List ',style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w600,color: Colors.black))
          ],
        ),
        const SizedBox(height: defaultPadding/2,),
        Scrollbar(
          controller: _scrollController,
          thumbVisibility: true,
          child: SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.vertical,
            child: Scrollbar(
              controller: _scrollController2,
              thumbVisibility:  true,
              child: SingleChildScrollView(
                controller: _scrollController2,
                scrollDirection: Axis.horizontal,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: DataTable(
                    headingRowHeight: _size.height*0.05,
                    showCheckboxColumn: false,dividerThickness: 0,
                    headingRowColor: MaterialStateProperty.all(Color(0xff3d414a)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5)
                    ),
                    //dataRowColor: MaterialStateProperty.all(index%2==0 ?Colors.white:Colors.transparent),
                    columns: [
                      DataColumn(
                        label: Text('Name',style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w500,color: Colors.white),),
                      ),
                      DataColumn(
                        numeric: true,
                        label: Center(child: Text('Number',style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w500,color: Colors.white),)),
                      ),
                      DataColumn(

                        label: Center(child: Text('Address',style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w500,color: Colors.white),)),
                      ),
                      DataColumn(
                        numeric: true,
                        label: Center(child: Text('No Of Product',style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w500,color: Colors.white),)),
                      ),
                      DataColumn(
                        numeric: true,
                        label: Center(child: Text('GST No',style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w500,color: Colors.white),)),
                      ),
                      DataColumn(
                        label: Center(child: Text('Type',style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w500,color: Colors.white),)),
                      ),
                      DataColumn(
                        label: Center(child: Text('Action',style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w500,color: Colors.white),)),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                      customerList.length,
                          (int index) => DataRow(
                        color: MaterialStateProperty.all(index%2==0 ?Colors.white:Colors.transparent),
                        cells: <DataCell>[
                          DataCell(
                            Container(
                              constraints: BoxConstraints(
                                  maxWidth:Responsive.isMobile(context)? _size.width*0.45 : _size.width*0.1
                              ),
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
                          ),
                          DataCell(
                              Center(child: Text(dateList[index],style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w500,color: Colors.black),textAlign: TextAlign.center,))
                          ),
                          DataCell(
                              Container(
                                constraints: BoxConstraints(
                                    maxWidth:Responsive.isMobile(context)? _size.width*0.45 : _size.width*0.1
                                ),
                                child: Center(
                                  child: Text('636, Arambagh, Hooghly- 712601',style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w500,color: Colors.black),textAlign: TextAlign.center,

                                  ),
                                ),
                              )
                          ),
                          DataCell(
                              Center(child: Text(productList[index],style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w500,color: Colors.black),textAlign: TextAlign.center,))
                          ),
                          DataCell(
                              Center(child: Text("AYHD123456",style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w500,color: Colors.black),textAlign: TextAlign.center,))
                          ),
                          DataCell(
                              Center(child: Text("Not Mention",style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w500,color: Colors.black),textAlign: TextAlign.center,))
                          ),

                          DataCell(
                            Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  color:Colors.green,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black45,
                                        blurRadius: 2
                                    )
                                  ]
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.check_circle_outline,color: Colors.white,size: _size.height*0.02,),
                                  SizedBox(width: _size.height*0.01,),
                                  Flexible(
                                    child: Text('Activate',style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w500,
                                        color:Colors.white

                                    ),),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                        onSelectChanged: (bool? value) {},
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        // Container(
        //   height: _size.height*0.05,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(5),
        //     color: const Color(0xff3d414a),
        //   ),
        //   child: Row(
        //     children:  [
        //       Expanded(
        //         flex: 2,
        //         child: Padding(
        //           padding: const EdgeInsets.only(left: 5),
        //           child: Text('Name',style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w500,color: Colors.white),),
        //         ),
        //       ),
        //       Expanded(
        //         flex: 1,
        //         child: Center(child: Text('Number',style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w500,color: Colors.white),)),
        //       ),
        //       Expanded(
        //         flex: 2,
        //         child: Center(child: Text('Address',style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w500,color: Colors.white),)),
        //       ),
        //       Expanded(
        //         flex: 1,
        //         child: Text('No Of Product',style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w500,color: Colors.white),),
        //       ),
        //
        //       Expanded(
        //         flex: 1,
        //         child: Center(child: Text('Gst Number',style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w500,color: Colors.white),)),
        //       ),
        //       Expanded(
        //         flex: 1,
        //         child: Center(child: Text('Type',style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w500,color: Colors.white),)),
        //       ),
        //       Expanded(
        //         flex: 1,
        //         child: Center(child: Text('Action',style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w500,color: Colors.white),)),
        //       ),
        //     ],
        //   ),
        // ),
        // ListView.builder(
        //     padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
        //     shrinkWrap: true,
        //     physics: const NeverScrollableScrollPhysics(),
        //     itemCount: customerList.length,
        //     itemBuilder: (context, index){
        //       return Container(
        //         padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 8),
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(5),
        //           color: index%2==0 ?Colors.white:Colors.transparent,
        //         ),
        //         child: Row(
        //           children:  [
        //             Expanded(
        //               flex: 2,
        //               child: Padding(
        //                 padding: const EdgeInsets.only(left: 5),
        //                 child: Row(
        //                   children: [
        //                     Container(
        //                       height: _size.height*0.035,
        //                       width: _size.height*0.035,
        //                       decoration: const BoxDecoration(
        //                         shape: BoxShape.circle,
        //                       ),
        //                       child: Image.asset(
        //                         "assets/images/profile_pic.png",
        //                         fit: BoxFit.fill,
        //                       ),
        //                     ),
        //                     const SizedBox(width: 5,),
        //                     Flexible(child: Text(customerList[index],style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w500,color: Colors.black),)),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //             Expanded(
        //               flex: 1,
        //               child: Center(child: Text(dateList[index],style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w500,color: Colors.black),)),
        //             ),
        //             Expanded(
        //               flex: 2,
        //               child: Center(child: Text('636, Arambagh, Hooghly-712601',style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w500,color: Colors.black),
        //                 textAlign: TextAlign.center,
        //               )),
        //             ),
        //             Expanded(
        //               flex: 1,
        //               child: Center(child: Text(productList[index],style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w500,color: Colors.black),)),
        //             ),
        //
        //             Expanded(
        //               flex: 1,
        //               child: Center(child: Text(' AYHD123456',style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w500,color: Colors.black),)),
        //             ),
        //             Expanded(
        //               flex: 1,
        //               child: Center(child: Text('Not Mention',style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w500,color: Colors.black),)),
        //             ),
        //
        //             Expanded(
        //               flex: 1,
        //               child: Container(
        //                 padding: EdgeInsets.all(5),
        //                 margin: EdgeInsets.symmetric(horizontal: 5),
        //                 decoration: BoxDecoration(
        //                     color:Colors.green,
        //                     borderRadius: BorderRadius.circular(5),
        //                   boxShadow: [
        //                     BoxShadow(
        //                       color: Colors.black45,
        //                       blurRadius: 2
        //                     )
        //                   ]
        //                 ),
        //                 child: Row(
        //                   mainAxisAlignment: MainAxisAlignment.center,
        //                   children: [
        //                     Icon(Icons.check_circle_outline,color: Colors.white,size: _size.height*0.02,),
        //                     SizedBox(width: _size.height*0.01,),
        //                     Flexible(
        //                       child: Text('Activate',style: TextStyle(fontSize: _size.height*0.02,fontWeight: FontWeight.w500,
        //                           color:Colors.white
        //
        //                       ),),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       );
        //     }
        // )

      ],
    );
  }
}
