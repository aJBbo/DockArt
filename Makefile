ARCHS = armv7 armv7s arm64 arm64e
GO_EASY_ON_ME = 1

THEOS_DEVICE_IP = 192.168.1.89

include /opt/theos/makefiles/common.mk

TWEAK_NAME = DockArt
DockArt_FILES = Tweak.xm
DockArt_FRAMEWORKS = UIKit
DockArt_LDFLAGS += -Wl,-segalign,4000
DockArt_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += dockart
include $(THEOS_MAKE_PATH)/aggregate.mk


install2::
		install2.exec
