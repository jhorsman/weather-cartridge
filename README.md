# Random Weather Cartridge
The Random Cartridge is an example (SDL Tridion) ADF cartridge. It is short, easy to read and gets you started to create your own cartridge for a SDL SmartTarget implementation.

This cartridge creates three claims with random values. A real cartridge would probably lookup the weather at a third party service.
- *taf:claim:ambientdata:weather:temperatureInCelsius*; random temperture
- *taf:claim:ambientdata:weather:temperatureInFahrenheit*; the temperature in Celsius converted to Fahrenheit
- *taf:claim:ambientdata:weather:type*; the weather type based on the temperature

The SDL Tridion Ambient Data Framework (ADF) API is in the Tridion API, the SmartTarget API is not needed. ADF Cartridges are built in Java and can be used on both the JAVA and .NET version of the Tridion API.

Take the following steps to build this project.
1. Have a JAVA GUI and Maven installed on your machine
2. Put the missing SDL Tridion 2013 SP1 JARs in tridion-2013-sp1-libs, look for the two * missing-jars.txt*.
3. Run *install-dependencies.bat* to add the Tridion and third party JARs
4. Build the project with Maven

*Optionally, to test or debug the cartridge*:
1. Run the project with the Jetty Maven plugin in the Maven project
2. Browse to http://localhost:8080/ to view the ADF claims set by the cartridge

