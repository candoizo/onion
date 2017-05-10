ARCHS = armv7 arm64
TARGET = iphone:9.2
export THEOS_DEVICE_IP=localhost

export THEOS_DEVICE_PORT=2222
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = onion
onion_FILES = Tweak.xm
onion_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
after-install::
	@echo "straight blessings to sticktron, thanks to him onions don't make me cry anymore! -candoizo"
	install.exec "killall -9 SpringBoard"
