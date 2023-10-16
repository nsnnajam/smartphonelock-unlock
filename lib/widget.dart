import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget myText(String txt, color, double size, font) {
  return Text(
    txt,
    style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: font,
        overflow: TextOverflow.ellipsis),
  );
}

class ReusbaleRow extends StatelessWidget {
  String title, value;
  ReusbaleRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }
}

/// Flutter code sample for [Switch].

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Switch(
      // This bool value toggles the switch.
      value: light,
      inactiveThumbColor: Colors.green,
      activeColor: Colors.red,
      onChanged: (bool value) {
        // This is called when the user toggles the switch.
        setState(() {
          light = value;
        });
      },
    );
  }
}

void _delete(BuildContext context) {
  showCupertinoDialog(
      context: context,
      builder: (BuildContext ctx) {
        return CupertinoAlertDialog(
          title: const Text('Please Confirm'),
          content: const Text('Are you sure to remove the text?'),
          actions: [
            // The "Yes" button
            CupertinoDialogAction(
              onPressed: () {},
              isDefaultAction: true,
              isDestructiveAction: true,
              child: const Text('Yes'),
            ),
            // The "No" button
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop();
              },
              isDefaultAction: false,
              isDestructiveAction: false,
              child: const Text('No'),
            )
          ],
        );
      });
}

// deletedta(data) {
//     return AwesomeDialog(
//       context: context,
//       dialogType: DialogType.info,
//       animType: AnimType.rightSlide,
//       title: 'Dialog Title',
//       desc: 'Dialog description here.............',
//       btnCancelOnPress: () {},
//       btnOkOnPress: () {},
//     )..show();
//   }

Future<bool?> showToaast(msg, clr) {
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: clr,
      textColor: Colors.white,
      fontSize: 18.0);
}










  // AwesomeDialog(
  //                                             context: context,
  //                                             dialogBackgroundColor:
  //                                                 Colors.white,
  //                                             dialogType: DialogType.SUCCES,
  //                                             borderSide: BorderSide(
  //                                                 color: Colors.blue[900]!,
  //                                                 width: 2),
  //                                             width: 380,
  //                                             buttonsBorderRadius:
  //                                                 BorderRadius.all(
  //                                                     Radius.circular(2)),
  //                                             headerAnimationLoop: false,
  //                                             animType: AnimType.BOTTOMSLIDE,
  //                                             body: Column(
  //                                               children: [
  //                                                 const Text(
  //                                                     'Are your sure you want delet product.?',
  //                                                     style: TextStyle(
  //                                                         color: Colors.orange,
  //                                                         fontFamily: "new",
  //                                                         fontSize: 22)),
  //                                               ],
  //                                             ),
  //                                             btnOkText: "Delete",
  //                                             btnCancelText: "cancel",
  //                                             showCloseIcon: true,
  //                                             btnOkOnPress: () {
  //                                               curdoc.reference.delete();
  //                                             }).show();