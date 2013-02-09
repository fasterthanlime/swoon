
OOC_FLAGS := -v -g
ROCK := rock

desktop:
	$(ROCK) $(OOC_FLAGS)

osx:
	OOC_LIBS=${OOC_LIBS}/ooc-sdl2/uses/osx:${OOC_LIBS} $(ROCK) $(OOC_FLAGS)

android:
	cp -rfv assets/* android/assets/
	OOC_LIBS=${OOC_LIBS}/ooc-sdl2/uses/mobile:${OOC_LIBS}/deadlogger/uses/mobile:${OOC_LIBS} $(ROCK) $(OOC_FLAGS) -driver=android --outpath=android/jni

clean:
	$(ROCK) -x

.PHONY: android desktop clean

