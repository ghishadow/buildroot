################################################################################
#
# dtv-scan-tables
#
################################################################################

DTV_SCAN_TABLES_VERSION = cfc29758d1357b724f3bf27c3b1b277e242841fa
DTV_SCAN_TABLES_SITE = http://linuxtv.org/git/dtv-scan-tables.git
DTV_SCAN_TABLES_SITE_METHOD = git

# This package only contains the transponders data. This is not a 'work'
# as per traditional copyright, but just a collection of 'facts', so there's
# probably no license to apply to these data files.
# However, the package prominently contains the COPYING and COPYING.LIB
# license files (respectively for the GPLv2 and the LGPLv2.1), so we use
# that as the licensing information.
DTV_SCAN_TABLES_LICENSE = GPLv2 LGPLv2.1
DTV_SCAN_TABLES_LICENSE_FILES = COPYING COPYING.LIB

define DTV_SCAN_TABLES_INSTALL_TARGET_CMDS
	for f in atsc dvb-c dvb-s dvb-t; do \
		$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/share/dvb/$$f; \
		$(INSTALL) $(@D)/$$f/* $(TARGET_DIR)/usr/share/dvb/$$f; \
	done
endef

$(eval $(generic-package))
