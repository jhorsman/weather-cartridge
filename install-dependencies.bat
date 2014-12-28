@echo off
rem Install the SDL Tridion Content Delivery API libraries used in this project and its third party libraries in the local Maven repository.

set install-dversion=7.1.0

echo Installing SDL Tridion 2013 SP1 CD libraries into the local Maven repository
echo   cd_ambient.jar
call mvn -q install:install-file -DgroupId=com.tridion -DartifactId=cd_ambient         -Dversion=%install-dversion% -Dpackaging=jar -Dfile="tridion-2013-sp1-libs\Content Delivery\roles\api\java\lib\cd_ambient.jar"
echo   cd_core.jar
call mvn -q install:install-file -DgroupId=com.tridion -DartifactId=cd_core            -Dversion=%install-dversion% -Dpackaging=jar -Dfile="tridion-2013-sp1-libs\Content Delivery\roles\api\java\lib\cd_core.jar"

echo Installing third-party libraries into the local Maven repository
echo   slf4j-api.jar
call mvn -q install:install-file -DgroupId=com.tridion.third-party -DartifactId=slf4j-api -Dversion=%install-dversion% -Dpackaging=jar -Dfile="tridion-2013-sp1-libs\Content Delivery\roles\api\java\third-party-lib\slf4j-api.jar"
echo   logback-classic.jar
call mvn -q install:install-file -DgroupId=com.tridion.third-party -DartifactId=logback-classic -Dversion=%install-dversion% -Dpackaging=jar -Dfile="tridion-2013-sp1-libs\Content Delivery\roles\api\java\third-party-lib\logback-classic.jar"
echo   logback-core.jar
call mvn -q install:install-file -DgroupId=com.tridion.third-party -DartifactId=logback-core -Dversion=%install-dversion% -Dpackaging=jar -Dfile="tridion-2013-sp1-libs\Content Delivery\roles\api\java\third-party-lib\logback-core.jar"

echo Done!

pause