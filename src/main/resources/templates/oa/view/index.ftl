<!DOCTYPE html>
<html>
<#include "../common/header.ftl">
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <!-- layui-header-->
<#include "../common/nav.ftl">
    <!-- 左侧导航区域-->
<#include "../common/sider.ftl">
    <div class="layui-body">
        <div class="layui-row">
            <div class="layui-col-xs12">
                <table class="layui-hide" id="test"></table>
            </div>
        </div>
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                <legend>上传多张图片</legend>
            </fieldset>

            <div class="layui-upload">
                <button type="button" class="layui-btn" id="test2">多图片上传</button>
                <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
                    预览图：
                    <div class="layui-upload-list" id="demo2"></div>
                </blockquote>
            </div>
        </div>
    </div>

<#include "../common/footjs.ftl">
</div>
<script src="/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;

    });
    layui.use('upload', function () {
        var $ = layui.jquery, upload = layui.upload;
        //多图片上传
        upload.render({
            elem: '#test2'
            , url: '/upload/'
            , multiple: true
            , before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#demo2').append('<img src="' + result + '" alt="' + file.name + '" class="layui-upload-img">')
                });
            }
            , done: function (res) {
                //上传完毕
            }
        });
    });
    layui.use('table', function () {
        var table = layui.table
                , form = layui.form;

        table.render({
            elem: '#test'
            , url: '/demo/table/user/'
            , cellMinWidth: 80
            , cols: [[
                {type: 'numbers'}
                , {type: 'checkbox'}
                , {field: 'id', title: 'ID', width: 100, unresize: true, sort: true}
                , {field: 'username', title: '用户名', templet: '#usernameTpl'}
                , {field: 'city', title: '城市'}
                , {field: 'wealth', title: '财富', minWidth: 120, sort: true}
                , {field: 'sex', title: '性别', width: 85, templet: '#switchTpl', unresize: true}
                , {field: 'lock', title: '是否锁定', width: 110, templet: '#checkboxTpl', unresize: true}
            ]]
            , page: true
        });

        //监听性别操作
        form.on('switch(sexDemo)', function (obj) {
            layer.tips(this.value + ' ' + this.name + '：' + obj.elem.checked, obj.othis);
        });

        //监听锁定操作
        form.on('checkbox(lockDemo)', function (obj) {
            layer.tips(this.value + ' ' + this.name + '：' + obj.elem.checked, obj.othis);
        });
    });
</script>
</body>
</html>