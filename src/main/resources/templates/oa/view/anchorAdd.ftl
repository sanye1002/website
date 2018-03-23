<!DOCTYPE html>
<html lang="en">
<!-- header -->
<#include "../common/header.ftl">
<body>
<!-- 导航 -->

<#include "../common/nav.ftl">

<!-- 主体内容 -->
<div class="main-container container-fluid">
    <!-- 页面内容 -->
    <div class="page-container">
        <!-- 侧边栏导航 -->
       <#include "../common/sider.ftl">
        <!-- /侧边栏导航 -->
        <!-- Page Content -->
        <div class="page-content">
            <!-- 页面面包屑 -->
            <div class="page-breadcrumbs">
                <ul class="breadcrumb">
                    <li>
                        <i class="fa fa-home"></i>
                        <a href="#">主页</a>
                    </li>
                    <li class="active">艺人添加</li>
                </ul>
            </div>
            <!-- /页面面包屑 -->
            <!-- Page Header -->
            <div class="page-header position-relative">
                <div class="header-title">
                    <h1>
                        艺人添加
                    </h1>
                </div>
                <!--Header Buttons-->
                <div class="header-buttons">
                    <a class="sidebar-toggler" href="#">
                        <i class="fa fa-arrows-h"></i>
                    </a>
                    <a class="refresh" id="refresh-toggler" href="">
                        <i class="glyphicon glyphicon-refresh"></i>
                    </a>
                    <a class="fullscreen" id="fullscreen-toggler" href="#">
                        <i class="glyphicon glyphicon-fullscreen"></i>
                    </a>
                </div>
                <!--Header Buttons End-->
            </div>
            <!-- /Page Header -->
            <!-- Page Body -->
            <div class="page-body">
                <div class="row">
                    <div class="col-xs-12 col-md-6 col-lg-12">
                        <div class="widget flat radius-bordered">
                            <div class="widget-header bg-blue">
                                <span class="widget-caption">艺人添加</span>

                            </div>
                            <div class="widget-body col-lg-12">
                                <div id="registration-form">

                                    <div class="form-title">基本信息</div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>昵称</label>
                                            <span class="input-icon icon-right">
                                                    <input id="nickname" type="text" class="form-control">
                                                    <i class="fa fa-user"></i>
                                                </span>
                                        </div>
                                        <div class="form-group">
                                            <label>直播平台</label>
                                            <span class="input-icon icon-right">
                                                    <input id="platform" type="text" class="form-control">
                                                    <i class="fa fa-user"></i>
                                                </span>
                                        </div>
                                        <div class="form-group">
                                            <label>直播ID</label>
                                            <span class="input-icon icon-right">
                                                    <input type="text" id="liveId" class="form-control">
                                                    <i class="fa fa-user"></i>
                                                </span>
                                        </div>
                                    </div>
                                    <!--right-->
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>人气</label>
                                            <span class="input-icon icon-right">
                                                    <input type="number" id="lookNumber" class="form-control">
                                                    <i class="fa fa-user"></i>
                                                </span>
                                        </div>
                                        <div class="form-group">
                                            <label>身高</label>
                                            <span class="input-icon icon-right">
                                                    <input type="number" id="height" class="form-control">
                                                    <i class="fa fa-user"></i>
                                                </span>
                                        </div>
                                        <div class="form-group">
                                            <label>描述</label>
                                            <span class="input-icon icon-right">
                                                    <input type="text" id="description" class="form-control">
                                                    <i class="fa fa-user"></i>
                                                </span>
                                        </div>
                                    </div>
                                    <!--/right-->
                                    <div class="form-title">封面图片信息</div>
                                    <div class="col-sm-12">
                                        <div class="layui-upload">
                                            <button type="button" class="layui-btn layui-btn-normal" id="upload">
                                                上传封面
                                            </button>
                                            <div class="layui-upload-list">
                                                <img class="layui-upload-img" id="demo1">
                                                <p id="demoText"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-title">艺人详细内容信息</div>
                                    <div class="col-sm-12">
                                        <textarea id="demo" style="display: none;"></textarea>

                                        <div style="float:right;margin-top:10px;">
                                            <button id="save" class="btn btn-success">保存</button>
                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <!-- /Page Body -->
        </div>
    </div>

