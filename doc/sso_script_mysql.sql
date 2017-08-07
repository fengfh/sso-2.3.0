drop table if exists SSO_APP_SPECIFIED_SECRET;

drop table if exists SSO_CLIENT_HOST;

drop table if exists SSO_TICKET;

/*==============================================================*/
/* Table: SSO_APP_SPECIFIED_SECRET                              */
/*==============================================================*/
create table SSO_APP_SPECIFIED_SECRET
(
   ID                   varchar(128) not null comment '主键',
   NAME                 varchar(128) comment '名称',
   SECRET               varchar(1024) comment '应用专用密码',
   USER_ID              varchar(128) comment '用户ID',
   CLIENT_ID            varchar(128) comment '客户端应用ID',
   CREATE_TIME          datetime comment '创建时间',
   LAST_USED_TIME       datetime comment '最后使用时间',
   EXPIRES              varchar(128) comment '过期时间',
   SECRET_UNIQUE        int comment '应用专用密码是否唯一',
   primary key (ID)
);

alter table SSO_APP_SPECIFIED_SECRET comment '应用专用密码';

/*==============================================================*/
/* Table: SSO_CLIENT_HOST                                       */
/*==============================================================*/
create table SSO_CLIENT_HOST
(
   ID                   varchar(128) not null,
   CODE                 varchar(128),
   NAME                 varchar(128),
   MEMO                 varchar(4000),
   SECRET               varchar(128),
   IP                   varchar(128),
   HOME                 varchar(4000),
   LOGOUT_URL           varchar(4000),
   CLIENT_HOST_TYPE     varchar(128),
   PRIVATE_KEY          varchar(4000),
   PUBLIC_KEY           varchar(4000),
   primary key (ID)
);

alter table SSO_CLIENT_HOST comment 'SSO客户端';

/*==============================================================*/
/* Table: SSO_TICKET                                            */
/*==============================================================*/
create table SSO_TICKET
(
   ID                   varchar(128) not null,
   TICKET_ID            varchar(128),
   TICKET               longblob,
   TICKET_TYPE          varchar(128),
   CREATE_TIME          datetime,
   HOST_NAME            varchar(4000),
   primary key (ID)
);

/*==============================================================*/
/* Index: IDX_SSO_TICKET_TICKET_ID                              */
/*==============================================================*/
create unique index IDX_SSO_TICKET_TICKET_ID on SSO_TICKET
(
   TICKET_ID
);

/*==============================================================*/
/* Table: SSO_LOGIN_LOG                                         */
/*==============================================================*/
create table SSO_LOGIN_LOG
(
   ID                   varchar(128) not null,
   TICKET_ID            varchar(128),
   LOGIN_TIME           datetime,
   PRINCIPAL_ID         varchar(128),
   AUTH_TYPE            varchar(256),
   IS_DESKTOP_LOGIN     int,
   RETURN_URL           varchar(4000),
   CLIENT_ID            varchar(128),
   HOST_NAME            varchar(4000),
   USER_AGENT_ADDR      varchar(128),
   primary key (ID)
);

/*==============================================================*/
/* Table: SSO_LOGOUT_LOG                                        */
/*==============================================================*/
create table SSO_LOGOUT_LOG
(
   ID                   varchar(128) not null,
   TICKET_ID            varchar(128),
   LOGOUT_TIME          datetime,
   RETURN_URL           varchar(4000),
   HOST_NAME            varchar(256),
   USER_AGENT_ADDR      varchar(128),
   primary key (ID)
);
