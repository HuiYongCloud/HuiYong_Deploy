# 服务器配置

| 别名 | 类型 | CPU | 内存 | 网络 | 费用 |
| - | - | - | - | - | - |
| HY-A | ECS服务器	 | 2核 | 2GB | 3M | 阿里云99一年 |
| HY-B | 腾迅轻量 | 2核 | 4GB | 5M | 腾讯轻量540-700三年 |
| HY-C | 腾迅轻量 | 4核 | 4GB | 8M | 腾讯轻量540-700三年 |

# 获取部署配置
```sh
git clone https://gitee.com/HuiYongCloud/HuiYong_Deploy.git
```

# HY-A
## A.1、MySQL部署
> 先设置docker-compose.yml文件中的`{数据库密码}` `{数据库端口}`

```sh
cd MySQL
docker-compose up -d
```
- 数据库初始化
> 执行对应的 `数据库初始化SQL`

## A.2、Redis部署
> 先设置docker-compose.yml文件中的`{Redis密码}`

```sh
cd Redis
docker-compose up -d
```

## A.3、MinIO部署
> 先设置docker-compose.yml文件中的 `{MinIO用户名}` `{MinIO密码}` `{HY-A内网IP}` `{数据库端口}` `{数据库密码}` `{HY-A公网IP}`
>
> 关于`{MINIO_ACCESS_KEY}`与`{MINIO_ACCESS_SECRET}`的获取，请[参考文章](https://huiyong.online/s/9gtQd7dqZ)中【创建授权key】：

```sh
cd MinIO
docker-compose up -d
```

# HY-B
## B.1、MQ部署
> 先设置broker.conf文件中的 `{HY-B公网ip}`
```sh
cd Nacos
docker-compose up -d
```
- MQ面板部署

## B.2、ELK部署（[https://github.com/sherifabdlnaby/elastdocker](https://github.com/sherifabdlnaby/elastdocker)）
> 先设置.env文件中的 `{elastic密码}`
- 部署
```sh
cd ELK
# 如果是第一次运行，需要生成SSL认证，运行setup成功后会出现一个secrets文件夹
make setup
# 启动
make elk
```

# HY-C
```sh
# 创建docker网关
docker network create huiyong-net
```

## 1、Nacos部署
| 账号 | 密码 |
| - | - |
| nacos | nacos|

> 1、先设置docker-compose.yml文件中的 `{HY-A公网IP}` `{数据库端口}` `{数据库密码}`

```sh
cd Nacos
docker-compose up -d
```

- 访问地址
  http://{HY-C公网IP}:8848/nacos/

## 2、xxl-job部署
| 账号        | 密码     |
|-----------|--------|
| TaskAdmin | 123456 |

> 1、先设置docker-compose.yml文件中的 `{HY-A公网IP}` `{数据库端口}` `{数据库密码}` `{QQ邮箱}` `{授权码}`

```sh
cd xxl-job
docker-compose up -d
```

- 访问地址
  http://{HY-C公网IP}:20080/xxl-job-admin/

## 3、Api 服务部署
> 1、先设置.env文件中的
> `{校验秘钥：比如：12345678AAABBB}`
> `{HY-B公网IP}`
> `{ES的Key}`
> `{QQ邮箱}`
> `{授权码}`
> `{密码加解密AesKey：比如：1234567891234567}`
>
> 2、将`secrets/certs/ca/ca.crt`文件替换掉`es/es_ca.crt`，如果不部署ELK，可以不管这个。
```sh
cd Api
docker-compose up -d
```

# 更多
- [账号说明](./5、账号说明.md)
- [运维说明](./4、Admin运维菜单.md)
