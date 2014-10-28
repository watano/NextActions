import 'dart:convert';
import 'Utils.dart';

void main() {
  fetchUser();
}

void fetchUser() {
//  var region = 'www.battlenet.com.cn';
  var region = 'localhost:8001/DartWeb/json';
  String realm = '杜隆坦';
  String account = 'watanodk';
  String url = Uri.encodeFull('http://${region}/api/wow/character/${realm}/${account}?fields=items');

  print(url);
  var itemTypes = ['head','neck','shoulder','back','chest','shirt','tabard','wrist','hands','waist','legs','feet','finger1','finger2','trinket1','trinket2','mainHand'];
  getUrl(url, (String data){
    var info = JSON.decode(data);
    print(info['realm']);
  });
}