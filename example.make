PROGUARD=java -jar /usr/share/java/proguard.jar
JAVAJAR=/usr/lib/jvm/java-7-oracle/jre/lib/rt.jar
PYTHON=python2
CPP=cpp
CFLAGS=`sdl2-config --cflags` -Wall -g \
                    -DSDL -DC -std=c99
LDFLAGS=`sdl2-config --libs`
