import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  void _launchCaller(int number) async{
    var url = "tel: +${number.toString()}";
    if(await canLaunch(url)){
      await launch(url);
    }
    else{
      throw 'could not able to call';
    }
  }
  void _launchEmail(String emailID) async{
    var url = "mailto: $emailID";
    if(await canLaunch(url)){
      await launch(url);
    }
    else
      throw'not able to send email';
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.orange,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 50.0,
                        backgroundImage: AssetImage('images/my.jpg'),
                      ),
                      Text(
                        'Manjeet kumar',
                        style: TextStyle(
                          fontFamily: 'PlayfairDisplay',
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Developer',
                        style: TextStyle(
                            fontFamily: 'SourceSansPro-SemiBold',
                            fontSize: 20.0,
                            letterSpacing: 2.5,
                            fontWeight: FontWeight.w500,
                            color: Colors.teal.shade100),
                      ),
                      SizedBox(
                        height: 20.0,
                        width: 150.0,
                        child: Divider(
                          color: Colors.white,
                        ),
                      ),
                      Card(
                          color: Colors.white,
                          margin: EdgeInsets.symmetric(horizontal: 25.0,vertical: 10.0),
                          child: ListTile(
                              leading: Icon(
                                Icons.phone,color: Colors.teal,
                              ),
                              title: Text('+918195058580',
                                style: TextStyle(
                                  color: Colors.teal,
                                  fontFamily: 'SourceSansPro-SemiBold',
                                  fontSize: 20.0,),
                              ),
                           onTap: () {
                             _launchCaller(918195058580);
                           }
                          ),
                          ),

                      Card(
                          color: Colors.white,
                          margin: EdgeInsets.symmetric(horizontal: 25.0,vertical: 10.0),
                          child: ListTile(
                            leading: Icon(
                              Icons.email,color: Colors.teal,
                            ),
                            title: Text('manjeet.kmr18@gmail.com',
                              style: TextStyle(
                                color: Colors.teal,
                                fontFamily: 'SourceSansPro-SemiBold',
                                fontSize: 20.0,),
                          ),
                            onTap: (){
                              _launchEmail('manjeet.kmr18@gmail.com');
                            },
                          )
                      )
                    ]),
          )),
        ),
    );
  }
}
