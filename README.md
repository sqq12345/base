 ## 功能简介
 #### 基本功能
 * 后台用户管理
 * 后台角色管理
 * 基于菜单的权限管理
 * 后台用户操作日志管理
 * 系统错误日志管理
 * 数据表管理
 * 数据库备份管理

 #### 其他功能
 * MarkDown编辑器
 * MD转HTML
 * Ueditor
 * 阿里大于
 * 二维码生成
 * 第三方登录（QQ已经可测试）
 * 文件上传下载
 * Excel导入导出
 * 邮件发送(支持附件)
 * 阿里云OSS
 * 七牛云存储

 #### Api相关
对于刚开始做api开发的同学，可能有些这方面的困惑，恰好本人也做过几个api开发的案例，
在此开源给大家自己做过的一些代码和方法，技术实现上可能并没有大神们处理的好，所以仅供
小白们参考一下。
具体代码在<kbd>application\api\controller</kbd>目录下,
包括基于JWT的登录认证，友好的数据返回格式等等，更多可直接阅读源码。



 #### 视图ajax请求封装
 后台表单提交和某些按钮操作做了ajax封装，以达到更好的用户体验。以下介绍一下表单和按钮的使用：
 ######表单ajax
  - 表单class加上`dataForm`将会采用ajax形式提交表单,相关js在`/public/static/admin/js/app.min.js`中

  html代码示例：
  ```
    <form id="dataForm" class="form-horizontal dataForm" action="" method="post" enctype="multipart/form-data">
    <!--这里省略input等表单组件-->
    ...
    </form>
  ```

  js代码：
  ```
    $(".dataForm").submit(function (e) {
    //这里省略相关js代码，可直接参考/public/static/admin/js/app.min.js内代码
    ...
    });
  ```

 ###### 按钮或其他标签ajax
 - 元素class加上`AjaxButton`,其他属性和对应介绍如下：

 1. `data-url`代表要访问的url
 2. `data-type`  值为1代表执行ajax操作(参考多数页面删除按钮)，2代表在当前页面弹出layer窗口(参考操作日志详情效果)，
 3. `data-confirm` 值为1代表弹出询问框，值为2为无需确认，直接执行操作
 4. `data-confirm-title` 为layer confirm标题
 4. `data-confirm-content` 为layer confirm提示内容
 5. `data-id` 为要操作的数据id

 其他参数值都可以直接在`app.min.js`中找到

 html代码示例：
 ```
 <a class="btn btn-danger btn-xs AjaxButton" title="删除" data-id="{$item.id}" data-url="del.html">
     <i class="fa fa-trash"></i>
 </a>
 ```

 js相关代码：
  ```
   $(".AjaxButton").on('click', function(){
       //这里省略相关js，可直接参考/public/static/admin/js/app.min.js内代码
   });

  ```

 ###### ajax执行后跳转相关

 在/application/admin/controller/Base.php中，定义了以下常量:
 ```
     //url跳转常量
     const URL_CURRENT = 'url://current';
     const URL_RELOAD  = 'url://reload';
     const URL_BACK    = 'url://back';
 ```
 current表示停留在当前页面，不做任何操作。

 reload表示重载当前页面。

 back表示返回上一页。

 想要跳到指定页面，传入你要跳的url就好了

 php中success方法默认是返回上一页，error方法默认是不做任何操作，可参考Base.php中的相关代码。
