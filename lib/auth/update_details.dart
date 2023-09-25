// ignore_for_file: unused_import, unnecessary_import, implementation_imports, camel_case_types, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_signin/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class update_details extends StatefulWidget {
  const update_details({super.key});

  @override
  State<update_details> createState() => _update_detailsState();
}

class _update_detailsState extends State<update_details> {
  var emailval = TextEditingController();
  var passval = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Update Details"),),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'E-Mail',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
          ),
          Container(
              width: 300,
              child: TextField(
                controller: emailval,
                // onChanged: (value) {
                //   emailval = value;
                // },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: 'Enter new email id',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Password',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: 300,
              child: TextField(
                controller: emailval,
                // onChanged: (value) {
                //   emailval = value;
                // },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: 'Enter new password',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
            ),
            ElevatedButton(onPressed: () async{
              // FirebaseUser user = await FirebaseAuth.instance.currentUser();
            }, child: Text("Update details")),
        ],
      ),
    );
  }
}