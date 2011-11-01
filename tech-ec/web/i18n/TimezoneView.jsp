<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ include file="/includes/main.jsp"%>

<h2 class="contentTitle">时区查看页面</h2>
<div class="pageContent">
	
	<div class="viewInfo" layoutH="97">
        				
		<dl>
			<dt><hi:text key="时区值" entity="Timezone"/>：</dt><dd>${timezone.timezone}</dd>
		</dl>
		<dl>
			<dt><hi:text key="描述" entity="Timezone"/>：</dt><dd>${timezone.description}</dd>
		</dl>
	</div>

	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button class="close" type="button"><hi:text key="关闭"/></button></div></div></li>
		</ul>
	</div>
</div>
