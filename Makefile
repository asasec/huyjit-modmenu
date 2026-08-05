TARGET = iphone:clang:latest:14.0
ARCHS = arm64 arm64e

DEBUG = 0
FINALPACKAGE = 1
FOR_RELEASE = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = 34306jit

$(TWEAK_NAME)_FRAMEWORKS = UIKit Foundation Security QuartzCore CoreGraphics CoreText AVFoundation Accelerate GLKit SystemConfiguration GameController

# C++ standardını ve uyarı bayraklarını güncelleyin (ImGui için c++17 veya c++20 önerilir)
$(TWEAK_NAME)_CCFLAGS = -std=c++17 -frtti -fexceptions -DNDEBUG -Wno-nontrivial-memcall -Wno-deprecated-declarations
$(TWEAK_NAME)_CFLAGS = -fobjc-arc -Wno-deprecated-declarations -Wno-unused-variable -Wno-unused-value

# Dobby hook için gerekli kütüphane yolu veya tanımı
$(TWEAK_NAME)_OBJ_FILES = 5Toubun/libdobby.a

$(TWEAK_NAME)_FILES = ImGuiDrawView.mm $(wildcard Esp/*.mm) $(wildcard Esp/*.m) $(wildcard IMGUI/*.cpp) $(wildcard IMGUI/*.mm)
