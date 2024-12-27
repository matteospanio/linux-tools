BIN_PATH = $$HOME/.local/bin

all: build

utils.sh: src/color_log.sh src/utils.sh
	cat src/color_log.sh src/utils.sh | sed '/#!*/d' > utils.sh

lt: utils.sh
	bash scripts/lt.sh

build: lt
	mkdir -p build
	cp utils.sh build/utils.sh
	cp lt build/lt

install: build
	cp build/lt $(BIN_PATH)
	chmod +x $(BIN_PATH)/lt
	cp docs/lt.man1 $$HOME/.local/share/man/man1/lt.1

uninstall:
	rm -f $(BIN_PATH)/lt
	rm -f $$HOME/.local/share/man/man1/lt.1

clean:
	rm -fr build utils.sh lt
