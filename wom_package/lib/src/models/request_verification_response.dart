class RequestVerificationResponse {
  static String REGISTRY_URL = "RegistryUrl";
  static String NONCE = "Nonce";
  static String OTC = "Otc";
  static String PASSWORD = "Password";

  String registryUrl;
  String nonce;
  String otc;
  String password;
  String error;

  RequestVerificationResponse(this.error);

  RequestVerificationResponse.fromMap(Map<String, dynamic> map)
      : this.registryUrl = map[REGISTRY_URL],
        this.nonce = map[NONCE],
        this.password = map[PASSWORD],
        this.otc = map[OTC];
}

enum RequestStatus {
  DRAFT,
  COMPLETE,
  ERROR,
}