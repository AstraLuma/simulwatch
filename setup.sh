#!/bin/sh
cd /vagrant

echo "Installing..."
apt-get install --yes nginx rabbitmq-server make

echo "Configuring..."
export PATH=$PATH:/usr/sbin
rabbitmq-plugins enable rabbitmq_web_stomp_examples

make -B config
rm /etc/nginx/sites-enabled/default
ln -s /vagrant/nginx/app.conf /etc/nginx/sites-enabled

echo "(Re)Starting services..."
service nginx restart
service rabbitmq-server restart
