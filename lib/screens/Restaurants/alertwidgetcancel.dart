import 'package:flutter/material.dart';

class AlertDialogCancelButtons extends StatelessWidget {
  const AlertDialogCancelButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(0.0191*screenwidth),
      child: Container(
        height: 0.127 * screenwidth,
        width: 0.29*screenwidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromARGB(255, 185, 255, 212)),
        child: Center(
          child: TextButton(
            child: const Text(
              'Cancel',
              style: TextStyle(
                  fontFamily: 'Dropdown',
                  fontSize: 16,
                  color: Color.fromARGB(255, 0, 126, 51),
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              //Put your code here which you want to execute on Yes button click.
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }
}