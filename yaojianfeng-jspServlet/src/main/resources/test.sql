create table if not exists sys_user
(
    user_id              varchar(255) not null comment '用户id'
        primary key,
    login_name           varchar(255) not null comment '登录名',
    user_name            varchar(255) not null comment '用户名称',
    password             varchar(255) not null comment '登录密码',
    valid                char         not null comment '软删除标识，Y/N',
    limited_ip           varchar(255) null comment '限制允许登录的IP集合',
    expired_time         datetime     null comment '账号失效时间，超过时间将不能登录系统',
    last_change_pwd_time datetime     not null comment '最近修改密码时间，超出时间间隔，提示用户修改密码',
    limit_multi_login    char         not null comment '是否允许账号同一个时刻多人在线，Y/N',
    create_time          datetime     not null comment '创建时间',
    update_time          datetime     not null comment '修改时间'
)
    comment '系统用户表';
create table if not exists emp
(
    empno int         not null,
    ename varchar(64) null,
    job   varchar(64) null,
    sal   bigint      null
);

