#!/bin/bash

wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb http://packages.elastic.co/elasticsearch/1.7/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch.list
sudo apt-get update
sudo apt-get install -y openjdk-7-jre
sudo apt-get install -y elasticsearch
sudo /usr/share/elasticsearch/bin/plugin -install elasticsearch/elasticsearch-cloud-aws/2.7.1
sudo /usr/share/elasticsearch/bin/plugin -install lmenezes/elasticsearch-kopf/1.2
sudo update-rc.d elasticsearch defaults 95 10
sudo rm -f /etc/elasticsearch/elasticsearch.yml
