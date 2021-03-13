class Environment {
  static String baseURL = 'https://01ed430f1bf8.ngrok.io/backend/';

  String eventURL() {
    return baseURL + 'events';
  }

  String sliderURL() {
    return baseURL + 'slider';
  }

  String featureMerchantURL() {
    return baseURL + 'featured-stores';
  }

  String authBase() {
    return baseURL + 'consumer';
  }
}
