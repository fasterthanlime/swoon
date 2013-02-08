
OOC_FLAGS := -v
ROCK := rock

desktop:
	$(ROCK) $(OOC_FLAGS)

android:
	OOC_LIBS=${OOC_LIBS}/ooc-sdl2/uses/mobile:${OOC_LIBS}/deadlogger/uses/mobile:${OOC_LIBS} $(ROCK) $(OOC_FLAGS) -driver=android --outpath=android/jni

clean:
	$(ROCK) -x

.PHONY: android desktop clean

