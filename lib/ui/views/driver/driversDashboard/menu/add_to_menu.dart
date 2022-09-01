import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trofira/core/constants/trofira_colors.dart';
import 'package:trofira/ui/views/widgets/custom_appBar_widget.dart';



class AddItemToMenu extends StatelessWidget {
  const AddItemToMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.menuWhite,
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: CustomAppBar(
              title: 'Add Item To Menu',
            )),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFABABAB).withOpacity(0.2),
                    blurRadius: 1,
                    offset: const Offset(2, 2), // Shadow position
                  ),
                ], borderRadius: BorderRadius.circular(10), color: AppColors.menuWhite),
                child: ListTile(
                  title: TextFormField(
                    style: TextStyle(fontFamily: 'ProximaNova', color: AppColors.menuBlack),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Name',
                      hintStyle:
                          TextStyle(fontFamily: 'ProximaNova', color: AppColors.menuBlack),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFABABAB).withOpacity(0.2),
                    blurRadius: 1,
                    offset: const Offset(2, 2), // Shadow position
                  ),
                ], borderRadius: BorderRadius.circular(10), color: AppColors.menuWhite),
                child: ListTile(
                  title: Text(
                    'Category',
                    style: TextStyle(fontFamily: 'ProximaNova', color: AppColors.menuBlack),
                  ),
                  trailing: const Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: AppColors.menuBlack,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFABABAB).withOpacity(0.2),
                    blurRadius: 1,
                    offset: const Offset(2, 2), // Shadow position
                  ),
                ], borderRadius: BorderRadius.circular(10), color: AppColors.menuWhite),
                child: ListTile(
                  title: TextFormField(
                    style: TextStyle(fontFamily: 'ProximaNova', color: AppColors.menuBlack),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Price',
                      hintStyle:
                          TextStyle(fontFamily: 'ProximaNova', color: AppColors.menuBlack),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFABABAB).withOpacity(0.2),
                    blurRadius: 1,
                    offset: const Offset(2, 2), // Shadow position
                  ),
                ], borderRadius: BorderRadius.circular(10), color: AppColors.menuWhite),
                child: ListTile(
                  title: Text(
                    'Availability',
                    style: TextStyle(fontFamily: 'ProximaNova', color: AppColors.menuBlack),
                  ),
                  trailing: const Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: AppColors.menuBlack,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.16,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFABABAB).withOpacity(0.2),
                    blurRadius: 1,
                    offset: const Offset(2, 2), // Shadow position
                  ),
                ], borderRadius: BorderRadius.circular(10), color: AppColors.menuWhite),
                child: ListTile(
                  title: TextFormField(
                    style: TextStyle(fontFamily: 'ProximaNova', color: AppColors.menuBlack),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Description',
                      hintStyle:
                          TextStyle(fontFamily: 'ProximaNova', color: AppColors.menuBlack),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              GestureDetector(
                onTap: () {
                  _showMyDialog(context);
                  // Get.back();
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.18,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFABABAB).withOpacity(0.2),
                      blurRadius: 1,
                      offset: const Offset(2, 2), // Shadow position
                    ),
                  ], borderRadius: BorderRadius.circular(10), color: AppColors.menuWhite),
                  child: const Center(
                    child: Icon(
                      Icons.camera_alt,
                      color: AppColors.menuRed,
                      size: 59,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.43,
                      decoration: BoxDecoration(
                          color: AppColors.menuWhite,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.menuRed)),
                      child: Center(
                        child: Text('Cancel',
                            style: TextStyle(
                                fontFamily: 'ProximaNova', color: AppColors.menuRed)),
                      )),
                  GestureDetector(
                      onTap: () {
                        //
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.43,
                        decoration: BoxDecoration(
                            color: AppColors.menuRed,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.menuRed)),
                        child: Center(
                          child: Text('Add',
                              style: TextStyle(
                                  fontFamily: 'ProximaNova', color: AppColors.menuWhite)),
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(
          child: Text('Upload Image',
              style: TextStyle(fontFamily: 'ProximaNova', color: AppColors.menuBlack)),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                'To uplaod an image to your menu, select one',
                style: TextStyle(
                    fontFamily: 'ProximaNova', color: AppColors.menuBlack, fontSize: 14),
              ),
              Center(
                child: Text(
                  'of these',
                  style: TextStyle(
                      fontFamily: 'ProximaNova', color: AppColors.menuBlack, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                child: Text(
                  'Search Image',
                  style: TextStyle(
                      fontFamily: 'ProximaNova',
                      color: AppColors.menuRed,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  // Get.back();
                  Get.toNamed('searchImagePage');
                  // Get.back();
                },
              ),
              TextButton(
                child: Text(
                  'Upload from Gallery',
                  style: TextStyle(
                      fontFamily: 'ProximaNova',
                      color: AppColors.menuRed,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      );
    },
  );
}
