.PHONY: pdf

pdf:
	podman run \
		--platform linux/amd64 \
		--rm \
		--privileged \
		--volume "$(PWD):/data/" \
		docker.io/pandoc/extra:edge \
		--template eisvogel \
		--output "./doc.pdf" \
		"./doc.md"
