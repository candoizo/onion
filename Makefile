GO_EASY_ON_ME = 1
ARCHS = armv7 arm64
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = onion
onion_FILES = Tweak.xm
onion_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	SUBPROJECTS += resources
	install.exec "killall -9 SpringBoard"
