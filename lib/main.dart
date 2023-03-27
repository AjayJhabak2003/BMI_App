
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stack/Splash_page.dart';
import 'package:stack/image_page.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI',


      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
          primarySwatch: Colors.blue,
      ),
      home: Splash_page(),
    );
  }
}

class MyHomePage extends StatefulWidget {





  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with  SingleTickerProviderStateMixin {
  final formKey =GlobalKey<FormState>();
  var wgt_controller= TextEditingController();
  var ft_controller = TextEditingController();
  var in_controller= TextEditingController();
  String result ='';
  Color bgcolor= Colors.white;
  late AnimationController controller;
  var ArrinchNo=[10,11,12];






  @override
  void initState() {
    super.initState();


    controller=AnimationController(duration: Duration(seconds: 2),vsync: this);
   controller.addStatusListener((status) async{
     if(status==AnimationStatus.completed){
       Navigator.pop(context);
       controller.reset();

     }
   });
   wgt_controller.addListener(() {
     setState(() {
     });
   });
   ft_controller.addListener(() {
     setState(() {
     });
   });
   in_controller.addListener(() {
     setState(() {
     });
   });
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.



    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.shade200,
        elevation: 10,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        centerTitle: true,
        title: Text('BMI Calculator',style:  TextStyle(fontSize: 21,fontWeight: FontWeight.w700),),
      ),
      drawer:Drawer(
        width: 260,
        backgroundColor: Colors.cyan.shade50,
        elevation: 20,

        child: Column(
          children:<Widget> [
            Container(
              width: double.infinity,


              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Color(0xff5ee7df),
                        Color(0xffb490ca),

                      ]
                  )
              ),
              child:Container(
                width: 100,
                height: 220,
                padding: EdgeInsets.only(top: 25),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile_image.jpg'),
                      radius: 60,


                    ),
                    SizedBox(height: 5,),
                    Text(' Ajay Jhabak',style: TextStyle(fontSize: 23,fontWeight: FontWeight.w900,color: Colors.white),),
                    SizedBox(height: 7,),
                    Text('Developer </>',style:TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w600),)
                  ],
                ),
              ) ,

            ),
            ListTile(
              title: Text('Home',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),),
              leading: Icon(Icons.home),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
              },
            ),
            ListTile(
              title: Text('About BMI',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
              leading: Icon(Icons.launch_outlined),
              onTap: (){
                launchUrl(Uri.parse('https://aboutobesity.in/tagged-with-obesity-get-to-know-your-body-mass-index-bmi/'));

              },
            ),
            ListTile(
              title: Text('Rate us',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
              leading: Icon(Icons.star_rate),
              onTap: (){
                launchUrl(Uri.parse('https://play.google.com/store/games?pli=1'));
              },
            ),

          ],
        ),
      ),
      body: AnimatedContainer(
        width:double.infinity ,
        height: double.infinity,

        duration: Duration(seconds: 2),
        curve: Curves.decelerate,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff5ee7df),
              Color(0xffb490ca),

            ]
          )
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(17),
                child: Card(
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      width: 0,
                      color: Colors.blue
                    )
                  ),
                  elevation: 17,
                  shadowColor: Colors.green,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => image_page()));
                    },
                    child: Container(
                        width: 370,

                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image(image: AssetImage('assets/images/BMI.png',) ,))

                    ),
                  ),
                ),
              ),
              SizedBox(height: 28,),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(17),
                

                child: Form(
                  autovalidateMode: AutovalidateMode.disabled,
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,


                    children: [
                      Card(
                        child: Container(
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(55),bottomLeft: Radius.circular(55),topLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xffa8edea),
                                    Color(0xfffed6e3),
                                  ]
                              )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                SizedBox(height:20 ,),
                                TextFormField(
                                  controller: wgt_controller,
                                  validator: (value){
                                    if ( !RegExp(r'^[0-9]').hasMatch(value!)){
                                      return "      Enter number only";
                                    }else{
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          borderSide: BorderSide(
                                              color: CupertinoColors.destructiveRed,
                                              width: 2.5)
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(35),
                                          borderSide: BorderSide(
                                              color: CupertinoColors.destructiveRed,
                                              width: 2.5
                                          )
                                      ),
                                      errorStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,fontStyle: FontStyle.italic,color: Colors.red.shade600),
                                      prefixIcon: Icon(Icons.monitor_weight_outlined,size: 30,color: CupertinoColors.systemGrey,),
                                      suffixIcon: wgt_controller.text.isEmpty
                                          ?Container(width: 0,)
                                          :IconButton(
                                        icon: Icon(Icons.cancel_outlined,size: 23,color: CupertinoColors.systemGrey,),
                                        onPressed: (){
                                          wgt_controller.clear();
                                        },
                                      ),
                                      label: Text('Enter your Weight (in kg)'),
                                      labelStyle: TextStyle(fontSize: 16,fontWeight:FontWeight.w600,fontStyle: FontStyle.italic,color: CupertinoColors.systemGrey),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          borderSide: BorderSide(
                                              color: CupertinoColors.systemGrey,
                                              width: 2.5
                                          )
                                      ),

                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(35),
                                        borderSide: BorderSide(
                                            color: Colors.blue.shade500,
                                            width: 2.5


                                        ),

                                      )
                                  ),

                                ),
                                SizedBox(height: 15,),
                                TextFormField(
                                  controller: ft_controller,
                                  validator: (value){
                                    if (value!.isEmpty || !RegExp(r'^[0-9]').hasMatch(value!)){
                                      return "      Enter number only";
                                    }else{
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          borderSide: BorderSide(
                                              color: CupertinoColors.destructiveRed,
                                              width: 2.5)
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(35),
                                          borderSide: BorderSide(
                                              color: CupertinoColors.destructiveRed,
                                              width: 2.5
                                          )
                                      ),
                                      errorStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,fontStyle: FontStyle.italic,color: Colors.red.shade600),
                                      prefixIcon: Icon(Icons.height_sharp,size: 30,color: CupertinoColors.systemGrey,),
                                      suffixIcon: ft_controller.text.isEmpty
                                          ?Container(width: 0,)
                                          :IconButton(
                                          onPressed: (){
                                            ft_controller.clear();
                                          },
                                          icon: Icon(Icons.cancel_outlined,size: 23,color: CupertinoColors.systemGrey,)
                                      ),
                                      label: Text('Enter your Height (in ft)'),
                                      labelStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,fontStyle: FontStyle.italic,color: CupertinoColors.systemGrey),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          borderSide: BorderSide(
                                              color: CupertinoColors.systemGrey,
                                              width: 2.5
                                          )
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(35),
                                          borderSide: BorderSide(
                                              color: Colors.blue.shade500,
                                              width: 2.5
                                          )
                                      )
                                  ),
                                ),
                                SizedBox(height: 15,),
                                TextFormField(
                                  maxLength: 2,

                                  controller: in_controller,
                                  validator: (value){
                                    if (value!.isEmpty || !RegExp(r'^[0-9]').hasMatch(value!)){
                                      return "      Enter number only";
                                    }else if (value.length >1 &&   !RegExp(r"^[0-1]+[0-2]").hasMatch(value!)) {
                                      return "     Enter value in (0-12)";
                                    }else{
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    counter:Offstage(),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          borderSide: BorderSide(
                                              color: CupertinoColors.destructiveRed,
                                              width: 2.5)
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(35),
                                          borderSide: BorderSide(
                                              color: CupertinoColors.destructiveRed,
                                              width: 2.5
                                          )
                                      ),
                                      errorStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,fontStyle: FontStyle.italic,color: Colors.red.shade600),
                                      prefixIcon: Icon(Icons.height_sharp,size: 30,color: CupertinoColors.systemGrey,),
                                      suffixIcon: in_controller.text.isEmpty
                                          ?Container(width: 0,)
                                          :IconButton(
                                        icon: Icon(Icons.cancel_outlined,size: 23,color: CupertinoColors.systemGrey,),
                                        onPressed: (){
                                          in_controller.clear();
                                        },
                                      ),
                                      label: Text('Enter your Height (in inch)'),
                                      labelStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,fontStyle: FontStyle.italic,color: CupertinoColors.systemGrey),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:BorderRadius.circular(15),
                                          borderSide: BorderSide(
                                              color: CupertinoColors.systemGrey,
                                              width: 2.5
                                          )
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(35),
                                          borderSide: BorderSide(
                                              color: Colors.blue.shade500,
                                              width: 2.5
                                          )
                                      )
                                  ),
                                ),
                                SizedBox(height:20 ,),

                              ],
                            ),
                          ),
                        ),
                        color: Colors.white,
                        elevation: 25,
                        shadowColor: Colors.green,
                        margin: EdgeInsets.all(7),
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(55),bottomLeft: Radius.circular(55),topLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                            width: 2

                          )
                        ),


                      ),
                      SizedBox(height: 20,),
                      ElevatedButton(
                        child: Text('Calculate',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w700),),

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent.shade200,
                          elevation: 10,
                          shadowColor: Colors.green ,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                          )
                        ),


                        onPressed: (){

                          showDialog(context: context, builder: (context) => AlertDialog(
                            elevation: 20,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: BorderSide(
                                width: 5,
                                color: Colors.grey.shade600
                              )
                            ),

                            content:Lottie.asset('assets/animations/weighing machine.json',
                                controller: controller,
                                onLoaded: (composition){
                              controller.forward();
                            }),


                          ));
                          Timer(Duration(milliseconds: 2150),()
                          {
                            var imagepath ='';
                            var url;
                            String info='';

                            late double image_width;
                             late double image_height;
                             late double button_width;
                             late double button_height;
                            showDialog(context: context, builder: (context) =>
                                AlertDialog(
                                  content: Container(
                                    width: 600,
                                    height: 370,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: bgcolor
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,

                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(imagepath,width: image_width,height:image_height),
                                        Text(result, style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600),),
                                        SizedBox(height: 16,),
                                        Text(info,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700,color: Colors.white),),
                                        SizedBox(height: 6,),
                                        Container(
                                          width: button_width,
                                          height: button_height,
                                          child: Link(
                                            target: LinkTarget.self,
                                            uri: Uri.parse(url),
                                            builder: (context, followLink) => ElevatedButton(
                                              onPressed: followLink,

                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Text('Click here ',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
                                                  Icon(Icons.launch_outlined,size: 13,)
                                                ],

                                              ),
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.blueAccent.shade200,
                                                  elevation: 10,
                                                  shadowColor: Colors.green ,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(15)
                                                  )
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.all(10),
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      side: BorderSide(
                                        width: 4, color: CupertinoColors.systemGrey,)),
                                  backgroundColor: bgcolor,


                                ));


                            if (wgt_controller.text.toString() != "" &&
                                ft_controller.text.toString() != "" &&
                                in_controller.text.toString() != "") {

                              if(formKey.currentState!.validate() ){
                                image_width=200;
                                image_height=220;
                                button_height=50;
                                button_width=110;
                                info='For more information, click below';

                                var iwgt = int.parse(
                                    wgt_controller.text.toString());
                                var iFt = int.parse(ft_controller.text.toString());
                                var iInch = int.parse(
                                    in_controller.text.toString());

                                var total_ht = ((iFt * 12 + iInch) * 2.54) / 100;
                                var bmi = iwgt / (total_ht * total_ht);


                                if (bmi > 25) {
                                  result = 'Your BMI is ${bmi.toStringAsFixed(
                                      3)} \n You are Overweight';
                                  bgcolor = CupertinoColors.activeOrange;
                                  imagepath='assets/images/obesity.jpg';
                                    url = 'https://en.wikipedia.org/wiki/Overweight';
                                } else if (bmi < 18) {
                                  result = "Your BMI is ${bmi.toStringAsFixed(
                                      3)} \n You are Underweight";
                                  bgcolor = Colors.yellow.shade400;
                                  imagepath='assets/images/underweight.jpg';
                                  url ='https://en.wikipedia.org/wiki/Underweight';
                                } else {
                                  result = 'Your BMI is ${bmi.toStringAsFixed(
                                      3)} \n You are Healthy';
                                  bgcolor = Colors.lightGreenAccent.shade200;
                                  imagepath='assets/images/fit_healthy.jpg';
                                  url ='https://www.ottawalife.com/article/7-benefits-of-being-healthy?c=9';
                                }
                                in_controller.clear();
                                wgt_controller.clear();
                                ft_controller.clear();


                              }else{
                                result='Please enter valid credentials';
                                bgcolor=Colors.red.shade500;
                                image_width=0;
                                image_height=0;
                                button_width=0;
                                button_height=0;
                                imagepath='assets/images/underweight.jpg';
                                url='';

                              }
                            } else {
                              result =
                              'One or more fields are empty, Please fill valid credentials';
                              bgcolor = Colors.blueAccent.shade200;
                              image_width=0;
                              image_height=0;
                              button_width=0;
                              button_height=0;
                              imagepath='assets/images/underweight.jpg';
                              url='';


                            }
                            setState(() {

                            });
                          });


                        },
                      ),
                      SizedBox(height: 30,),


                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }

}
