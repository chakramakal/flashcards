.PHONY: all clean deploy

all:
	@mkdir -p out
	@for d in doc/*/; do \
		p=$$(basename "$$d"); \
		src/apkg "doc/$$p" "out/$$p.apkg" || exit 1; \
	done

clean:
	rm -rf out

deploy: all
	src/deploy out
