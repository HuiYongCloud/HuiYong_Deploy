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
