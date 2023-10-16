import 'package:flutter/cupertino.dart';
import 'package:lockapp/model/itemclass.dart';

class MyProvider extends ChangeNotifier {
  List<items> item = [];

  adduser(name, roomname, satus) {
    item.add(items(itemName: name, roomName: roomname, satus: satus));
    notifyListeners();
  }

  removelist(value) {
    item.remove(value);
    notifyListeners();
  }

  deletedevice(value, context) {
    return CupertinoAlertDialog(
      title: const Text('Please Confirm'),
      content: const Text('Are you sure to remove the text?'),
      actions: [
        // The "Yes" button
        CupertinoDialogAction(
          onPressed: () {
            item.remove(value);
          },
          isDefaultAction: true,
          isDestructiveAction: true,
          child: const Text('Yes'),
        ),
        // The "No" button
        CupertinoDialogAction(
          onPressed: () {},
          isDefaultAction: false,
          isDestructiveAction: false,
          child: const Text('No'),
        )
      ],
    );
  }

  List<Map<String, dynamic>> students = [
    {"Name": "najam", "Email": "nsn@gmail.com", "Password": "123456", "id": 1},
  ];

  adduser2(String username, email, password, int id) {
    students.add(
        {'Name': username, 'Email': email, 'Password': password, 'id': id});
    notifyListeners();
  }
}
