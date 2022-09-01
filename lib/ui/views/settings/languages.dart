import 'package:flutter/material.dart';


class Languages extends StatefulWidget {
  const Languages({Key? key}) : super(key: key);

  @override
  _LanguagesState createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0))
      ),
      content: SizedBox(
        width: 414,
        height: 503,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    "Afaan Oromoo",
                    style: TextStyle(
                        color: Color(0xff363636),
                        fontFamily: 'ProximaNova',
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  Spacer(),
                  GestureDetector(
                      onTap: (){
                        Navigator.pop(context);

                      },
                      child:  Icon(
                          Icons.radio_button_checked,
                          color: Colors.red

                      )),
                ],
              ),
              Divider(
                height: 30,
                thickness: 1,
              ),
              Row(
                children: [
                  Text(
                    "Afrikaans",
                    style: TextStyle(
                        color: Color(0xff363636),
                        fontFamily: 'ProximaNova',
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  Spacer(),
                  GestureDetector(
                      onTap: (){
                        Navigator.pop(context);

                      },
                      child:  Icon(
                          Icons.radio_button_checked,
                          color: Colors.red

                      )),
                ],
              ),
              Divider(
                height: 30,
                thickness: 1,
              ),
              Row(
                children: [
                  Text(
                    "Azebaycan dili",
                    style: TextStyle(
                        color: Color(0xff363636),
                        fontFamily: 'ProximaNova',
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  Spacer(),
                  GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child:  Icon(
                          Icons.radio_button_checked,
                          color: Colors.red

                      )),
                ],
              ),
              Divider(
                height: 30,
                thickness: 1,
              ),
              Row(
                children: [
                  Text(
                    "Bahasa Indonesia",
                    style: TextStyle(
                        color: Color(0xff363636),
                        fontFamily: 'ProximaNova',
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  Spacer(),
                  GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child:  Icon(
                          Icons.radio_button_checked,
                          color: Colors.red

                      )),
                ],
              ),
              Divider(
                height: 30,
                thickness: 1,
              ),
              Row(
                children: [
                  Text(
                    "Bahasa Melayu",
                    style: TextStyle(
                        color: Color(0xff363636),
                        fontFamily: 'ProximaNova',
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  Spacer(),
                  GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child:  Icon(
                          Icons.radio_button_checked,
                          color: Colors.red

                      )),
                ],
              ),
              Divider(
                height: 30,
                thickness: 1,
              ),
              Row(
                children: [
                  Text(
                    "Basa Jawa",
                    style: TextStyle(
                        color: Color(0xff363636),
                        fontFamily: 'ProximaNova',
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  Spacer(),
                  GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child:  Icon(
                          Icons.radio_button_checked,
                          color: Colors.red

                      )),
                ],
              ),
              Divider(
                height: 30,
                thickness: 1,
              ),
              Row(
                children: [
                  Text(
                    "Bisaya",
                    style: TextStyle(
                        color: Color(0xff363636),
                        fontFamily: 'ProximaNova',
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  Spacer(),
                  GestureDetector(
                      onTap: (){
                        Navigator.pop(context);

                      },
                      child:  Icon(
                          Icons.radio_button_checked,
                          color: Colors.red

                      )),
                ],
              ),
              Divider(
                height: 30,
                thickness: 1,
              ),
              Row(
                children: [
                  Text(
                    "Cestina",
                    style: TextStyle(
                        color: Color(0xff363636),
                        fontFamily: 'ProximaNova',
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  Spacer(),
                  GestureDetector(
                      onTap: (){
                        Navigator.pop(context);

                      },
                      child:  Icon(
                          Icons.radio_button_checked,
                          color: Colors.red

                      )),
                ],
              ),
              Divider(
                height: 30,
                thickness: 1,
              ),
              Row(
                children: [
                  Text(
                    "Dansk",
                    style: TextStyle(
                        color: Color(0xff363636),
                        fontFamily: 'ProximaNova',
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  Spacer(),
                  GestureDetector(
                      onTap: (){
                        Navigator.pop(context);

                      },
                      child:  Icon(
                          Icons.radio_button_checked,
                          color: Colors.red

                      )),
                ],
              ),
              Divider(
                height: 30,
                thickness: 1,
              ),
              Row(
                children: [
                  Text(
                    "English(UK)",
                    style: TextStyle(
                        color: Color(0xff363636),
                        fontFamily: 'ProximaNova',
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  Spacer(),
                  GestureDetector(
                      onTap: (){
                        Navigator.pop(context);

                      },
                      child:  Icon(
                          Icons.radio_button_checked,
                          color: Colors.red

                      )),
                ],
              ),
              Divider(
                height: 30,
                thickness: 1,
              ),
              Row(
                children: [
                  Text(
                    "English",
                    style: TextStyle(
                        color: Color(0xff363636),
                        fontFamily: 'ProximaNova',
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  Spacer(),
                  GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child:  Icon(
                          Icons.radio_button_checked,
                          color: Colors.red

                      )),
                ],
              ),
              Divider(
                height: 30,
                thickness: 1,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
