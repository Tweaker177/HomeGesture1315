include $(THEOS)/makefiles/common.mk

TWEAK_NAME = HomeGesture1315
HomeGesture1315_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += homegesture1315
include $(THEOS_MAKE_PATH)/aggregate.mk
