
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constant/app_utils.dart';
import '../../controller/list_controller.dart';
import '../widgets/list_widgets/build_bottom_sheet.dart';
import '../widgets/list_widgets/build_header_label.dart';
import '../widgets/list_widgets/build_list_item.dart';


class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  ListController listController = Get.put(ListController());


  @override
  void initState() {

    _loadFromPrefs();
    

    super.initState();
  }

  List<String> _items = [];

  Future<void> _loadFromPrefs()async{
   final prefs = await SharedPreferences.getInstance();
   setState(() {
     _items = prefs.getStringList('items') ?? [];
    
   });
  }

  void _removeItem(int index)async{
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _items.removeAt(index);
    });
    await prefs.setStringList('items', _items);
  }


  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
     body:
           _items.isEmpty?
                Center(child:  Utils.noItems) 
                     :
                 ListView(
                 children: [
                   Column(
                     children: [

                      // **** Header Title **** \\
                      const BuildHeaderLabel(), 
                       
               
                         SizedBox(
                         height: 650.h,
                         child: ListView.builder(
                             itemCount: _items.length,
                             itemBuilder: (context, index) {
               
                               return Padding(
                                 padding: EdgeInsets.only(
                                     right: 20.0.w,
                                     left: 20.0.w,
                                     bottom: 15.0.h),
                                 child: InkWell(
                                   onTap: ()async  {

                                   await listController
                                         .getCityWeather(_items[index]);
                                    Get.bottomSheet(

                                      // **** Bottom Sheet **** \\

                                      
                                      BuildBottomSheet(addrees: _items[index], listController: listController),

                                    );
    
                                                
                                   },
                                   child: 


                                   // **** List Item **** \\
                                   BuildListItem(index: index, name: _items[index], removeItem: ()=> _removeItem(index)),
                                  
                                 ),
                               );
                             }),
                       ),
                     ],
                   ),
                 ],
               ),
    
    
    );
  }
  // @override
  // void dispose() {
  //  listController.dispose();
  //   super.dispose();
  // }
}
