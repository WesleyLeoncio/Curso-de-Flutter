import 'package:bytebanktwo/database/dao/contact_dao.dart';
import 'package:bytebanktwo/model/contact.dart';
import 'package:flutter/material.dart';

class ContactAtualiza extends ChangeNotifier{

    final ContactDao _dao = ContactDao();

    Future<List<Contact>> getAll() async{
      Future<List<Contact>> contacts = _dao.findAll();
      return contacts;

    }

  remove(Contact contact){
    _dao.deleteContact(contact.id);
    notifyListeners();
  }
}