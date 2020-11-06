import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:native_contact_dialog/native_contact_dialog.dart';

class ContactDev extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var queryWidth = MediaQuery.of(context).size.shortestSide;
    //var queryHeight = MediaQuery.of(context).size.longestSide;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: queryWidth * 0.3),
          child: Column(
            children: [
              SizedBox(
                height: queryWidth * 0.047,
              ),
              Text(
                "Astha Nayak",
                style: TextStyle(fontSize: queryWidth * 0.1),
              ),
              SizedBox(
                height: queryWidth * 0.03,
              ),
              Text(
                "CSE Sophomore",
                style: TextStyle(fontSize: queryWidth * 0.06),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: queryWidth * 0.07),
                child: Card(
                  color: Colors.white,
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                        width: 1.0,
                      ))),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Icon(
                          Icons.phone,
                          color: Color.fromRGBO(74, 232, 190, 1),
                        ),
                      ),
                    ),
                    title: Center(
                      child: Text(
                        "8895498640",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: queryWidth * 0.027,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: queryWidth * 0.07),
                child: Card(
                  color: Colors.white,
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                        width: 1.0,
                      ))),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Icon(
                          Icons.email,
                          color: Color.fromRGBO(74, 232, 190, 1),
                        ),
                      ),
                    ),
                    title: Center(
                      child: Text(
                        "nayakastha2911@gmail.com",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: queryWidth * 0.027,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: FloatingActionButton(
                        backgroundColor: Color.fromRGBO(74, 232, 190, 1),
                        shape: CircleBorder(),
                        child: Icon(Icons.call),
                        onPressed: () async {
                          var url = "tel:" + "8895498640";
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: FloatingActionButton(
                        backgroundColor: Color.fromRGBO(74, 232, 190, 1),
                        shape: CircleBorder(),
                        child: Icon(Icons.mail),
                        onPressed: () async {
                          var url = "mailto:" + "nayakastha2911@gmail.com";
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: FloatingActionButton(
                        backgroundColor: Color.fromRGBO(74, 232, 190, 1),
                        shape: CircleBorder(),
                        child: Icon(Icons.message),
                        onPressed: () async {
                          var url = "sms:" + "8895498640";
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: queryWidth * 0.1,
                child: RaisedButton(
                  color: Color.fromRGBO(
                    54,
                    66,
                    87,
                    1.0,
                  ),
                  shape: StadiumBorder(),
                  onPressed: () {
                    saveContact(Contact(
                        givenName: "Astha Nayak",
                        phones: [Item(value: "8895498640")],
                        emails: [Item(value: "nayakastha2911@gmail.com")]));
                  },
                  child: Text(
                    "Hello, I loved your Tic-Tac-Toe. Cheers :)",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void saveContact(Contact newContact) async {
  NativeContactDialog.addContact(newContact).then((result) {
    // NOTE: The user could cancel the dialog, but not add
    // them to their addressbook. Whether or not the user decides
    // to add [contactToAdd] to their addressbook, you will end up
    // here.

    print('add contact dialog closed.');
  }).catchError((error) {
    // FlutterError, most likely unsupported operating system.
    print('Error adding contact!');
  });
}
