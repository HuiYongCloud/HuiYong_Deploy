# Nacos配置 
- 打开[http://{HY-C公网IP}:8848/nacos/](http://{HY-C公网IP}:8848/nacos/)
- 修改配置：huiyong-db-config.yaml
- 修改配置：huiyong-mq-config.yaml
- 修改配置：huiyong-redis-config.yaml

## 修改完了，需要将Api下的服务重启一下
```yaml
cd Api
docker-compose stop
docker-compose up -d
```