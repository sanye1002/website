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
                    <li class="active">艺人设置</li>
                </ul>
            </div>
            <!-- /页面面包屑 -->
            <!-- Page Header -->
            <div class="page-header position-relative">
                <div class="header-title">
                    <h1>
                        艺人设置
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
                        <div class="well with-header with-footer">
                            <div class="header bordered-sky">
                                艺人资料
                                <span class="badge badge-sky badge-square">
                                     提示：点击编辑可查看详细信息
                                </span>
                            </div>
                            <form class="search" method="get">
                                <div style="float:right;margin-right:2px;">
                                    <a href="/oa/anchor/index" class="btn btn-success">添加艺人</a>
                                </div>
                                <div style="float:left;margin-right:2px;">
                                    <div class="form-group">
                                        <select name="search">
                                            <option value="id">直播ID</option>
                                            <option value="id">直播平台</option>
                                            <option value="id">艺人昵称</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                            <span class="input-icon icon-right">
                                                <input type="text" value="" name="searchText" class="form-control" placeholder="搜索">
                                                <i class="fa fa-search"></i>
                                            </span>
                                    </div>
                                </div>
                            </form>
                            <table class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>
                                        昵称
                                    </th>
                                    <th>
                                        封面图
                                    </th>
                                    <th>
                                        身高
                                    </th>
                                    <th>
                                        直播平台
                                    </th>
                                    <th>
                                        直播id
                                    </th>
                                    <th>
                                        描述
                                    </th>
                                    <th>
                                        内容
                                    </th>
                                    <th>
                                        人气
                                    </th>
                                    <th>
                                        操作
                                    </th>
                                </tr>
                                </thead>

                                <tbody>
                                <#list pageContent.getContent() as anchorInfo >
                                <tr id="${anchorInfo.getId()}" >
                                    <td>
                                        ${anchorInfo.getNickname()}
                                    </td>
                                    <td>
                                        <img src=" ${anchorInfo.getSmallImg()}" height="40px">
                                    </td>
                                    <td>
                                        ${anchorInfo.getHeight()}cm
                                    </td>
                                    <td>
                                        ${anchorInfo.getPlatform()}
                                    </td>
                                    <td>
                                        ${anchorInfo.getLiveId()}
                                    </td>
                                    <td>
                                        ${anchorInfo.getDescription()}
                                    </td>
                                    <td>
                                        不展示
                                    </td>
                                    <td>
                                        ${anchorInfo.getLookNumber()}
                                    </td>
                                    <td>
                                        <a href="javascript:void(0);" class="btn btn-labeled btn-palegreen">
                                            <i class="btn-label glyphicon glyphicon-ok"></i>Success
                                        </a>
                                        <a href="javascript:void(0);" class="btn btn-labeled btn-blue">
                                            <i class="btn-label fa fa-exclamation"></i>Info
                                        </a>
                                    </td>
                                </tr>
                                </#list>
                                </tbody>
                            </table>
                            <#include "../common/page.ftl">
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Page Body -->
        </div>
    </div>

</div>

<#include "../common/footjs.ftl">
</body>
</html>