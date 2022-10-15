import 'package:flutter/material.dart';

void StyleLoadingDialog(BuildContext context) async {
  // show the loading dialogloadingDialog =
  showDialog(
    // The user CANNOT close this dialog  by pressing outsite it
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return Dialog(
          // The background color
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                // The loading indicator
                CircularProgressIndicator(),
                SizedBox(
                  height: 15,
                ),
                // Some text
                Text('Loading...')
              ],
            ),
          ),
        );
      });
}

Center StyleLoadingWidget(BuildContext context){
 return Center(
      child: Dialog(
        // The background color
        backgroundColor: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              // The loading indicator
              CircularProgressIndicator(),
              SizedBox(
                height: 15,
              ),
              // Some text
              Text('Loading...')
            ],
          ),
        ),
      )
 );
}