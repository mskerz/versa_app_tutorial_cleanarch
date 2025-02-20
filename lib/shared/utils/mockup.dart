
import 'dart:convert';

import 'package:crypto/crypto.dart';


class MockupAddress{
 

   String generateWalletAddress(String privateKey) {
  var bytes = utf8.encode(privateKey);
  var digest = sha256.convert(bytes);
  return "0x${digest.toString().substring(0, 40)}"; // เอาแค่ 40 ตัวเหมือน Ethereum Address
}


 String shortenAddress(String address, {int prefixLength =11, int suffixLength = 7}) {
  if (address.length <= prefixLength + suffixLength + 2) return address; // ไม่ย่อถ้าสั้นเกิน
  return '${address.substring(0, prefixLength + 2)}...${address.substring(address.length - suffixLength)}';
}

}


 
final mockupAddress =  MockupAddress();