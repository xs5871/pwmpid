PREFIX=/usr/local
SYSTEMDLIB=/usr/lib/systemd

.PHONY: install uninstall shellcheck markdownlint

install:
	install -C -m 744 -o root pwmpid $(DESTDIR)$(PREFIX)/bin
	install -C -m 644 -o root pwmpid@.service $(DESTDIR)$(SYSTEMDLIB)/system
	install -C -m 655 -o root -d $(DESTDIR)/etc/pwmpid

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/pwmpid \
		$(DESTDIR)$(SYSTEMDLIB)/system/pwmpid@.service

shellcheck:
	shellcheck -x pwmpid

markdownlint:
	markdownlint .
