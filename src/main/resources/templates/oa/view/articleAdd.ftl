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
                    <li class="active">文章添加</li>
                </ul>
            </div>
            <!-- /页面面包屑 -->
            <!-- Page Header -->
            <div class="page-header position-relative">
                <div class="header-title">
                    <h1>
                        文章添加
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
                    <div class="col-xs-12 col-md-12">
                        <div class="widget flat radius-bordered">
                            <div class="widget-header bg-blue">
                                <span class="widget-caption">文章发布</span>
                            </div>
                            <div class="widget-body col-lg-12">
                                <div class="form-title">基本内容</div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label>标题</label>
                                        <span class="input-icon icon-right">
                                                    <input id="article_title" type="text" class="form-control">
                                                    <i class="fa fa-user"></i>
                                            </span>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label>文章类别</label>
                                        <div class="radio">
                                            <label>
                                                <input name="form-field-radio" value="0" type="radio"
                                                       class="colored-blue">
                                                <span class="text">荣耀战绩 </span>
                                            </label>
                                            <label>
                                                <input name="form-field-radio" value="1" type="radio"
                                                       class="colored-success">
                                                <span class="text">艺人热讯</span>
                                            </label>
                                            <label>
                                                <input name="form-field-radio" value="2" type="radio"
                                                       class="colored-blueberry">
                                                <span class="text">业绩动态</span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-title">封面图片<span>大小：</span></div>
                                <div class="col-sm-12">
                                    <div class="layui-upload">
                                        <button type="button" class="layui-btn layui-btn-normal" id="upload">上传封面
                                        </button>
                                        <div class="layui-upload-list">
                                            <img class="layui-upload-img" id="demo1">
                                            <p id="demoText"></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-title">文章详细内容信息</div>
                                <div class="col-sm-12">
                                    <textarea id="demo" style="display: none;"></textarea>
                                    <div style="float:right;margin-top:10px;">
                                        <button id="save" class="btn btn-success" >保存</button>
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
    var article = {
        title: "",
        smallImg: "",
        type: "",
        content: ""
    }
    var index;
    var layedit;
    $(function () {
        $("input[type=radio]").click(function () {
            article.type = this.value;
        })
        layui.use('upload', function () {
            var $ = layui.jquery
                    , upload = layui.upload;

            //普通图片上传
            var uploadInst = upload.render({
                elem: '#upload'
                , url: '/upload/img/article'
                , before: function (obj) {
                    //预读本地文件示例，不支持ie8
                    obj.preview(function (index, file, result) {
                        $('#demo1').attr('src', result); //图片链接（base64）
                    });
                }
                , done: function (res) {
                    //上传成功
                    if (res.code == 0) {
                        article.smallImg = res.data.src;
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
                    url: '/upload/img/article' //接口url
                    , type: 'post' //默认post
                }
            });
            index = layedit.build('demo'); //建立编辑器
        });
        $("#save").click(function () {
            article.content = layedit.getContent(index)
            article.title = $("#article_title").val();
            if (article.title == "") {
                layer.msg("文章标题为填写...")
            } else {
                if (article.type == "") {
                    layer.msg("请选择文章类别...")
                } else {
                    if (article.smallImg == "") {
                        layer.msg("请上传封面图...")
                    } else {
                        if (article.content == "") {
                            layer.msg("请编写文章内容...")
                        } else {
                            //保存
                            $("#save").attr("disabled", true)
                            $.post(
                                    "/oa/article/save",
                                    {
                                        type: article.type,
                                        smallImg: article.smallImg,
                                        articleTitle: article.title,
                                        content: article.content
                                    },
                                    function (data) {

                                        if (data.code == 0) {
                                            layer.msg(data.message);
                                            setTimeout(function () {
                                                location = "/oa/article/index"
                                            }, 2000)
                                        }
                                        if (data.code > 0) {
                                            $("#save").removeAttr("disabled")
                                            layer.msg(data.message);
                                        }
                                    }
                            )
                        }
                    }
                }
            }
        })
    })

</script>
</body>
</html>