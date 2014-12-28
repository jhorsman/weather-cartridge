package example.tridion.adfsandbox.WeatherCartridge;

import com.tridion.ambientdata.AmbientDataException;
import com.tridion.ambientdata.claimstore.ClaimStore;
import com.tridion.ambientdata.processing.AbstractClaimProcessor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.net.URI;
import java.util.Random;

public class WeatherClaimProcessor extends AbstractClaimProcessor {
    public static URI weatherTypeClaimUri = URI.create("taf:claim:ambientdata:weather:type");
    public static URI temperatureCelsiusClaimUri = URI.create("taf:claim:ambientdata:weather:temperatureInCelsius");
    public static URI temperatureFahrenheitClaimUri = URI.create("taf:claim:ambientdata:weather:temperatureInFahrenheit");

    private static Logger log = LoggerFactory.getLogger(WeatherClaimProcessor.class);

    @Override
    public void onSessionStart(ClaimStore claimStore) throws AmbientDataException {
        log.debug("WeatherClaimProcessor onSessionStart called");
    }

    @Override
    public void onRequestStart(ClaimStore claimStore) throws AmbientDataException {
        log.debug("WeatherClaimProcessor onRequestStart called");

        if(claimStore.get(weatherTypeClaimUri) == null) {
            int tempCelsius = getRandomTempleratureInCelsius();

            claimStore.put(temperatureCelsiusClaimUri, tempCelsius);
            log.debug(temperatureCelsiusClaimUri.toString() + " set to " + tempCelsius);

            int tempFahrenheit = convertCelsiusToFahrenheit(tempCelsius);
            claimStore.put(temperatureFahrenheitClaimUri, tempFahrenheit);
            log.debug(temperatureFahrenheitClaimUri.toString() + " set to " + tempFahrenheit);

            String weatherType = getWeatherType(tempCelsius);
            claimStore.put(weatherTypeClaimUri, weatherType);
            log.debug(weatherTypeClaimUri.toString() + " set to " + weatherType);
        }
    }

    @Override
    public void onRequestEnd(ClaimStore claimStore) throws AmbientDataException {
        log.debug("WeatherClaimProcessor onRequestEnd called");
    }

    private int getRandomTempleratureInCelsius() {
        Random generator = new Random();
        return generator.nextInt(10) + 20;
    }

    private int convertCelsiusToFahrenheit(float tempCelsius) {
        float tempFahrenheitPrecise = (tempCelsius * 180 / 100) + 32;
        return (int) Math.round(tempFahrenheitPrecise);
    }

    private String getWeatherType(int tempCelsius) {
        String weatherType = "Sunny";
        if(tempCelsius < 25)
            weatherType = "Partly Cloudy";
        return weatherType;
    }
}
