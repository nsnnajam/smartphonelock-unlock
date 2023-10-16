// main.dart
import 'package:flutter/cupertino.dart';

class Alertsecreen extends StatefulWidget {
  const Alertsecreen({Key? key}) : super(key: key);

  @override
  State<Alertsecreen> createState() => _AlertsecreenState();
}

class _AlertsecreenState extends State<Alertsecreen> {
  // Determine whether the red box is shown or not
  bool _isShown = true;

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
                onPressed: () {
                  setState(() {
                    _isShown = false;
                    Navigator.of(context).pop();
                  });
                },
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

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Kindacode.com'),
        ),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              CupertinoButton(
                  onPressed: _isShown == true ? () => _delete(context) : null,
                  child: const Text('Remove The Paragraph Below')),
              const SizedBox(
                height: 30,
              ),
              if (_isShown == true)
                const Padding(
                  padding: EdgeInsets.all(30),
                  child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur efficitur massa pellentesque, tristique enim maximus, suscipit lacus. Mauris vel euismod dui. Duis turpis massa, dictum sit amet porttitor vel, bibendum at felis. '),
                )
            ],
          ),
        ));
  }
}
