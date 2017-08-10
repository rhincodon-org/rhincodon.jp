	<!-- Fixed navbar -->
    <div class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="http://rhincodon.jp">rhincodon.jp</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>index.html">Home</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Site <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a target="_blank" href="http://rhincodon.org">rhincodon.org</a></li>
                <li><a target="_blank" href="http://rhincodon.jp">rhincodon.jp</a></li>
                <li><a target="_blank" href="http://rhincodon.biz">rhincodon.biz</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">DevEnv <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a target="_blank" href="https://www.mindmeister.com/">MindMeister</a></li>
                <li><a target="_blank" href="https://www.meistertask.com/app/dashboard">MeisterTask</a></li>
                <li><a target="_blank" href="http://rhincodon.org/jenkins">JenkinsSan</a></li>
                <li><a target="_blank" href="https://github.com/rhincodon-org">GitHub</a></li>
                <li><a target="_blank" href="https://secure.sakura.ad.jp/vps/">SakuraVPS</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Manual <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li class="divider"></li>
                <li class="dropdown-header">GUI</li>
                <li><a target="_blank" href="http://getbootstrap.com">Bootstrap</a></li>
                <li><a target="_blank" href="https://www.primefaces.org">PrimeFaces</a></li>
                <li><a target="_blank" href="https://www.bootsfaces.net">BootsFaces</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Social <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a target="_blank" href="https://twitter.com/rhincodon_org">twitter</a></li>
                <li><a target="_blank" href="http://qiita.com/rhincodon-org">Qiita</a></li>
                <li><a target="_blank" href="https://www.facebook.com/kota.kawahara.58">FaceBook</a></li>
                <li><a target="_blank" href="https://plus.google.com/">Google+</a></li>
              </ul>
            </li>
            <li><a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>about.html">About</a></li>
            <li><a target="_blank" href="https://www.google.co.jp">Google</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>
    <div class="container">
