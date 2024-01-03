# HY-A
## 1、MySQL部署
> 先设置docker-compose.yml文件中的`{数据库密码}` `{数据库端口}`

```sh
cd MySQL
docker-compose up -d
```
- 数据库初始化
> 执行对应的 `数据库初始化SQL`

## 2、Redis部署
> 先设置docker-compose.yml文件中的`{Redis密码}`

```sh
cd Redis
docker-compose up -d
```

## 3、MinIO部署
> 先设置docker-compose.yml文件中的 `{MinIO用户名}` `{MinIO密码}` `{HY-A内网IP}` `{数据库端口}` `{数据库密码}` `{HY-A公网IP}` `{一级域名}`
>
> 可以先部署 `minio`并创建BUCKET `huiyong`， 获取到 `{MINIO_ACCESS_KEY}`、`{MINIO_ACCESS_SECRET}` 后，再部署 `app-minio`
> 
> 关于`{MINIO_ACCESS_KEY}`与`{MINIO_ACCESS_SECRET}`的获取，请[参考文章](https://huiyong.online/s/9gtQd7dqZ)中【创建授权key】：
> 

```sh
cd MinIO
docker-compose up -d
```