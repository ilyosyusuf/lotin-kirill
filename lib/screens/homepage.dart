
import 'package:flutter/material.dart';
import 'package:translit/translit.dart';
// import 'package:translit/translit.dart';
// import 'package:translit/translit.dart';
// import 'package:translit/translit.dart';
// import 'package:translit/translit.dart';
// import 'package:translit_uz/translit_uz.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  String? texttrans;
  String? texttrans1;
  List _list = [];
  int ontap = 0;
  // String? texttrans1;
  // final String text = Translit().toTranslit(source: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: true,
        child: SizedBox(
          child: Form(
            child: Column(
              children: [
                SizedBox(height: 10.0,),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                      
                      controller: _controller,
                      maxLines: null,
                      decoration: InputDecoration(
                        // fillColor: Colors.green.shade100,
                        filled: true,
                        labelText: "Lotin",
                        hintText: "Lotin alifbosida so'z kiriting...",
                        focusedBorder: _inputBorder(),
                        // fillColor: Colors.red,
                        suffix: _cleanButton(),
                        // border: InputBorder(borderSide: Border)
                        // focusColor: Colors.green,
                      ),
                      onChanged: (text){
                        _controller1.text = Translit().unTranslit(source: text);
                        
                        setState(() {});
                        print("Text: ${_controller1.text}");

                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                      // controller: _controller,
                      controller: TextEditingController(text: _controller1.text),
                      maxLines: null,
                      decoration: InputDecoration(
                        filled: true,
                        labelText: "Kirill",
                        hintText: "Kirill alifbosida so'z kiriting...",
                        focusedBorder: _inputBorder(),
                        suffix: _cleanButton(),
                      ),
                      onChanged: (text){
                          _controller.text = Translit().toTranslit(source: text);
                        print("Qidiruvda: ${_controller.text}");
                        // setState(() {});

                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _inputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.green),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  IconButton _cleanButton() {
    return IconButton(
      icon: Icon(Icons.clear, color: Colors.red,),
      onPressed: (){
        setState(() {
          _controller.clear();
          _controller1.clear();
        });
      },
  );
  }
}
