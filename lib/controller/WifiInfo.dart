import 'package:get/get.dart';

class Controller extends GetxController {
  var wifiSSID = "";
  var wifiBSSID = "";
  var wifiPSK = "";

  void setSSID(String ssid) {
    wifiSSID = ssid;
  }

  void setBSSID(String bssid) {
    wifiBSSID = bssid;
  }

  void setPSK(String psk) {
    wifiPSK = psk;
  }

  void setWifi({String ssid, String bssid, String psk}) {
    wifiSSID = ssid;
    wifiBSSID = bssid;
    wifiPSK = psk;
  }

  get ssid {
    return wifiSSID;
  }

  get bssid {
    return wifiBSSID;
  }

  get psk {
    return wifiPSK;
  }

  List<String> wifiInfo() {
    return [wifiSSID, wifiBSSID, wifiPSK];
  }
}
