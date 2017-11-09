/**
   Arduino Real-Time Slack Bot

   Copyright (C) 2016, Uri Shaked.

   Licensed under the MIT License
*/

#include <Arduino.h>

#include <ESP8266WiFi.h>
#include <ESP8266WiFiMulti.h>
#include <ESP8266HTTPClient.h>

#include <WebSocketsClient.h>
#include <ArduinoJson.h>
//#include <Adafruit_NeoPixel.h>

#define SLACK_SSL_FINGERPRINT "AC 95 5A 58 B8 4E 0B CD B3 97 D2 88 68 F5 CA C1 0A 81 E3 6E" // If Slack changes their SSL fingerprint, you would need to update this
#define SLACK_BOT_TOKEN "xoxb-104689605813-Fxkzro0ZBqfsa6ILL6hdobfH" // Get token by creating new bot integration at https://my.slack.com/services/new/bot #define SLACK_BOT_TOKEN "xoxb-104689605813-Fxkzro0ZBqfsa6ILL6hdobfH" // Get token by creating new bot integration at https://my.slack.com/services/new/bot 
#define WIFI_SSID       "DVES_VP"
#define WIFI_PASSWORD   "dongvietdves"

#define LEDS_PIN        2
#define LEDS_NUMPIXELS  24
#define PIN_RELAY      12
#define RELAY_ON() digitalWrite(PIN_RELAY, HIGH)
#define RELAY_OFF() digitalWrite(PIN_RELAY, LOW)


ESP8266WiFiMulti WiFiMulti;
WebSocketsClient webSocket;

//Adafruit_NeoPixel pixels(LEDS_NUMPIXELS, LEDS_PIN, NEO_GRB + NEO_KHZ800);

long nextCmdId = 1;
bool connected = false;

/**
  Sends a ping message to Slack. Call this function immediately after establishing
  the WebSocket connection, and then every 5 seconds to keep the connection alive.
*/
void sendPing() {
  DynamicJsonBuffer jsonBuffer;
  JsonObject& root = jsonBuffer.createObject();
  root["type"] = "ping";
  root["id"] = nextCmdId++;
  String json;
  root.printTo(json);
  webSocket.sendTXT(json);
}

/**
  Input a value 0 to 255 to get a color value.
  The colors are a transition r - g - b - back to r.
*/

/**
  Animate a NeoPixel ring color change.
  Setting `zebra` to true skips every other led.
*/

/**
  Draws a rainbow :-)
*/


/**
  Looks for color names in the incoming slack messages and
  animates the ring accordingly. You can include several
  colors in a single message, e.g. `red blue zebra black yellow rainbow`
*/
void processSlackMessage(char *payload){
  if (strstr(payload, "\"on\"") != NULL) {
    Serial.printf("ON NEW OTA\r\n");
    //LED_ON();
    RELAY_ON();
  } else if (strstr(payload, "\"off\"") != NULL) {
    Serial.printf("OFF NEW OTA\r\n");
    //LED_OFF();
    RELAY_OFF();
  }
}
/**
  Called on each web socket event. Handles disconnection, and also
  incoming messages from slack.
*/
void webSocketEvent(WStype_t type, uint8_t *payload, size_t len) {
  switch (type) {
    case WStype_DISCONNECTED:
      Serial.printf("[WebSocket] Disconnected :-( \n");
      connected = false;
      break;

    case WStype_CONNECTED:
      Serial.printf("[WebSocket] Connected to: %s\n", payload);
      sendPing();
      break;

    case WStype_TEXT:
      Serial.printf("[WebSocket] Message: %s\n", payload);
      processSlackMessage((char*)payload);
      break;
  }
}

/**
  Establishes a bot connection to Slack:
  1. Performs a REST call to get the WebSocket URL
  2. Conencts the WebSocket
  Returns true if the connection was established successfully.
*/
bool connectToSlack() {
  // Step 1: Find WebSocket address via RTM API (https://api.slack.com/methods/rtm.start)
  HTTPClient http;
  http.begin("https://slack.com/api/rtm.start?token="SLACK_BOT_TOKEN, SLACK_SSL_FINGERPRINT);
  int httpCode = http.GET();

  if (httpCode != HTTP_CODE_OK) {
    Serial.printf("HTTP GET failed with code %d\r\n", httpCode);
    return false;
  }

  WiFiClient *client = http.getStreamPtr();
  client->find("wss:\\/\\/");
  String host = client->readStringUntil('\\');
  String path = client->readStringUntil('"');
  path.replace("\\/", "/");

  // Step 2: Open WebSocket connection and register event handler
  Serial.println("WebSocket Host=" + host + " Path=" + path);
  webSocket.beginSSL(host, 443, path, "", "");
  webSocket.onEvent(webSocketEvent);
  return true;
}

void setup() {
  Serial.begin(115200);
  Serial.setDebugOutput(true);

//  pixels.begin();

  WiFiMulti.addAP(WIFI_SSID, WIFI_PASSWORD);
  while (WiFiMulti.run() != WL_CONNECTED) {
    delay(100);
  }

  configTime(3 * 3600, 0, "pool.ntp.org", "time.nist.gov");
}

unsigned long lastPing = 0;

/**
  Sends a ping every 5 seconds, and handles reconnections
*/
void loop() {
  webSocket.loop();

  if (connected) {
    // Send ping every 5 seconds, to keep the connection alive
    if (millis() - lastPing > 5000) {
      sendPing();
      lastPing = millis();
    }
  } else {
    // Try to connect / reconnect to slack
    connected = connectToSlack();
    if (!connected) {
      delay(500);
    }
  }
}

