// ignore_for_file: avoid_unnecessary_containers, avoid_print

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_signin/screens/full_image.dart';

class Displayposts extends StatefulWidget {
  const Displayposts({super.key});

  @override
  State<Displayposts> createState() => _DisplaypostsState();
}

class _DisplaypostsState extends State<Displayposts> {
  @override
  Widget build(BuildContext context) {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    print(uid);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text('previous posts'),backgroundColor: Colors.black,),
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('images')
            .doc(uid)
            .collection('input')
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          return GridView.builder(
            shrinkWrap: true,
            itemCount: (snapshot.data! as dynamic).docs.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 1,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              DocumentSnapshot snap = (snapshot.data! as dynamic).docs[index];
              return Container(
                // width: MediaQuery.of(context).size.width/3,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>Fullimg(img1: snap['input'], img2: snap['output'])
                          ));
                  },
                  child: Image.memory(base64Decode(snap['output']),
                      fit: BoxFit.cover),
                ),
              );
              // return Container(
              //   child: Image.memory(base64Decode(snap['output']),
              //       fit: BoxFit.cover),
              // );
            },
          );
        },
      ),
    );
  }
}