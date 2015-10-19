
connect-test-app:
	grunt build-dist watch:build-dist &
	(cd testApp && \
		steroids connect \
			--watch=../dist \
			--no-qrcode \
			--livereload \
			--simulate)

connect-test-spec-app:
	grunt build-dist watch:build-dist &
	(cd testSpecApp && \
		steroids connect \
			--watch=../dist \
			--no-qrcode \
			--livereload \
			--simulate)
