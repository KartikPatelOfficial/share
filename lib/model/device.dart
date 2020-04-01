import 'package:flutter/cupertino.dart';

class Device {
  String name;
  String version;
  String identifier;

  Device(
      {@required this.name, @required this.version, @required this.identifier});

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
        name: json['name'],
        version: json['version'],
        identifier: json['identifier']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'version': version,
      'identifier': identifier,
    };
  }
}
