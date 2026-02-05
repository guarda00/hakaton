mkdir -p /terminus && cd /terminus
curl -L https://github.com/pantheon-systems/terminus/releases/download/3.4.0/terminus.phar --output terminus
chmod +x terminus
./terminus self:update
ln -s /terminus/terminus /usr/local/bin/terminus