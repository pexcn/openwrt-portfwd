include $(TOPDIR)/rules.mk

PKG_NAME:=portfwd
PKG_VERSION:=20191118
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/rssnsj/portfwd.git
PKG_SOURCE_VERSION:=3a374fe4487c4a4d380656ef26d13026d490c967
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)/$(PKG_SOURCE_SUBDIR)

PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

PKG_LICENSE:=GPL-3.0
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=pexcn <i@pexcn.me>

include $(INCLUDE_DIR)/package.mk

define Package/portfwd
	SECTION:=net
	CATEGORY:=Network
	TITLE:=User-space TCP/UDP port forwarding services
	URL:=https://github.com/rssnsj/portfwd
endef

define Package/portfwd/description
User-space TCP/UDP port forwarding services.
endef

#define Package/portfwd/conffiles
#/etc/config/portfwd
#endef

MAKE_PATH := src

define Package/portfwd/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/tcpfwd $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/udpfwd $(1)/usr/bin
endef

$(eval $(call BuildPackage,portfwd))
