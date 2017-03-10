<script>
    (function(){
        var bp = document.createElement('script');
        var curProtocol = window.location.protocol.split(':')[0];
        if (curProtocol === 'https'){
            bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
        }
        else{
            bp.src = 'http://push.zhanzhang.baidu.com/push.js';
        }
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(bp, s);
    })();
</script>
<div role="navigation" id="nav" class="closed" aria-hidden="false" style="transition: max-height 400ms; position: relative;">
    <div>
        <div class="header-left">
            <div class="header-left-logo hidden-xs">
                <img src="__PUBLIC__/img/h.png"/>
            </div>
            <div class="header-left-img hidden-xs">
                <div class="img-circle">
                    <notempty  name="Think.session.user.userimg">
                        <img src="__PUBLIC__/{%$Think.session.user.userimg%}"/>
                        <else/>
                        <p>{%$Think.session.user.username%}&nbsp;</p>
                    </notempty >
                </div>
            </div>
            <div class="header-left-user">
                <div>
                    <dt>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</dt>
                    <dd>{%$Think.session.user.username%}&nbsp;</dd>

                    <dt>所属部分：</dt>
                    <dd class="text-none-space">{%$Think.session.user.usertype%}&nbsp;</dd>

                    <dt>岗位信息：</dt>
                    <dd class="text-nowrap">{%$Think.session.user.userpost%}&nbsp;</dd>
                </div>
            </div>
        </div>
        <ul>
            <li <eq name="meau" value="home">class="active"</eq>><a href="/Admin/Index/index"><i class="fa fa-home fa-2x"></i>首页信息</a></li>
            <li class='<eq name="meau" value="integral">active</eq>'><a href="/Admin/integral/index"><i class="fa fa-dedent fa-2x"></i>积分管理</a></li>
            <li <eq name="meau" value="svn">class="active"</eq>><a href="/Admin/Svn/index"><i class="fa fa-arrow-up fa-2x"></i>我的SVN</a></li>
            <li <eq name="meau" value="set">class="active"</eq>><a href="/Admin/Set/index"><i class="fa fa-user fa-2x"></i>个人设置</a></li>
            <li <eq name="meau" value="system">class="active"</eq>><a href="/Admin/System/index"><i class="fa fa-cog fa-2x"></i>系统配置</a></li>
            <eq name="Think.session.user.id" value="4">
                <li <eq name="meau" value="user">class="active"</eq>><a href="/Admin/User/index"><i class="fa fa-cog fa-2x"></i>用户管理</a></li>
            </eq>
            <li><a href="/Admin/Login/out"><i class="fa fa-power-off fa-2x"></i>退出系统</a></li>
        </ul>
    </div>
</div>