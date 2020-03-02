class ResponseConfirmPay {
  static const ACK = 'ackUrl';
  String ack;

  ResponseConfirmPay.fromMap(Map<String, dynamic> map) : ack = map[ACK];
}
