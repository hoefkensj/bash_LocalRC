NAME=bash_LocalRC
SRC=src
ETC=src/etc
DST=/opt/local/config/rc
F0=000_bashrc.conf
F1=101_opts.conf
F2=201_binds.conf
F3=301_exports.conf
F4=311_exports_wine.conf
F5=401_colors.conf
F6=411_dir.colors
F7=501_history.conf
F8=502_history.conf
F9=601_aliases.conf
F999=999_cleanup.conf
FZZZ=ZZZ_examples.doc

install:
	chmod 775  -R $(SRC)/${NAME}
	install -Dv $(SRC)/${NAME}/$(F0) $(DST)/bashrc.d/$(F0)
	install -Dv $(SRC)/${NAME}/$(F1) $(DST)/bashrc.d/$(F1)
	install -Dv $(SRC)/${NAME}/$(F2) $(DST)/bashrc.d/$(F2)
	install -Dv $(SRC)/${NAME}/$(F3) $(DST)/bashrc.d/$(F3)
	install -Dv $(SRC)/${NAME}/$(F4) $(DST)/bashrc.d/$(F4)
	install -Dv $(SRC)/${NAME}/$(F5) $(DST)/bashrc.d/$(F5)
	install -Dv $(SRC)/${NAME}/$(F6) $(DST)/bashrc.d/$(F6)
	install -Dv $(SRC)/${NAME}/$(F7) $(DST)/bashrc.d/$(F7)
	install -Dv $(SRC)/${NAME}/$(F8) $(DST)/bashrc.d/$(F8)
	install -Dv $(SRC)/${NAME}/$(F9) $(DST)/bashrc.d/$(F9)	
	install -Dv $(SRC)/${NAME}/$(F999) $(DST)/bashrc.d/$(F999)
	install -Dv $(SRC)/${NAME}/$(FZZZ) $(DST)/bashrc.d/$(FZZZ)
	install -Dv $(ETC)/bash_LocalRC.sh /etc/bash/bashrc.d/

uninstall:
	rm -vf $(DST)/bashrc.d/$(F0)
	rm -vf $(DST)/bashrc.d/$(F1)
	rm -vf $(DST)/bashrc.d/$(F2)
	rm -vf $(DST)/bashrc.d/$(F3)
	rm -vf $(DST)/bashrc.d/$(F4)
	rm -vf $(DST)/bashrc.d/$(F5)
	rm -vf $(DST)/bashrc.d/$(F6)
	rm -vf $(DST)/bashrc.d/$(F7)
	rm -vf $(DST)/bashrc.d/$(F8)
	rm -vf $(DST)/bashrc.d/$(F9)
	rm -rvf $(DST)/bashrc.d
	rm -vf /etc/bash/bashrc.d/bash_LocalRC.sh














