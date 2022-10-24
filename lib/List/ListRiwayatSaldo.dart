import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fortuna/model/MRiwayatSaldo.dart';

import 'package:fortuna/ui/app_colors.dart';
import 'package:intl/intl.dart';

class ListRiwayatSaldo extends StatefulWidget {
  ListRiwayatSaldo({Key? key, required this.model}) : super(key: key);
  MRiwayatSaldo model;
  @override
  State<ListRiwayatSaldo> createState() => _ListRiwayatSaldoState();
}

class _ListRiwayatSaldoState extends State<ListRiwayatSaldo> {
  final formatter =
      NumberFormat.simpleCurrency(locale: "id_ID", decimalDigits: 0);
  String date = "";
  _tanggal() {
    if (widget.model.jumlah == "" || widget.model.jumlah!.isEmpty) {
      widget.model.jumlah = "0";
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tanggal();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            children: [
              Card(
                color: kGrey,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Icon(
                    (widget.model.jenis == "1")
                        ? Icons.add_circle_outline_sharp
                        : (widget.model.jenis == "2")
                            ? FontAwesomeIcons.wallet
                            : Icons.shopping_bag_outlined,
                    color: kMerah,
                    size: 32,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      (widget.model.jenis == "1") ? "Deposit" : "Withdraw",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat('EEEE, dd-MM-yyyy |  hh:mm:ss', 'id').format(
                          DateTime.parse(widget.model.createdAt.toString())),
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
              Text(
                (widget.model.jenis == "1")
                    ? "+ ${formatter.format(int.parse(widget.model.jumlah ?? "0"))}"
                    : "- ${formatter.format(int.parse(widget.model.jumlah.toString()))}",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Divider(
            height: 20,
            thickness: 2,
            color: kGrey,
          )
        ],
      ),
    );
  }
}
