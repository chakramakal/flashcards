PACKS = $(notdir $(patsubst %/,%,$(wildcard doc/*/)))

.PHONY: all clean

all:
	@mkdir -p out
	@for p in $(PACKS); do \
		src/apkg doc/$$p out/$$p.apkg || exit 1; \
	done

clean:
	rm -rf out
