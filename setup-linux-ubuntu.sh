sudo npm install -g npm
sudo npm install -g node-gyp
sudo npm install -g electron-packager
sudo npm install -g flatten-packages
sudo npm install -g less

export npm_config_runtime=electron
export npm_config_target=0.30.3
export npm_config_arch=x64

export YGGDRASIL_VERSION=0.7.0
export YGGDRASIL_NAME=Yggdrasil
export DEPLOY_DIR=../yggdrasil-deploy

rm -rf node_modules

npm install --production

flatten-packages
lessc ./css/styles.less ./css/styles.css
electron-packager . $YGGDRASIL_NAME --platform=linux --arch=$npm_config_arch --version=$npm_config_target --overwrite --out=$DEPLOY_DIR --app-version=$YGGDRASIL_VERSION --version-string.CompanyName = "Nordic Semiconductor ASA" --version-string.LegalCopyright = "Nordic Semiconductor ASA" --version-string.FileDescription = "" --version-string.OriginalFilename = "" --version-string.FileVersion = "$YGGDRASIL_VERSION" --version-string.ProductVersion = "$YGGDRASIL_VERSION" --version-string.ProductName = "$YGGDRASIL_NAME" --version-string.InternalName = "$YGGDRASIL_NAME"
