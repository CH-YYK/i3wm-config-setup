SH=$(which bash)

save: save_configs.sh
	$(SH) ./save_configs.sh

deploy: deploy_configs.sh
	$(SH) ./deploy_configs.sh
