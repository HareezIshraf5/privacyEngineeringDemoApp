import 'package:encrypt/encrypt.dart' as encrypt;
//import 'package:flutter/cupertino.dart';

class MyEncryptionDecryption {
  //AES

  static final key = encrypt.Key.fromUtf8(
      '1234123456789878'); //encrypt.Key.fromLength(1234123456789878);
  static final iv = encrypt.IV.fromUtf8('1234567898765432');
  static final encrypter = encrypt.Encrypter(encrypt.AES(key));

  static encryptAES(text) {
    final encrypted = encrypter.encrypt(text, iv: iv);

    print(encrypted.bytes);
    print(encrypted.base16);
    print(encrypted.base64);
    return encrypted;
  }

  static decryptAES(text) {
    final encrypted = encrypt.Encrypted.fromBase64(text);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);

    print(decrypted);

    return decrypted;
  }
}
