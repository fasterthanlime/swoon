
OOC_FLAGS := -v -g
ROCK := rock

all:
	$(ROCK) $(OOC_FLAGS)

android:
	rm -rfv android/assets/*
	cp -rfv assets/ android/assets/
	$(ROCK) $(OOC_FLAGS) -driver=android --outpath=android/jni

clean:
	$(ROCK) -x

.PHONY: android desktop clean

