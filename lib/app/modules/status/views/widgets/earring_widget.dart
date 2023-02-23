import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EarringWidget extends StatelessWidget {
  final String tipoCupo;
  final String estaSoli;
  final String horaSoli;
  final String fechSoli;
  const EarringWidget(
      {Key? key,
      required this.tipoCupo,
      required this.estaSoli,
      required this.horaSoli,
      required this.fechSoli})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: SizedBox(
        height: 200.0,
        width: MediaQuery.of(context).size.width - 20,
        child: Card(
          color: Colors.green[50],
          shadowColor: Colors.blueGrey,
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.credit_card,
                    color: Colors.orange, size: 45),
                title: Text(
                  tipoCupo,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  estaSoli,
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Divider(
                  thickness: 1.4,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 5, 0, 10),
                    child: const Text('Fecha de solicitud :',
                        style: TextStyle(fontSize: 15, color: Colors.black)),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(16, 5, 30, 10),
                    alignment: Alignment.bottomLeft,
                    child: Text(horaSoli,
                        style:
                            const TextStyle(fontSize: 15, color: Colors.black)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 5, 0, 10),
                    child: const Text('Se espera usar :',
                        style: TextStyle(fontSize: 15, color: Colors.black)),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(16, 5, 91, 10),
                    alignment: Alignment.bottomLeft,
                    child: Text(fechSoli,
                        style:
                            const TextStyle(fontSize: 15, color: Colors.black)),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
    ;
  }
}
