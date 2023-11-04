import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

import '../controller/ApiController.dart';
import '../model/firm_data_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<FirmDataModel>? _firmDataModel = null;
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _firmDataModel = (await FetchApi().fetchApi()) ?? [];
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          Icon(
            Icons.add,
            color: Colors.orange,
            size: 40,
          ),
          SizedBox(
            width: 10,
          )
        ],
        title: Text(
          textAlign: TextAlign.center,
          'All Firm List',
          style: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.w900),
        ),
      ),
      body: SafeArea(
        child: _firmDataModel == null
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : Container(
                child: ListView.builder(
                  itemCount: _firmDataModel?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Container(
                      // width: 00,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(107, 254, 233, 202),
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${_firmDataModel?[index].firmName ?? ''}',
                                  style: TextStyle(
                                      letterSpacing: 1,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                      color: const Color.fromARGB(
                                          255, 244, 179, 83))),
                              Icon(
                                Icons.delete,
                                color: Colors.red,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset(
                                  // fit: BoxFit.fill,
                                  'assets/bmw-2.svg',
                                  semanticsLabel: 'My SVG Image',
                                  height:
                                      MediaQuery.of(context).size.height * 0.08,
                                  // width: 200,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                    overflow: TextOverflow.ellipsis,
                                    'Firm Owner : ${_firmDataModel?[index].firmOwner ?? ''}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: const Color.fromARGB(
                                            255, 166, 166, 166))),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    'Firm Address : ${_firmDataModel?[index].firmAddress ?? ''}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromARGB(
                                            255, 166, 166, 166))),
                              ]),
                          Text('${_firmDataModel?[index].firmEmail ?? ''}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.blue)),
                        ],
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
