# 运维说明

- nginx引入多配置文件
```
http {
    ***
    include ./A-Nginx/*.conf;
}
```

- 如果你的一级域名为 `aaa.com` 请把conf文件对应调整下

| 文件名            | 修改为（参考）             |
|----------------|---------------------|
| kibana.一级域名.conf | kibana.aaa.com.conf |
| admin.一级域名.conf  | admin.aaa.com.conf  |
| img.一级域名.conf    | img.aaa.com.conf    |
| 一级域名.conf        | aaa.com.conf        |

> 修改conf内的 `{HY-A公网ip}` `{HY-B公网ip}` `一级域名`
> 
> 配置对应域名https的ssl_certificate与ssl_certificate_key路径