// Inclui a biblioteca DHT que fornece as funções para ler o sensor de umidade e temperatura
#include "DHT.h"
#define TIPO_SENSOR DHT11
const int PINO_SENSOR_DHT11 = A0;

DHT sensorDHT(PINO_SENSOR_DHT11, TIPO_SENSOR);


// Inicializa o sensor DHT

void setup() {
  Serial.begin(9600);   
  sensorDHT.begin();    
}

void loop() {
  float umidade = sensorDHT.readHumidity();          
  float temperatura = sensorDHT.readTemperature();   

 
  // Verifica se a leitura da temperatura ou umidade retornou um valor inválido (NaN)

  if (isnan(temperatura) || isnan(umidade)) {           
    Serial.println("Erro ao ler os dados do sensor");    
  } 
  else { 

    Serial.print("Umidade:");        
    Serial.print(umidade);           // Imprime o valor da umidade
    Serial.print("\t");              
    Serial.print("Temperatura:");    // Imprime a string "Temperatura:"
    Serial.print(temperatura);       
    Serial.println();                
  }

  
  delay(1000); 
}
