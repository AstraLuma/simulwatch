simulwatch
==========
Have a party with your video library

Requirements
------------
* RabbitMQ with [Web-Stomp plugin](https://www.rabbitmq.com/web-stomp.html)
* CouchDB
* Nginx

Installation
------------
1. Install everything
2. Run `make`
3. ((bunch of configuration related stuff))
  * Nginx: Pretty much just overwrite
  * CouchDB: Symlink to config directory
  * RabbitMQ:
  	1. `rabbitmq-plugins enable rabbitmq_web_stomp_examples`