</div>

<#include "../common/footjs.ftl">
<script type="text/javascript">
    var anchor = {
        id: "",
        nickname: "",
        smallImg: "",
        height: "",
        platform: "",
        liveId: "",
        description: "",
        content: "",
        lookNumber: ""
    };
    var layedit;
    var index;
    $(function () {
        layui.use('upload', function () {
            var $ = layui.jquery
                    , upload = layui.upload;

            //普通图片上传
            var uploadInst = upload.render({
                elem: '#upload',
                url: '/upload/img/anchor',
                data: {"key": "132"},
                before: function (obj) {
                    //预读本地文件示例，不支持ie8
                    obj.preview(function (index, file, result) {
                        $('#demo1').attr('src', result); //图片链接（base64）
                    });
                }
                , done: function (res) {
                    //上传成功
                    if (res.code == 0) {
                        anchor.smallImg = res.data.src;
                        return layer.msg(res.message);
                    }

                    //如果上传失败
                    if (res.code > 0) {
                        return layer.msg(res.message);
                    }


                }
                , error: function () {
                    //演示失败状态，并实现重传
                    var demoText = $('#demoText');
                    demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                    demoText.find('.demo-reload').on('click', function () {
                        uploadInst.upload();
                    });
                }
            });
        });
        layui.use('layedit', function () {
            layedit = layui.layedit;
            layedit.set({
                uploadImage: {
                    url: '/upload/img/anchor' //接口url
                    , type: 'post' //默认post
                }
            });
            index = layedit.build('demo'); //建立编辑器


        });

        $("#save").click(function () {

            anchor.content = layedit.getContent(index);
            anchor.nickname = $("#nickname").val();
            anchor.height = $("#height").val();
            anchor.liveId = $("#liveId").val();
            anchor.platform = $("#platform").val();
            anchor.lookNumber = $("#lookNumber").val();
            anchor.description = $("#description").val();
            if (anchor.height != "") {
                if (anchor.nickname != "") {
                    if (anchor.platform != "") {
                        if (anchor.content != "") {
                            if (anchor.liveId != "") {
                                if (anchor.description != "") {
                                    if (anchor.lookNumber != "") {
                                        if (anchor.smallImg != "") {
                                            //ajax 异步提交
                                            $("#save").attr("disabled", true)
                                            $.post(
                                                    "/oa/anchor/save",
                                                    {
                                                        id: anchor.id,
                                                        nickname: anchor.nickname,
                                                        smallImg: anchor.smallImg,
                                                        height: anchor.height,
                                                        platform: anchor.platform,
                                                        liveId: anchor.liveId,
                                                        description: anchor.description,
                                                        content: anchor.content,
                                                        lookNumber: anchor.lookNumber
                                                    },
                                                    function (data) {
                                                        if (data.code==0){
                                                            layer.msg(data.message);
                                                            setTimeout(function () {
                                                                location="/oa/anchor/index"
                                                            },2000)
                                                        }
                                                        if (data.code>0){
                                                            $("#save").removeAttr("disabled")
                                                            layer.msg(data.message);
                                                        }
                                                    }
                                            )
                                        } else {
                                            layer.msg("封面图片未上传");
                                        }
                                    } else {
                                        layer.msg("人气信息为填写");
                                    }
                                } else {
                                    layer.msg("简介信息为填写");
                                }
                            } else {
                                layer.msg("直播ID信息为填写");
                            }
                        } else {
                            layer.msg("详细内容信息为填写");
                        }
                    } else {
                        layer.msg("平台信息为填写");
                    }
                } else {
                    layer.msg("昵称信息为填写");
                }
            } else {
                layer.msg("身高信息为填写");
            }
        })

    })


</script>
</body>
</html>