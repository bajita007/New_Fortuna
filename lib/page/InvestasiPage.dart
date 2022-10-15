
import 'package:flutter/material.dart';

import '../List/ListInvestasi.dart';
import '../model/m_tipeinvest.dart';
import '../widget/HeaderWidget.dart';

class InvestasiPage extends StatefulWidget {
  const InvestasiPage({Key? key}) : super(key: key);

  @override
  State<InvestasiPage> createState() => _InvestasiPageState();
}

class _InvestasiPageState extends State<InvestasiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerWidget(),
      body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: dataInvest.length,
            itemBuilder: (context, index) {
              return ListInvestasi(mInvestasi: dataInvest[index]);
            }),
      ),
    );
  }
}
