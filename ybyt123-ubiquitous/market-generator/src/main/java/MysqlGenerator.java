
import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.InjectionConfig;
import com.baomidou.mybatisplus.generator.config.DataSourceConfig;
import com.baomidou.mybatisplus.generator.config.GlobalConfig;
import com.baomidou.mybatisplus.generator.config.PackageConfig;
import com.baomidou.mybatisplus.generator.config.StrategyConfig;
import com.baomidou.mybatisplus.generator.config.po.TableFill;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author kaixin
 */
public class MysqlGenerator {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/ubiquitous?characterEncoding=UTF-8&serverTimezone=Asia/Shanghai&allowMultiQueries=true";

    private static final String DRIVER_NAME2 = "com.mysql.cj.jdbc.Driver";

    private static final String USER = "root";
    private static final String PWD = "xxxxxx";

    /**
     * <p>
     * MySQL 生成演示
     * </p>
     */
    public static void main(String[] args) {
        generate();
    }


    private static void generate() {
        int result = scanner();
        // 自定义需要填充的字段
        List<TableFill> tableFillList = new ArrayList<>();
        tableFillList.add(new TableFill("ASDD_SS", FieldFill.INSERT_UPDATE));

        String packagePath = System.getProperty("user.dir") + "/code-generator/src/main/java";

        // 代码生成器
        AutoGenerator mpg = new AutoGenerator();

        mpg.setGlobalConfig(
                // 全局配置
                new GlobalConfig()
                        .setOutputDir(packagePath) //输出目录
                        .setFileOverride(true)// 是否覆盖文件
                        .setActiveRecord(true)// 开启 activeRecord 模式
                        .setEnableCache(false)// XML 二级缓存
                        .setBaseResultMap(true)// XML ResultMap
                        .setBaseColumnList(true)// XML columList
                        //.setKotlin(true) 是否生成 kotlin 代码
                        .setAuthor("XBJ")
                        // 自定义文件命名，注意 %s 会自动填充表实体属性！
                        .setEntityName("%sDO")
                        .setMapperName("%sMapper")
                        .setXmlName("%sMapper")
                        .setServiceName("%sService")
                        .setServiceImplName("%sServiceImpl")
                        .setControllerName("%sController")
        );

        // 数据源配置
        mpg.setDataSource(
                new DataSourceConfig()
                        .setDbType(DbType.MYSQL)// 数据库类型
//            .setTypeConvert(new MySqlTypeConvert() {
//                // 自定义数据库表字段类型转换【可选】
//                @Override
//                public DbColumnType processTypeConvert(GlobalConfig globalConfig, String fieldType) {
//                    System.out.println("转换类型：" + fieldType);
//                    // if ( fieldType.toLowerCase().contains( "tinyint" ) ) {
//                    //    return DbColumnType.BOOLEAN;
//                    // }
//                    return (DbColumnType) super.processTypeConvert(globalConfig, fieldType);
//                }
//            })
                        .setDriverName(DRIVER_NAME2)
                        .setUsername(USER)
                        .setPassword(PWD)
                        .setUrl(JDBC_URL)
        );

        // 策略配置
        mpg.setStrategy(
                new StrategyConfig()
                        // .setCapitalMode(true)// 全局大写命名
                        // .setDbColumnUnderline(true)//全局下划线命名
                        .setTablePrefix(new String[]{"ubiquitous_"})// 此处可以修改为您的表前缀
//                .setNaming(NamingStrategy.underline_to_camel)// 表名生成策略
                        .setNaming(NamingStrategy.no_change)// 表名生成策略

                        // .setInclude(new String[] { "user" }) // 需要生成的表
                        // .setExclude(new String[]{"test"}) // 排除生成的表
                        // 自定义实体父类
                        .setSuperEntityClass("com.ubiquitous.market.data.domain.SuperDO")
                        // 自定义实体，公共字段
                        .setSuperEntityColumns(new String[]{"id", "gmt_update", "gmt_create"})
                        .setTableFillList(tableFillList)

                        // 自定义 mapper 父类
                        // .setSuperMapperClass("com.baomidou.demo.TestMapper")
                        // 自定义 service 父类
                        // .setSuperServiceClass("com.baomidou.demo.TestService")
                        // 自定义 service 实现类父类
                        // .setSuperServiceImplClass("com.baomidou.demo.TestServiceImpl")
                        // 自定义 controller 父类
                        // .setSuperControllerClass("com.baomidou.demo.TestController")
                        // 【实体】是否生成字段常量（默认 false）
                        // public static final String ID = "test_id";
                        // .setEntityColumnConstant(true)
                        // 【实体】是否为构建者模型（默认 false）
                        // public User setName(String name) {this.name = name; return this;}
                        // .setEntityBuilderModel(true)
                        // 【实体】是否为lombok模型（默认 false）<a href="https://projectlombok.org/">document</a>
                        .setEntityLombokModel(true)
                // Boolean类型字段是否移除is前缀处理
                // .setEntityBooleanColumnRemoveIsPrefix(true)
                // .setRestControllerStyle(true)
                // .setControllerMappingHyphenStyle(true)
        );
        mpg.setPackageInfo(
                // 包配置
                new PackageConfig()
                        //.setModuleName("test")
                        .setParent("com.ubiquitous.market.data")// 自定义包路径
                        //.setController("controller")// 这里是控制器包名，默认 web
                        .setService("service").setServiceImpl("service.impl").setMapper("mapper").setEntity("domain")
        )/*.setCfg(
                // 注入自定义配置，可以在 VM 中使用 cfg.abc 设置的值
                new InjectionConfig() {
                    @Override
                    public void initMap() {
                        Map<String, Object> map = new HashMap<>();
                        map.put("abc", this.getConfig().getGlobalConfig().getAuthor() + "-mp");
                        this.setMap(map);
                    }
                }.setFileOutConfigList(Collections.<FileOutConfig>singletonList(new FileOutConfig(
                        "/templates/mapper.xml" + ((1 == result) ? ".ftl" : ".vm")) {
                    // 自定义输出文件目录
                    @Override
                    public String outputFile(TableInfo tableInfo) {
                        return "D:/develop/code/xml/" + tableInfo.getEntityName() + ".xml";
                    }
                }))
        ).setTemplate(
                // 关闭默认 xml 生成，调整生成 至 根目录
                new TemplateConfig().setXml("generator")
                // 自定义模板配置，模板可以参考源码 /mybatis-plus/src/main/resources/template 使用 copy
                // 至您项目 src/main/resources/template 目录下，模板名称也可自定义如下配置：
                // .setController("...");
                // .setEntity("...");
                // .setMapper("...");
                // .setXml("...");
                // .setService("...");
                // .setServiceImpl("...");
        )*/;

        InjectionConfig cfg = new InjectionConfig() {
            @Override
            public void initMap() {
                Map<String, Object> map = new HashMap<String, Object>();
                map.put("abc", this.getConfig().getGlobalConfig().getAuthor() + "-mp");
                this.setMap(map);
            }
        };

/*
        List<FileOutConfig> focList = new ArrayList<FileOutConfig>();

        // 调整 xml 生成目录演示
        focList.add(new FileOutConfig("/templates/mapper.xml.vm") {
            @Override
            public String outputFile(TableInfo tableInfo) {
                return packagePath + "/generator/xml/" + tableInfo.getEntityName() + "Mapper.xml";
            }
        });
        cfg.setFileOutConfigList(focList);*/
        mpg.setCfg(cfg);

        // 执行生成
        if (1 == result) {
            mpg.setTemplateEngine(new FreemarkerTemplateEngine());
        }
        mpg.execute();

        // 打印注入设置，这里演示模板里面怎么获取注入内容【可无】
        System.err.println(mpg.getCfg().getMap().get("abc"));
    }


    public static int scanner() {
        return 0;
       /* Scanner scanner = new Scanner(System.in);
        StringBuilder help = new StringBuilder();
        help.append(" ！！代码生成, 输入 0 表示使用 Velocity 引擎 ！！");
        help.append("\n对照表：");
        help.append("\n0 = Velocity 引擎");
        help.append("\n1 = Freemarker 引擎");
        help.append("\n请输入：");
        System.out.println(help.toString());
        int slt = 0;
        // 现在有输入数据
        if (scanner.hasNext()) {
            String ipt = scanner.next();
            if ("1".equals(ipt)) {
                slt = 1;
            }
        }
        return slt;*/
    }


}
