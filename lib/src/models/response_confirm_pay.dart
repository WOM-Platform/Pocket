class ResponseConfirmPay {
  static const ACK = 'AckUrl';
  String ack;

  ResponseConfirmPay.fromMap(Map<String, dynamic> map) : ack = map[ACK];
}
