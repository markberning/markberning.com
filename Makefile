build:
	rm -rf public
	hugo

deploy: build
	aws s3 sync public/ s3://markberning.com --acl public-read --delete
	aws configure set preview.cloudfront true
	aws cloudfront create-invalidation --distribution-id E1HSXRTCRZ4GX6 --paths '/*'
