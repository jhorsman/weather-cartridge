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
            claimStore.put(weatherTypeClaimUri, "Sunny");
            log.debug(weatherTypeClaimUri.toString() + " set to Sunny");

            Random generator = new Random();
            int tempCelsius = generator.nextInt(10) + 20;

            claimStore.put(temperatureCelsiusClaimUri, tempCelsius);
            log.debug(temperatureCelsiusClaimUri.toString() + " set to " + tempCelsius);

            float tempFahrenheitPrecise = ((float) tempCelsius * 180 / 100) + 32;
            int tempFahrenheit = (int) Math.round(tempFahrenheitPrecise);
            claimStore.put(temperatureFahrenheitClaimUri, tempFahrenheit);
            log.debug(temperatureFahrenheitClaimUri.toString() + " set to " + tempFahrenheit);
        }
    }
}
