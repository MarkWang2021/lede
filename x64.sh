echo 'Merge x64.config common.config to .config'
cp x64.config .config
cat common.config >> .config

echo 'Make defconfig'
make defconfig

echo 'Modify custom config'
sed -i 's/CONFIG_PACKAGE_luci-app-passwall_INCLUDE_v2ray-plugin=y/# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_v2ray-plugin is not set/g' .config
sed -i 's/CONFIG_PACKAGE_v2ray-plugin=y/# CONFIG_PACKAGE_v2ray-plugin is not set/g' .config
sed -i 's/CONFIG_v2ray-plugin_INCLUDE_GOPROXY=y/# CONFIG_v2ray-plugin_INCLUDE_GOPROXY is not set/g' .config

echo 'Copy to x86-64.config'
cp .config x86-64.config


