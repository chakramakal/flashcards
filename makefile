.PHONY: all clean release deploy

all:
	@mkdir -p out
	@for d in doc/*/; do \
		p=$$(basename "$$d"); \
		src/package "doc/$$p" "out/$$p.apkg" || exit 1; \
	done

clean:
	rm -rf out

release: all
	src/release out

deploy:
	src/deploy out
