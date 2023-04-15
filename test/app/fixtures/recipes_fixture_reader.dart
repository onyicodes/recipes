

import 'package:flutter/services.dart';

 Future<String> fixtureReader(String name) async => await rootBundle
        .loadString('assets/test_fixtures/$name');