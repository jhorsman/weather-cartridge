# Random Weather Cartridge
The Random Cartridge is an example (SDL Tridion) ADF cartridge. It is short, easy to read and gets you started to create your own cartridge for a SDL SmartTarget implemenation.

This cartridge creates three claims with random values. A real cartridge would probably lookup the weather at a third party service.
- taf:claim:ambientdata:weather:temperatureInCelsius; random temperture
- taf:claim:ambientdata:weather:temperatureInFahrenheit; the temperature in Celsius converted to Fahrenheit
- taf:claim:ambientdata:weather:type; the weather type based on the temperature