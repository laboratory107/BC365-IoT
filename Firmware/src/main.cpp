#include <HTTPClient.h>
#include <WiFi.h>
#include <ArduinoJson.h>
#include "DHTesp.h"

const char* AP_SSID = "TheLabIOT";
const char* AP_PWD = "Yaay!ICanTalkNow";

const char* BC_USER = ""; // Same as the username
const char* BC_PASS = ""; // Users -> web access key

const char* API_URL = "http://erp.foi.hr:19148/BC_P/ODataV4/IoTApiTest_AddData";
int timeout = 0;

const int DHT_PIN = 21;
const int LIGHT_PIN = 35;

DHTesp dht;

void setup() 
{
  Serial.begin(115200);
 
  WiFi.mode(WIFI_MODE_STA);
  WiFi.begin(AP_SSID, AP_PWD);   

  while (WiFi.status() != WL_CONNECTED) 
  {
    Serial.print('.');

    timeout++;
    if (timeout == 10) 
      ESP.restart();

    delay(500);
  }

  dht.setup(DHT_PIN, DHTesp::DHT22);
}
 
String getData(float temp, float humidity, int light) 
{
  String output;

  StaticJsonDocument<48> doc;

  doc["temperature"] = temp;
  doc["humidity"] = humidity;
  doc["luminosity"] = light;

  serializeJson(doc, output);

  return output;
}

void loop() 
{
   if (WiFi.status() == WL_CONNECTED) {
    HTTPClient httpClient;
     
    httpClient.begin(API_URL);
    httpClient.setAuthorization(BC_USER, BC_PASS);
    httpClient.addHeader("Content-Type", "application/json");         
    
    float humidity = dht.getHumidity();
    float temperature = dht.getTemperature();
    int luminosity = analogRead(LIGHT_PIN);

    Serial.println(temperature);
    Serial.println(luminosity);

    String requestBody = getData(temperature, humidity, luminosity);
    Serial.println(requestBody);
 
    int statusCode = httpClient.POST(requestBody);
    if(statusCode == HTTP_CODE_OK) {
      Serial.println("Successful request.");
    }
    else {
      Serial.printf("Got HTTP status: %d", statusCode);
      String payload = httpClient.getString();
      Serial.println(payload);
    }

    httpClient.end();
  }
 
  delay(3000);
}