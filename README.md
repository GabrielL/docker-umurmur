docker-umurmur
==============

	docker run -e UMURMUR_PASSWORD=$PASSWORD \
		-p 64738:64738/udp -p 64738:64738/tcp \
		umurmur
