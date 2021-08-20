import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: HngTask2()));
}

class HngTask2 extends StatefulWidget {
  const HngTask2({Key? key}) : super(key: key);

  @override
  _HngTask2State createState() => _HngTask2State();
}

class _HngTask2State extends State<HngTask2> {
  String text = 'Please, type something in the box below';
  String? newText;

  void setNewText() {
    text = newText!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Input to display App',
          style: TextStyle(color: Color(0xff442C2E)),
        ),
        centerTitle: true,
        backgroundColor: Color(0xffFEDBD0),
      ),
      backgroundColor: Color(0xffFEEAE6),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50.0,
                ),
                AlertDialog(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),

                  // title: Text(text),
                  backgroundColor: Color(0xffFEDBD0),
                  content: Text(text),
                ),
                SizedBox(
                  height: 120.0,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Please input your text:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                CustomTextField(
                  onTap: (value) {
                    newText = value;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      text = newText!;
                    });


                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(text),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'),
                            )
                          ],
                        );
                      },
                    );


                  },
                  child: Text('Click Here to Display'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff442C2E),
                    padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0)
                  ),
                ),
                SizedBox(height: 120.0,),
                Text('Sponsored by:', style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 8.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Image.asset('assets/download.png'),
                    // Image.asset('assets/14g-logo.png'),
                    // Image.asset('assets/brand-logo.png'),
                    Expanded(flex: 3, child: Image.asset('assets/download.png')),
                    SizedBox(width: 10,),
                    Expanded(flex: 3, child: Image.asset('assets/14g-logo.png')),
                    SizedBox(width: 10,),
                    Expanded(flex: 3, child: Image.asset('assets/brand-logo.png')),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, this.onTap}) : super(key: key);

  final Function(String)? onTap;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onTap,
      // onSubmitted: onTap,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color(0xff442C2E), width: 3.0)),

          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Color(0xff442C2E), width: 3.0)),

          border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color(0xff442C2E), width: 3.0 )
      )),
    );
  }
}
