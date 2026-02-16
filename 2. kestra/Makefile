
.PHONY: env-encode
env-encode:
	while IFS='=' read -r key value; do \
		echo "SECRET_$$key=$$(echo -n "$$value" | base64)"; \
	done < .env > .env_encoded
	echo "" >> .env_encoded
	echo SECRET_GCP_CREDS=$$(cat ./keys/credentials.json | base64 -w 0) >> .env_encoded
