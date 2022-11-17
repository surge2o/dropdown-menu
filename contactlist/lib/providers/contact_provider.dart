import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:contactlist/models/contact_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ProviderContact with ChangeNotifier {
  // store contacts from the internt.

  List<ContactModel> apiContact = [];
  List<ContactModel> get apiContacts => apiContact;
// store contacts to favorite list

  List<ContactModel> favContact = [];
  List<ContactModel> get favContacts => apiContact;

  // method to fetch data from the internet
  // a null will be return

  Future<Void?> fetchContact() async {
    try {
      final resp = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      if (resp.statusCode == 200) {
        // decode the resp data
        final json = jsonDecode(resp.body);
        for (var data in json) {
          apiContact.add(ContactModel(
              name: data['name'],
              email: data['email'],
              phoneNumber: data['phone'],
              website: data['website'],
              address: data['address']['city'] +
                  "" +
                  data['address']['street'] +
                  "" +
                  data['address']['suite']));
        }
      }
    } on SocketException {
      //
    }
    notifyListeners();
  }
}
