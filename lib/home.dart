import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_project/api/api.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController city = TextEditingController();
  String defaultCity = "Mansoura";
  WeatherAPI api = WeatherAPI();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.white,
        body: Stack(children: [
          Container(
            height: 350,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/bluesky.png"),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(20),
                )),
          ),
          FutureBuilder(
              future: api.getAPIData(defaultCity),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextFormField(
                            controller: city,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.search,
                                    size: 35, color: Colors.white),
                                onPressed: () {
                                  defaultCity = city.text.toString();
                                  setState(() {});
                                },
                              ),
                              hintText: "Enter City",
                              hintStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SizedBox(
                            height: 460,
                            width: MediaQuery.of(context).size.width,
                            child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              child: Column(
                                children: [
                                  Text(
                                    snapshot.data!.city.name,
                                    style: const TextStyle(
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    DateFormat()
                                        .add_MMMMEEEEd()
                                        .format(DateTime.now()),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                  const Divider(height: 60),
                                  Text(
                                    snapshot
                                        .data!.list[0].weather[0].description,
                                    style: const TextStyle(
                                        fontSize: 30, color: Colors.grey),
                                  ),
                                  Text(
                                    "${(snapshot.data!.list[0].main.temp - 273.15).round()}\u2103",
                                    style: const TextStyle(
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    "min:${(snapshot.data!.list[0].main.temp_min - 273.15).round()}\u2103 / max:${(snapshot.data!.list[0].main.temp_max - 273.15).round()}\u2103",
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                  ),
                                  const Divider(height: 30),
                                  Image.network(
                                      "https://openweathermap.org/img/wn/${snapshot.data!.list[8].weather.first.icon}@2x.png"),
                                  Text(
                                    "wind ${snapshot.data!.list[1].wind.speed.toString()}",
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              dayWeather(
                                snapshot.data!.list[0].dt_txt.toString(),
                                snapshot.data!.list[0].weather.first.icon,
                                snapshot.data!.list[0].main.temp,
                                snapshot.data!.list[0].weather[0].description,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              dayWeather(
                                snapshot.data!.list[8].dt_txt.toString(),
                                snapshot.data!.list[8].weather.first.icon,
                                snapshot.data!.list[8].main.temp,
                                snapshot.data!.list[8].weather[0].description,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              dayWeather(
                                snapshot.data!.list[16].dt_txt.toString(),
                                snapshot.data!.list[16].weather.first.icon,
                                snapshot.data!.list[16].main.temp,
                                snapshot.data!.list[16].weather[0].description,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              dayWeather(
                                snapshot.data!.list[24].dt_txt.toString(),
                                snapshot.data!.list[24].weather.first.icon,
                                snapshot.data!.list[24].main.temp,
                                snapshot.data!.list[24].weather[0].description,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              dayWeather(
                                snapshot.data!.list[32].dt_txt.toString(),
                                snapshot.data!.list[32].weather.first.icon,
                                snapshot.data!.list[32].main.temp,
                                snapshot.data!.list[32].weather[0].description,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }
                if (snapshot.hasError) {
                  return const Center(child: Text("Error"));
                }
                return const Center(child: CircularProgressIndicator());
              }),
        ]),
      ),
    );
  }
}

Widget dayWeather(String day, String image, double degree, String status) {
  return SizedBox(
    height: 210,
    width: 180,
    child: Card(
      color: Colors.grey[400],
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateFormat('EEEE').format(DateTime.parse(day)),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(
                height: 80,
                child: Image.network(
                    "https://openweathermap.org/img/wn/$image@2x.png")),
            Text(
              "${(degree - 273.15).round()}\u2103",
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Text(
              status,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
