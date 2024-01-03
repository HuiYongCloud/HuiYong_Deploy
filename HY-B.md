# HY-B
## 1、MQ部署
> 先设置broker.conf文件中的 `{HY-B公网ip}`
```sh
cd MQ
docker-compose up -d
```
- MQ面板部署
```sh
cd rocketmq-dashboard
./rocketmq-dashboard.sh start
```

## 2、ELK部署（[https://github.com/sherifabdlnaby/elastdocker](https://github.com/sherifabdlnaby/elastdocker)）
> 先设置.env文件中的 `{elastic密码}`
- 部署
```sh
cd ELK
# 如果是第一次运行，需要生成SSL认证，运行setup成功后会出现一个secrets文件夹
make setup
# 启动
make elk
```