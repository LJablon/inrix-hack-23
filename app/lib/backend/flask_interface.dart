import 'dart:convert';
import 'package:app/models/parking_option.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:app/backend/geo_location_helper.dart';
import 'package:app/models/event.dart';
import 'package:app/models/nav_route.dart';

String apiUrl = 'http://172.31.151.109:5000';

Future<List<Event>> findEvents() async {
  String endpoint = '/tickets';
  var response = await http.Client().get(Uri.parse('$apiUrl$endpoint'));

  if (response.statusCode == 200) {
    List<dynamic> json = jsonDecode(response.body);

    List<Event> events = json
        .map((e) => Event(
              name: e['name'],
              address: e['location'],
              date: DateTime.parse(e['eventDate']),
              url: e['eventURL'],
              imageUrl: e['imagelist'],
              latitude: double.parse(e['lat']),
              longitude: double.parse(e['long']),
            ))
        .toList();

    return events;
  } else {
    throw Exception('Error, code ${response.statusCode}');
  }
}

/// Returns a [List] of parking options where each option is a [List] of the
/// [NavRoute] for that option
Future<List<ParkingOption>> getRoutes(
    double eventLat, double eventLong, int parkingRadius) async {
  // get user's position
  Position userPosition = await getUserPosition();
  double userLat = userPosition.latitude;
  double userLong = userPosition.longitude;

  String endpoint = '/';
  /*var response = await http.Client().get(Uri.parse(
      '$apiUrl$endpoint?lat=$eventLat&long=$eventLong&userLat=$userLat&userLong=$userLong&radius=$parkingRadius'));*/

  var response = await http.Client().get(Uri.parse('https://google.com'));

  if (response.statusCode == 200) {
    //List<dynamic> json = jsonDecode(response.body);

    List<dynamic> json = [
      {
        "start": "24 Willie Mays Plaza, San Francisco, CA 94107, USA",
        "end": "1 Telegraph Hill Blvd, San Francisco, CA 94133, USA",
        "time_text": "36 mins",
        "time": 2147,
        "fare_text": "\$3.00",
        "fare": 3,
        "steps": [
          {
            "mode": "WALKING",
            "path": [
              [37.77921, -122.39007],
              [37.77893, -122.39042],
              [37.77883, -122.39055],
              [37.77864, -122.39077],
              [37.77853, -122.39092],
              [37.77847, -122.39099],
              [37.77828, -122.39124],
              [37.77821, -122.39132],
              [37.77804, -122.39154],
              [37.77806, -122.39157],
              [37.77812, -122.39164],
              [37.77811, -122.39165],
              [37.77816, -122.3917],
              [37.77819, -122.39174],
              [37.77823, -122.39178],
              [37.7783, -122.39186],
              [37.77832, -122.39188],
              [37.77831, -122.3919],
              [37.77839, -122.39199],
              [37.77848, -122.39211],
              [37.7786, -122.39227],
              [37.77865, -122.39231],
              [37.7787, -122.39237],
              [37.77886, -122.39258],
              [37.77886, -122.39257],
              [37.77888, -122.39259],
              [37.779, -122.39275],
              [37.77902, -122.39277],
              [37.77913, -122.39292],
              [37.77923, -122.39304],
              [37.77929, -122.39313],
              [37.77932, -122.39315],
              [37.7794, -122.39327],
              [37.77948, -122.39336],
              [37.77954, -122.39343],
              [37.77958, -122.39349],
              [37.77962, -122.39354],
              [37.77976, -122.39371],
              [37.77989, -122.39388],
              [37.77999, -122.394],
              [37.78006, -122.39408],
              [37.7801, -122.39413],
              [37.78012, -122.39415],
              [37.78014, -122.39418],
              [37.78024, -122.3943],
              [37.78026, -122.39433],
              [37.78041, -122.39453],
              [37.78043, -122.39456],
              [37.78061, -122.39477],
              [37.78073, -122.39493],
              [37.78075, -122.39495],
              [37.78075, -122.39496],
              [37.78084, -122.39507],
              [37.78085, -122.39509],
              [37.78086, -122.39509],
              [37.78088, -122.39512],
              [37.78113, -122.39543],
              [37.78117, -122.39548],
              [37.78134, -122.39569],
              [37.78133, -122.3957],
              [37.78147, -122.39587],
              [37.78146, -122.39587],
              [37.78167, -122.39614]
            ]
          },
          {
            "mode": "TRANSIT",
            "path": [
              [37.78166, -122.39615],
              [37.78161, -122.39622],
              [37.78176, -122.39641],
              [37.78214, -122.39687],
              [37.78225, -122.39702],
              [37.78231, -122.39708],
              [37.78238, -122.39717],
              [37.78241, -122.39722],
              [37.78249, -122.39733],
              [37.78255, -122.39742],
              [37.78264, -122.39753],
              [37.78271, -122.39762],
              [37.78291, -122.39787],
              [37.783, -122.39798],
              [37.78345, -122.39853],
              [37.78349, -122.39859],
              [37.78362, -122.39875],
              [37.78381, -122.39898],
              [37.7839, -122.39908],
              [37.78402, -122.39924],
              [37.78406, -122.39929],
              [37.78422, -122.39949],
              [37.7844, -122.39971],
              [37.78441, -122.39973],
              [37.78458, -122.39995],
              [37.7846, -122.39998],
              [37.7848, -122.40023],
              [37.78491, -122.40037],
              [37.78493, -122.40039],
              [37.78502, -122.4005],
              [37.7851, -122.4006],
              [37.78522, -122.40074],
              [37.78536, -122.40092],
              [37.78547, -122.40104],
              [37.7856, -122.40121],
              [37.7857, -122.40135],
              [37.7858, -122.40147],
              [37.78583, -122.40151],
              [37.78621, -122.402],
              [37.78627, -122.40208],
              [37.78653, -122.40241],
              [37.78657, -122.40246],
              [37.78669, -122.40261],
              [37.78703, -122.40303],
              [37.78725, -122.40332],
              [37.78729, -122.40337],
              [37.78731, -122.40339],
              [37.78732, -122.4034],
              [37.78734, -122.40341],
              [37.78736, -122.40342],
              [37.78738, -122.40343],
              [37.7874, -122.40343],
              [37.78742, -122.40343],
              [37.78765, -122.40346],
              [37.78775, -122.40347],
              [37.78798, -122.40351],
              [37.78815, -122.40355],
              [37.78817, -122.40355],
              [37.78823, -122.40356],
              [37.78844, -122.4036],
              [37.78891, -122.40369],
              [37.78933, -122.40377],
              [37.78937, -122.40379],
              [37.78939, -122.4038],
              [37.78967, -122.40385],
              [37.78976, -122.40387],
              [37.78985, -122.40389],
              [37.79029, -122.40398],
              [37.79076, -122.40407],
              [37.79086, -122.40409],
              [37.79136, -122.40419],
              [37.79169, -122.40426],
              [37.79187, -122.40429],
              [37.79222, -122.40435],
              [37.79254, -122.40442],
              [37.7926, -122.40443],
              [37.79264, -122.40444],
              [37.79266, -122.40444],
              [37.79282, -122.40448],
              [37.7929, -122.4045],
              [37.79358, -122.40464],
              [37.79402, -122.40472],
              [37.79446, -122.40481],
              [37.79468, -122.40486],
              [37.79481, -122.40488],
              [37.79487, -122.40489],
              [37.79495, -122.40491],
              [37.79504, -122.40493],
              [37.79521, -122.40496],
              [37.79533, -122.40498],
              [37.79555, -122.40503],
              [37.7956, -122.40504],
              [37.79591, -122.40511],
              [37.79611, -122.40515],
              [37.79622, -122.40517],
              [37.79647, -122.40522],
              [37.79691, -122.40531],
              [37.79708, -122.40556],
              [37.79716, -122.40568],
              [37.7972, -122.40573],
              [37.79734, -122.40593],
              [37.79758, -122.40627],
              [37.79769, -122.40644],
              [37.79788, -122.4067],
              [37.79793, -122.40677],
              [37.79804, -122.40693],
              [37.79805, -122.40694],
              [37.7981, -122.40703],
              [37.79814, -122.40708],
              [37.79814, -122.40709],
              [37.79826, -122.40725],
              [37.79837, -122.40742],
              [37.79843, -122.4075],
              [37.79849, -122.40759],
              [37.79854, -122.40767],
              [37.79855, -122.40768],
              [37.79871, -122.40791],
              [37.799, -122.40833],
              [37.79915, -122.40855],
              [37.79932, -122.40879],
              [37.79939, -122.40872]
            ]
          },
          {
            "mode": "WALKING",
            "path": [
              [37.7994, -122.40871],
              [37.79942, -122.40874],
              [37.79949, -122.40879],
              [37.79949, -122.40873],
              [37.79952, -122.40844],
              [37.79954, -122.40825],
              [37.79955, -122.40814],
              [37.79956, -122.40803],
              [37.79957, -122.40796],
              [37.79958, -122.40786],
              [37.7996, -122.40772],
              [37.79961, -122.40768],
              [37.79963, -122.40748],
              [37.79965, -122.40732],
              [37.79968, -122.40709],
              [37.79969, -122.40702],
              [37.79971, -122.40682],
              [37.79973, -122.40665],
              [37.79974, -122.40661],
              [37.79989, -122.40663],
              [37.80004, -122.40666],
              [37.80057, -122.40677],
              [37.80068, -122.40679],
              [37.80082, -122.40681],
              [37.8009, -122.40682],
              [37.8009, -122.40683],
              [37.80144, -122.40693],
              [37.80149, -122.40694],
              [37.80161, -122.40696],
              [37.80162, -122.40694],
              [37.80163, -122.40681],
              [37.80166, -122.4066],
              [37.80166, -122.40656],
              [37.80167, -122.40651],
              [37.80169, -122.40638],
              [37.80169, -122.4063],
              [37.8017, -122.4063],
              [37.8017, -122.40626],
              [37.80171, -122.40618],
              [37.80171, -122.40615],
              [37.8017, -122.40615],
              [37.80171, -122.40608],
              [37.80171, -122.40606],
              [37.80172, -122.40598],
              [37.80172, -122.40596],
              [37.80173, -122.40591],
              [37.80173, -122.40588],
              [37.80174, -122.40583],
              [37.80175, -122.40579],
              [37.80175, -122.40572],
              [37.80176, -122.40569],
              [37.80177, -122.40567],
              [37.80177, -122.40566],
              [37.80178, -122.40565],
              [37.80179, -122.40564],
              [37.8018, -122.40564],
              [37.80186, -122.40566],
              [37.80187, -122.40568],
              [37.80187, -122.40573],
              [37.80188, -122.40574],
              [37.80189, -122.40575],
              [37.8019, -122.40576],
              [37.80194, -122.40577],
              [37.80197, -122.4058],
              [37.80199, -122.40583],
              [37.80205, -122.4059],
              [37.8021, -122.40596],
              [37.80212, -122.40594],
              [37.80213, -122.40592],
              [37.80213, -122.4059],
              [37.80213, -122.40588],
              [37.80213, -122.40585],
              [37.80214, -122.40584],
              [37.80218, -122.4059],
              [37.80221, -122.40594],
              [37.80223, -122.40586],
              [37.80225, -122.40586],
              [37.80225, -122.4058],
              [37.80228, -122.40574],
              [37.80229, -122.4057],
              [37.80233, -122.40569],
              [37.80237, -122.40568],
              [37.80241, -122.40569],
              [37.80244, -122.40571]
            ]
          }
        ]
      },
    ];
    List<ParkingOption> parkingOptions = [];

    for (Map<String, dynamic> option in json) {
      List<NavRoute> navRoutes = [];
      for (Map<String, dynamic> step in option['steps']) {
        List<LatLng> latLongPairs = [];
        for (List<double> pair in step['path']) {
          latLongPairs.add(LatLng(pair[0], pair[1]));
        }

        navRoutes.add(NavRoute(mode: step['mode'], latLongPairs: latLongPairs));
      }

      parkingOptions.add(ParkingOption(
          startAddress: option['start'],
          endAddress: option['end'],
          timeText: option['time_text'],
          time: option['time'],
          fareText: option['fare_text'],
          fare: option['fare'],
          navRoutes: navRoutes));
    }

    return parkingOptions;
  } else {
    throw Exception('Error, code ${response.statusCode}');
  }
}
