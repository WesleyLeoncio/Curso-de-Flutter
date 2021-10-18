import 'package:bytebanktwo/database/dao/contact_dao.dart';
import 'package:bytebanktwo/model/contact.dart';
import 'package:flutter/material.dart';

class ContactListRecharge extends ChangeNotifier{

  final ContactDao _dao = ContactDao();

  Future<List<Contact>> getAll() async{
    Future<List<Contact>> contacts = _dao.findAll();
    return contacts;

  }

  saveContact(Contact contact){
    _dao.put(contact);
    notifyListeners();
  }

  removeContact(Contact contact){
    _dao.delete(contact.id);
    notifyListeners();
  }
}