import 'package:flutter/material.dart';
import 'package:routeplanning/GradientButton.dart';
import '../MainBackground.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  String? dropdownValue;
  String _groupValue = "-1";
  List busStations = [
    "Basiskele",
    "Cayirova",
    "Darica",
    "Derince",
    "Dilovasi",
    "Gebze",
    "Golcuk",
    "Kandira",
    "Karamursel",
    "Kartepe",
    "Korfez",
    "Izmit"
  ];

  void _handleRadioValueChange(String? value) {
    setState(() {
      _groupValue = value.toString();
    });
  }

  _builtListItem(context, index) => GestureDetector(
        onTap: () => setState(() {
          _handleRadioValueChange(index.toString());
        }),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0x40FFFFFF),
              boxShadow: [
                BoxShadow(
                  color: Color(0x30000000),
                  blurRadius: 4,
                  offset: Offset(0, 0),
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
            ),
            child: Row(
              children: [
                Radio(
                  value: index.toString(),
                  groupValue: _groupValue,
                  onChanged: _handleRadioValueChange,
                  activeColor: const Color(0xFFFF5C00),
                ),
                Text(
                  busStations[index],
                  style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      );

  _builtUserPage() => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: busStations.length,
                  itemBuilder: (context, index) =>
                      _builtListItem(context, index),
                ),
              ),
              const SizedBox(height: 15),
              const GradientButton(
                text: "Kaydet ve Rotayı Göster",
                color: <Color>[
                  Color(0xFF4527A0),
                  Color(0xFF7E57C2),
                  Color(0xFF2EE2B3),
                ],
              )
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            const MainBackground(),
            _builtUserPage(),
          ],
        ),
      ),
    );
  }
}
