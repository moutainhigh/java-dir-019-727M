package org.yaukie.frame.provider;

import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.SftpException;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.extern.slf4j.Slf4j;
import org.assertj.core.util.Lists;
import org.pentaho.di.core.exception.KettleException;
import org.pentaho.di.repository.RepositoryDirectoryInterface;
import org.pentaho.di.repository.filerep.KettleFileRepository;
import org.pentaho.di.repository.kdr.KettleDatabaseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.yaukie.base.annotation.EnablePage;
import org.yaukie.base.annotation.LogAround;
import org.yaukie.base.config.UniformReponseHandler;
import org.yaukie.base.constant.BaseResult;
import org.yaukie.base.constant.BaseResultConstant;
import org.yaukie.base.constant.PageResult;
import org.yaukie.base.core.controller.BaseController;
import org.yaukie.base.core.entity.SftpBean;
import org.yaukie.base.exception.UserDefinedException;
import org.yaukie.base.text.Convert;
import org.yaukie.base.util.*;
import org.yaukie.frame.autocode.model.XDict;
import org.yaukie.frame.autocode.model.XDictExample;
import org.yaukie.frame.autocode.model.XRepository;
import org.yaukie.frame.autocode.model.XRepositoryExample;
import org.yaukie.frame.autocode.service.api.XDictService;
import org.yaukie.frame.autocode.service.api.XRepositoryService;
import org.yaukie.xtl.KettleUtil;
import org.yaukie.xtl.cons.Constant;
import org.yaukie.xtl.repo.RepositoryTree;
import org.yaukie.xtl.repo.XRepoManager;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Future;
import java.util.concurrent.ScheduledExecutorService;

/**
 * @author: yuenbin
 * @create: 2020/11/09 11/28/955
 **/
@RestController
@RequestMapping(value = "/provider")
@Api(value = "?????????????????????????????????", description = "?????????????????????????????????")
@Slf4j
public class XRepoProviderController extends BaseController {


    @Autowired
    private XRepositoryService xRepositoryService;

    @Autowired
    private XDictService xDictService;

    @Autowired
    private ScheduledExecutorService service;


    private static Map<String,List> cacheMap = new ConcurrentHashMap<>() ;

    @GetMapping(value = "/getLogLevelDicts")
    @ApiOperation("??????????????????")
    public BaseResult getLogLevelDicts() {
        XDictExample xDictExample = new XDictExample();
        xDictExample.createCriteria().andDictIdEqualTo("supported_log_level");
        List<XDict> xDictxList = xDictService.selectByExample(xDictExample);
        return new UniformReponseHandler<>().sendSuccessResponse(xDictxList);
    }

    @GetMapping(value = "/getTransStatusDicts")
    @ApiOperation("??????????????????????????????")
    public BaseResult getTransStatusDicts() {
        XDictExample xDictExample = new XDictExample();
        xDictExample.createCriteria().andDictIdEqualTo("supported_trans_status");
        List<XDict> xDictxList = xDictService.selectByExample(xDictExample);
        return new UniformReponseHandler<>().sendSuccessResponse(xDictxList);
    }

    @GetMapping(value = "/getJobStatusDicts")
    @ApiOperation("??????????????????????????????")
    public BaseResult getJobStatusDicts() {
        XDictExample xDictExample = new XDictExample();
        xDictExample.createCriteria().andDictIdEqualTo("supported_job_status");
        List<XDict> xDictxList = xDictService.selectByExample(xDictExample);
        return new UniformReponseHandler<>().sendSuccessResponse(xDictxList);
    }

    @GetMapping(value = "/getRepoTypeDicts")
    @ApiOperation("????????????????????????")
    public BaseResult getRepoTypeDicts() {
        XDictExample xDictExample = new XDictExample();
        xDictExample.createCriteria().andDictIdEqualTo("supported_type_database");
        List<XDict> xDictxList = xDictService.selectByExample(xDictExample);
        return new UniformReponseHandler<>().sendSuccessResponse(xDictxList);
    }

