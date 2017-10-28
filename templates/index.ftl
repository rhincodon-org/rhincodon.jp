<#include "header.ftl">
	
	<#include "menu.ftl">

	<div class="page-header">
		<h1>電子の海の回遊録</h1>
	</div>

	<p>Older posts are available in the <a href="${content.rootpath}${config.archive_file}">archive</a>.</p>
	<hr />

	<#list posts as post>
  		<#if (post.status == "published")>
  			<a href="${post.uri}"><h1><#escape x as x?xml>${post.title}</#escape></h1></a>
  			<p>${post.date?string("dd MMMM yyyy")}</p>
  			<p>${post.body}</p>
  		</#if>
  	</#list>
<#include "footer.ftl">
