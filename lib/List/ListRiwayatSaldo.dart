import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fortuna/model/m_riwayat.dart';
import 'package:fortuna/ui/app_colors.dart';

class ListRiwayatSaldo extends StatefulWidget {
  ListRiwayatSaldo({Key? key, required this.riwayat}) : super(key: key);
  mriwayat riwayat;
  @override
  State<ListRiwayatSaldo> createState() => _ListRiwayatSaldoState();
}

class _ListRiwayatSaldoState extends State<ListRiwayatSaldo> {
  // nominal: "1200000",
  // bank: "BNI",
  // status: "Sukses",
  // jenis: "Deposit",
  // norek: "-",
  // biayaadmin: "0",
  // total: "1200000"),
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
                    (widget.riwayat.jenis == "Deposit")
                        ? Icons.add_circle_outline_sharp
                        :  (widget.riwayat.jenis == "Withdraw") ? FontAwesomeIcons.wallet : Icons.shopping_bag_outlined,
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
                      widget.riwayat.jenis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold),
                    ),
                    Text(widget.riwayat.status),
                  ],
                ),
              ),
              Text(
                (widget.riwayat.jenis == "Deposit")
                    ? "Rp.${widget.riwayat.nominal}"
                    : "- Rp.${widget.riwayat.nominal}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