    @GetMapping(value = "/qryRepoRootTree")
    @ApiOperation("????????????????????????")
    public BaseResult qryRepoRootTree() {

        XRepositoryExample xRepositoryExample = new XRepositoryExample();
        List<XRepository> xRepositoryList = xRepositoryService.selectByExample(xRepositoryExample);
        List<RepositoryTree> repositoryTrees = new ArrayList<>();
        RepositoryTree root = new RepositoryTree();
        root.setParent("-1");
        root.setId("99");
        root.setText("??????????????????");
        root.setLasted(false);
        root.setType("root");
        root.setPath("root");
        repositoryTrees.add(root);
        return new UniformReponseHandler<>().sendSuccessResponse(repositoryTrees);
    }

    @GetMapping(value = "/qryRepoSubTree")
    @ApiOperation("????????????????????????")
    public BaseResult qryRepoSubTree(
            @RequestParam(name = "pId", required = true) String pId,
            @RequestParam(name = "type", required = false) String type) {
        List<RepositoryTree> repositoryTrees = getRepoTress();
        List<RepositoryTree> subTrees = new ArrayList<>();
        try
        {
        repositoryTrees.forEach(item -> {
            if (item.getParent().equals(pId)) {
                if (item.isLasted()) {
                    if (!StringUtils.isEmpty(type)) {
                        if (item.getType().indexOf(type) != -1) {
                            subTrees.add(item);
                        }
                    } else {
                        subTrees.add(item);
                    }

                } else {
                    subTrees.add(item);
                }
            }});
        }catch (Exception e)
        {
            StringWriter sw = new StringWriter();
            e.printStackTrace(new PrintWriter(sw));
            throw new UserDefinedException(BaseResultConstant.UNKNOW_EXCEPTION, sw.toString().substring(0, 800));
        }

        return new UniformReponseHandler()
                .sendSuccessResponse(subTrees);
    }


    @RequestMapping(value = "/testRemoteConnection", method = RequestMethod.POST)
    @ApiOperation("?????????????????????")
    @LogAround("?????????????????????")
    public BaseResult testRemoteConnection(
            @ApiParam(name = "ddDatasourceDto", value = "???????????????", required = true)
            @RequestBody XRepository xRepository) {
        if (StringTools.isNull(xRepository)) {
            return BaseResult.fail();
        }

        String dbHost = xRepository.getDbHost();
        String dbPort = xRepository.getDbPort();
        String dbUserName = xRepository.getDbUsername();
        String dbPassWord = new String(Base64.getDecoder().decode(xRepository.getDbPassword()), StandardCharsets.UTF_8);
        String type = xRepository.getType();
        String baseDir = xRepository.getBaseDir();
        if (StringTools.equalsIgnoreCase(type, "file")) {
            return BaseResult.success("????????????!", null);
        } else if (StringTools.equalsIgnoreCase("hdfs", type)) {
            return BaseResult.fail("??????????????????HDFS??????!");
        } else if (StringTools.equalsIgnoreCase("ftp", type)) {
            Ftp ftp = new Ftp(dbHost, Integer.parseInt(dbPort), dbUserName, dbPassWord);
            try {
                boolean isConnected = ftp.connect();
                if (isConnected) {
                    return BaseResult.success("??????????????????!", null);
                }
            } catch (Exception e) {
                log.error("??????{}??????,{}", dbHost, e);
                StringWriter sw = new StringWriter();
                e.printStackTrace(new PrintWriter(sw));
                return BaseResult.fail(sw.toString().substring(0, 300));
            } finally {
                ftp.close();
            }
        } else if (StringTools.equalsIgnoreCase("ftps", type)) {
            Ftps ftps = new Ftps(dbHost, Integer.parseInt(dbPort), dbUserName, dbPassWord);
            try {
                boolean isConnected = ftps.connect();
                if (isConnected) {
                    return BaseResult.success("??????????????????!", null);
                }
            } catch (Exception e) {
                log.error("??????{}??????,{}", dbHost, e);
                StringWriter sw = new StringWriter();
                e.printStackTrace(new PrintWriter(sw));
                return BaseResult.fail(sw.toString().substring(0, 300));
            } finally {
                ftps.close();
            }
        } else if (StringTools.equalsIgnoreCase("sftp", type)) {
            SftpBean sftpBean = new SftpBean();
            sftpBean.setHost(dbHost);
            sftpBean.setPort(Integer.parseInt(dbPort));
            sftpBean.setUserName(dbUserName);
            sftpBean.setSecretKey(dbPassWord);
            Sftp sftp = new Sftp(sftpBean);
            try {
                ChannelSftp channelSftp = sftp.open();
                if (channelSftp.isConnected()) {
                    return BaseResult.success("??????????????????!", null);
                }
            } catch (Exception e) {
                log.error("??????{}??????,{}", dbHost, e);
                StringWriter sw = new StringWriter();
                e.printStackTrace(new PrintWriter(sw));
                return BaseResult.fail(sw.toString().substring(0, 300));
            } finally {
                sftp.close();
            }
        }
        return BaseResult.success("??????????????????!", null);
    }


