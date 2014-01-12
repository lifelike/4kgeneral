include make.$(shell hostname -s)

all: G.jar

%.raw.jar: %.class
	zip $@ $< && \
	echo "Original JAR file size:" && \
	wc -c $@

%.pro.jar: %.raw.jar
	$(PROGUARD) -libraryjars $(JAVAJAR) \
	-keep public class $(@:.pro.jar=) \
	-injars $< -outjars $@ &&\
	wc -c $@

# see http://wiki.java.net/bin/view/Games/4KGamesDesign
%.jar: %.pro.jar
	mkdir -p tmp && \
	d="tmp/$(<:.jar=.tmp)-7" && \
	mkdir -p $$d && \
	unzip -d $$d $< && \
	cd $$d && \
	7z a -tzip -mx=9 $$OLDPWD/$@ * && \
	cd - && \
	$(RM) -r $$d && \
	wc -c $@

%.images.h: %.png
	$(PYTHON) ./png_to_java_data.py $< $@

debug/%.java: %.cppjava %.images.h
	cp $(^:.cppjava=.images.h) debug/ && \
	$(CPP) -P -DJAVA -DDEBUG $< $@

printable/%.java: %.cppjava %.images.h
	cp $(^:.cppjava=.images.h) debug/ && \
	$(CPP) -P -DJAVA -DPRINTABLE $< $@

%.java: %.cppjava %.images.h
	$(CPP) -P -DJAVA -DAPPLET $< $@

src/%.c: %.cppjava %.images.h
	$(CPP) $(CFLAGS) -P -DC -DSDL $< $@

general4c: src/G.c
	mkdir -p build && cd build && cmake .. && make

debug/%.class: debug/%.java
	javac -d debug $<

printable/%.class: printable/%.java
	javac -d printable $<

%.class: %.java
	javac -target 1.5 -source 1.5 $<

clean:
	$(RM) -r *.class *~ *.jar *.java *.images.h tmp/* debug/*

.PHONY: clean all

