#!/bin/bash -xe

# configure node.js repo
curl --silent --location https://rpm.nodesource.com/setup_8.x | bash -

# install node.js
yum install nodejs -y

# create systemd service
cat > /etc/systemd/system/nodejs-pipeline.service <<'EOF'
[Unit]
Description=Node.js App
After=network.target

[Service]
User=nobody
WorkingDirectory=/var/www/nodejs
ExecStart=/usr/bin/node index.js
Restart=always
RestartSec=500ms
StartLimitInterval=0

[Install]
WantedBy=multi-user.target
EOF

# reload systemd services
systemctl daemon-reload
systemctl enable nodejs-pipeline.service

# remove old directory
rm -rf /var/www/nodejs

# create directory node.js app
mkdir -p /var/www/nodejs 