    @RequestMapping(value = "/testConnection", method = RequestMethod.POST)
    @ApiOperation("?????????????????????")
    @LogAround("??????????????????")
    public BaseResult testConnection(
            @ApiParam(name = "ddDatasourceDto", value = "???????????????", required = true)
            @RequestBody XRepository xRepository) {

        String msg;
        // JDBC
        Connection connection = null;

        String url = "jdbc:mysql://" + xRepository.getDbHost().trim() + ":" + xRepository.getDbPort().trim() + "/" + xRepository.getDbName().trim();
        String jdbcDriverClass = "com.mysql.jdbc.Driver";

        // ?????? JDBC ????????? url

        log.debug("\nurl: {}\njdbcDriver: {}", url, jdbcDriverClass);
        try {
            String pswd = new String(Base64.getDecoder().decode(xRepository.getDbPassword()), StandardCharsets.UTF_8);
            Class.forName(jdbcDriverClass);
            connection = DriverManager.getConnection(url, xRepository.getDbUsername(), pswd);
            msg = "????????????????????????";
            log.debug("\n" + msg);
            return BaseResult.success(msg, null);
        } catch (Exception e) {
            msg = "?????????????????????!";
            log.error(msg, e);
            return new UniformReponseHandler().sendErrorResponse_System(e);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    log.error("????????????????????????????????????", e);
                }
            }
        }
    }


    private List<RepositoryTree> getRepoTress() {
        List<RepositoryTree> repositoryTrees = new ArrayList<>();

        XRepositoryExample xRepositoryExample = new XRepositoryExample();
        xRepositoryExample.createCriteria().andIsDelNotEqualTo("1");
        xRepositoryExample.or().andIsDelIsNull();
        List<XRepository> xRepositoryList = xRepositoryService.selectByExample(xRepositoryExample);

        if (!CollectionUtils.isEmpty(xRepositoryList)) {
            xRepositoryList.forEach(item -> {
                List<RepositoryTree> tmpRepositoryList = new ArrayList<>();
                String type = item.getType();

                if (type.equalsIgnoreCase("file")) {
                    // ?????????
                    String baseDir = item.getBaseDir();

                    try {
                        KettleFileRepository repository = (KettleFileRepository) KettleUtil.
                                conFileRep(item.getRepoId(), item.getRepoName(), baseDir);
                        XRepoManager.getAllDirectoryTreeList(item.getRepoId(), repository, "/", tmpRepositoryList);
                        if (tmpRepositoryList.size() > 0) {
                            RepositoryDirectoryInterface rDirectory = repository.loadRepositoryDirectoryTree().findDirectory("/");
                            RepositoryTree repositoryTree = new RepositoryTree();
                            repositoryTree.setParent(item.getRepoId());
                            repositoryTree.setId(item.getRepoId() + "@" + rDirectory.getObjectId().toString());
                            repositoryTree.setText(rDirectory.getName().equals("\\/") ? "????????????" : rDirectory.getName());
                            repositoryTree.setLasted(false);
                            repositoryTree.setType("tree");
                            repositoryTree.setPath("file");
                            tmpRepositoryList.add(repositoryTree);
                        }

                    } catch (KettleException e) {
                        StringWriter sw = new StringWriter();
                        e.printStackTrace(new PrintWriter(sw));
                        throw new UserDefinedException(BaseResultConstant.UNKNOW_EXCEPTION, sw.toString().substring(0, 800));
                    }
                } else if (type.equalsIgnoreCase("db")) {
                    //?????????
                    try {
                        KettleDatabaseRepository repository = (KettleDatabaseRepository) KettleUtil.conByNative(item.getRepoId(),
                                item.getRepoName(), item.getDbName(), "MYSQL",
                                item.getDbHost(), item.getDbPort(), item.getDbName(), item.getDbUsername(),
                                item.getDbPassword(), item.getRepoUsername(), item.getRepoPassword());
                        XRepoManager.getAllDirectoryTreeList(item.getRepoId(), repository, "/", tmpRepositoryList);
                        if (tmpRepositoryList.size() > 0) {

                            RepositoryDirectoryInterface rDirectory = repository.loadRepositoryDirectoryTree().findDirectory("/");
                            RepositoryTree repositoryTree = new RepositoryTree();
                            repositoryTree.setParent(item.getRepoId());
                            repositoryTree.setId(item.getRepoId() + "@" + rDirectory.getObjectId().toString());
                            repositoryTree.setText(rDirectory.getName().equals("\\/") ? "????????????" : rDirectory.getName());
                            repositoryTree.setType("tree");
                            repositoryTree.setPath("db");
                            repositoryTree.setLasted(false);
                            tmpRepositoryList.add(repositoryTree);
                        }

                    } catch (KettleException e) {
                        StringWriter sw = new StringWriter();
                        e.printStackTrace(new PrintWriter(sw));
                        throw new UserDefinedException(BaseResultConstant.UNKNOW_EXCEPTION, sw.toString().substring(0, 800));
                    }
                } else if (type.equalsIgnoreCase("sftp")
                        || type.equalsIgnoreCase("ftp")
                        || type.equalsIgnoreCase("ftps")) {

                    String dbHost = item.getDbHost();
                    String dbPort = item.getDbPort();
                    String dbUserName = item.getDbUsername();
                    String dbPassWord = item.getDbPassword();
                    // ?????????
                    String baseDir = item.getBaseDir();
                    if (type.equalsIgnoreCase("sftp")) {
                        SftpBean sftpBean = new SftpBean();
                        sftpBean.setHost(dbHost);
                        sftpBean.setPort(Integer.parseInt(dbPort));
                        sftpBean.setUserName(dbUserName);
                        sftpBean.setSecretKey(dbPassWord);
                        Sftp sftp = new Sftp(sftpBean);
                        final  List<RepositoryTree> tmpFinalRepositoryList = new ArrayList<>() ;
                        if(cacheMap.containsKey("SFTP_LIST_KEY")){
                            tmpRepositoryList.addAll(cacheMap.get("SFTP_LIST_KEY"));
                        }else {
                                service.execute(new Runnable() {
                                @Override
                                public void run() {

                                    ChannelSftp channelSftp = null;
                                    try {
                                        channelSftp = sftp.open();
                                    } catch (JSchException e) {
                                        log.error("???????????????????????????,{}", e);
                                    }
                                    if (channelSftp.isConnected()) {
                                        log.info("????????????????????????,{}", baseDir);
                                        getSftpTrees(tmpFinalRepositoryList, sftp, item.getRepoId(), baseDir);
                                        if (tmpFinalRepositoryList.size() > 0) {
                                            RepositoryTree repositoryTree = new RepositoryTree();
                                            repositoryTree.setParent(item.getRepoId());
                                            repositoryTree.setId(item.getRepoId() + "@" + CodeUtil.getInstance().encode(baseDir));
                                            repositoryTree.setText("/");
                                            repositoryTree.setLasted(false);
                                            repositoryTree.setType("tree");
                                            repositoryTree.setPath(type);
                                            tmpFinalRepositoryList.add(repositoryTree);
                                        }
                                         cacheMap.put("SFTP_LIST_KEY",tmpFinalRepositoryList);
                                        log.info("cacheMap's size ========"+cacheMap.size());
                                    }
                                }
                            });
                        }

                    } else if (type.equalsIgnoreCase("ftp")) {
                        final  List<RepositoryTree> tmpFinalRepositoryList = new ArrayList<>() ;
                        Future future = service.submit(new Runnable() {
                            @Override
                            public void run() {
                                Ftp ftp = new Ftp(dbHost, Integer.parseInt(dbPort), dbUserName, dbPassWord);
                                try {
                                    if (ftp.connect()) {
                                        getFtporFtpsTrees(tmpFinalRepositoryList, ftp, item.getRepoId(), baseDir);
                                    }
                                } catch (Exception e) {
                                    log.error("????????????ftp??????????????????{}", e);
                                }
                            }
                        });
                        while (future.isDone())
                        {
                            tmpRepositoryList.addAll(tmpFinalRepositoryList);
                        }
                    } else {
                        final  List<RepositoryTree> tmpFinalRepositoryList = new ArrayList<>() ;
                        Future future = service.submit(new Runnable() {
                            @Override
                            public void run() {
                                Ftps ftps = new Ftps(dbHost, Integer.parseInt(dbPort), dbUserName, dbPassWord);
                                try {
                                    if (ftps.connect()) {
                                        getFtporFtpsTrees(tmpFinalRepositoryList, ftps, item.getRepoId(), baseDir);
                                    }
                                } catch (Exception e) {
                                    log.error("????????????ftp??????????????????{}", e);
                                }
                            }
                        });
                        while (future.isDone())
                        {
                            tmpRepositoryList.addAll(tmpFinalRepositoryList);
                        }
                    }
                }

                RepositoryTree repositoryTree;
                repositoryTree = new RepositoryTree();
                repositoryTree.setParent("99");
                repositoryTree.setId(item.getRepoId());
                repositoryTree.setText(item.getRepoName());
                repositoryTree.setLasted(false);
                repositoryTree.setType(type);
                repositoryTree.setPath("repo");
                tmpRepositoryList.add(repositoryTree);
                repositoryTrees.addAll(tmpRepositoryList);
            });
        }

        return repositoryTrees;
    }


    @GetMapping(value = "/listFileRepoList")
    @ApiOperation("???????????????????????????????????????")
    @EnablePage
    public BaseResult listFileRepoList(
            @RequestParam(value = "offset", required = false) String offset,
            @RequestParam(value = "limit", required = false) String limit,
            @RequestParam(value = "repoName", required = false) String repoName) {

        XRepositoryExample xRepositoryExample = new XRepositoryExample();
        XRepositoryExample.Criteria criteria = xRepositoryExample.createCriteria();

        criteria.andTypeNotEqualTo("db");

        if (StringTools.isNotEmpty(repoName)) {
            criteria.andRepoNameLike("%" + repoName + "%");
        }

        xRepositoryExample.setOrderByClause(" created_time desc ");

        List<XRepository> xRepositories = xRepositoryService.selectByExample(xRepositoryExample);

        PageResult pageResult = new PageResult(xRepositories);
        Map<String, Object> result = new HashMap<>();
        List<XRepository> dataList = (List) pageResult.getRows();
        if (!CollectionUtils.isEmpty(dataList)) {
            dataList.forEach(item -> {
                String dbHost = item.getDbHost();
                String dbPort = item.getDbPort();
                String dbUserName = item.getDbUsername();
                String dbPassWord = item.getDbPassword();
                String type = item.getType();
                String baseDir = item.getBaseDir();
                if (StringTools.equalsIgnoreCase("hdfs", type)) {
                    baseDir = "hdfs://" + dbHost + ":" + dbPort + (StringTools.startsWith(baseDir, "/") ? baseDir : "/" + baseDir);

                } else if (StringTools.equalsIgnoreCase("ftp", type)
                        || StringTools.equalsIgnoreCase("ftps", type)
                        || StringTools.equalsIgnoreCase("sftp", type)) {
                    baseDir = StringTools.lowerCase(type) + "://" + dbUserName + ":"
                            + dbPassWord + "@" + dbHost + ":" + dbPort + (StringTools.startsWith(baseDir, "/") ? baseDir : "/" + baseDir);
                }
                item.setBaseDir(baseDir);
            });
        }

        result.put(RESULT_ROWS, dataList);
        result.put(RESULT_TOTLAL, pageResult.getTotal());

        return BaseResult.success(result);
    }


    @GetMapping(value = "/listDbRepoList")
    @ApiOperation("??????????????????????????????")
    @EnablePage
    public BaseResult listDbRepoList(
            @RequestParam(value = "offset", required = false) String offset,
            @RequestParam(value = "limit", required = false) String limit,
            @RequestParam(value = "repoName", required = false) String repoName) {

        XRepositoryExample xRepositoryExample = new XRepositoryExample();
        XRepositoryExample.Criteria criteria = xRepositoryExample.createCriteria();

        criteria.andTypeEqualTo("db");

        if (StringTools.isNotEmpty(repoName)) {
            criteria.andRepoNameLike("%" + repoName + "%");
        }

        xRepositoryExample.setOrderByClause(" created_time desc ");

        List<XRepository> xRepositories = xRepositoryService.selectByExample(xRepositoryExample);

        PageResult pageResult = new PageResult(xRepositories);
        Map<String, Object> result = new HashMap<>();

        result.put(RESULT_ROWS, pageResult.getRows());
        result.put(RESULT_TOTLAL, pageResult.getTotal());

        return BaseResult.success(result);
    }


    private void getSftpTrees(List<RepositoryTree> repositoryTrees, Sftp sftp, String repoId, String baseDir) {
        // ????????????????????????????????????????????????????????????,??????????????????????????????
        try {
            // ????????????
            List<Map<String, String>> dirList = sftp.listFiles(baseDir, Sftp.DIR_TYPE);
            // ????????????
            List<Map<String, String>> fileList = sftp.listFiles(baseDir, Sftp.FILE_TYPE);

            if (!CollectionUtils.isEmpty(dirList)) {
                dirList.forEach(v -> {
                    RepositoryTree repositoryTree = new RepositoryTree();
                    repositoryTree.setId(repoId + "@" + v.get("id"));
                    repositoryTree.setParent(repoId + "@" + v.get("pId"));
                    repositoryTree.setText(v.get("name"));
                    repositoryTree.setPath(v.get("path"));
                    repositoryTree.setType("subTree");
                    repositoryTree.setLasted(false);
                    repositoryTrees.add(repositoryTree);
                    // ??????
                    getSftpTrees(repositoryTrees, sftp, repoId, v.get("path"));
                });
            }

            if (!CollectionUtils.isEmpty(fileList)) {
                fileList.forEach(v -> {
                    RepositoryTree repositoryTree = new RepositoryTree();
                    repositoryTree.setId(repoId + "@" + v.get("id"));
                    repositoryTree.setParent(repoId + "@" + v.get("pId"));
                    repositoryTree.setText(v.get("name"));
                    repositoryTree.setPath(v.get("path"));
                    if (StringTools.endsWith(v.get("name"), "ktr")) {
                        repositoryTree.setType(repoId + "@" + "sftp" + "@" + Constant.TYPE_TRANS);
                    } else if (StringTools.endsWith(v.get("name"), "kjb")) {
                        repositoryTree.setType(repoId + "@" + "sftp" + "@" + Constant.TYPE_JOB);
                    }

                    repositoryTree.setLasted(true);
                    repositoryTrees.add(repositoryTree);

                });
            }
        } catch (SftpException e) {
            log.error("????????????????????????,{}", e);
        }

    }


    private void getFtporFtpsTrees(List<RepositoryTree> repositoryTrees, Object obj, String repoId, String baseDir) {
        // ????????????????????????????????????????????????????????????,??????????????????????????????
        try {

            List<Map<String, String>> dirList = Lists.newArrayList();

            if (obj instanceof Ftp) {
                Ftp ftp = (Ftp) obj;
                ftp.getFtpDirList(dirList, repoId, baseDir);
            } else if (obj instanceof Ftps) {
                Ftps ftps = (Ftps) obj;
                ftps.getFtpsDirList(dirList, repoId, baseDir);
            }

            if (!CollectionUtils.isEmpty(dirList)) {
                dirList.forEach(v -> {
                    RepositoryTree repositoryTree = new RepositoryTree();
                    repositoryTree.setId(v.get("id"));
                    repositoryTree.setParent(v.get("pId"));
                    repositoryTree.setText(v.get("name"));
                    repositoryTree.setPath(v.get("path"));
                    repositoryTree.setType(v.get("type"));
                    repositoryTree.setLasted(Convert.toBool(v.get("lasted")));
                    repositoryTrees.add(repositoryTree);
                });
            }

        } catch (IOException e) {
            log.error("????????????FTPorFtps??????????????????{}", e);
        }

    }

}
