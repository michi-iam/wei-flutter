import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
class CovidData {
  final String inzidenz;
  final String cityName;

  CovidData({
    required this.inzidenz,
    required this.cityName,
  });

  factory CovidData.fromJson(Map<String, dynamic> json){
    return CovidData(cityName: json["name"], inzidenz: json["inzidenz"]);
  }
}


Future<CovidData> fetchCovidData() async {
  var baseUrl = dotenv.env['BASEURL'];
  var cityUrl = baseUrl.toString() + "api/coviddata/1/";
  final response = await http
      .get(Uri.parse(cityUrl));
  if (response.statusCode == 200) {
    print("200");
    print(response.body);
    return CovidData.fromJson(jsonDecode(response.body));
  }
  else {
    print("exception");
    throw Exception('Failed to load city');
  }
}


class ShowCovidData extends StatefulWidget {
  const ShowCovidData({Key? key}) : super(key: key);
  @override
  _ShowCovidData createState() => _ShowCovidData();
}


class _ShowCovidData extends State<ShowCovidData> {
  late Future<CovidData> covidData;

  @override
  void initState() {
    super.initState();
    covidData = fetchCovidData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          child: FutureBuilder<CovidData>(
            future: covidData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.cityName + " Inzidenz: " + snapshot.data!.inzidenz);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
    );
  }
}