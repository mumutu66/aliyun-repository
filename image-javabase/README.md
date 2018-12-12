# alpine jre 8 基础镜像

Alpine 版本为 3.8
JRE 版本为 JavaSE8u181

如果容器没有指定 limit 的内存上限,那么默认会设置为512m.

JVM 启动的时候会默认使用80%的容器容量.

会忽略掉用户指定的 -Xmx 和 -Xms两个参数,自动指定为容器内存上限的80%.

# 集成组件

集成了以下组件
 1. skywalking 的 agent.引用地址为 ${SKYWALKING_AGENT}
 2. jacocoa 测试覆盖统计的 agent.引用地址为 ${JACOCO_AGENT}.

# 时区
增加了时区功能,可以能过环境变量 TZ 来指定.默认为 Asia/Shanghai.
