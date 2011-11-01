<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ include file="/includes/main.jsp"%>

<h2 class="contentTitle">多语言信息查看页面</h2>
<div class="pageContent">
	
	<div class="viewInfo" layoutH="97">
        				
		<dl>
			<dt><hi:text key="Key值" entity="Language"/>：</dt><dd>${language.keyStr}</dd>
		</dl>
		<dl>
			<dt><hi:text key="实体" entity="Language"/>：</dt><dd>${language.entity}</dd>
		</dl>

		<div class="divider"></div>
		
		<div class="tabs">
			<div class="tabsHeader">
				<div class="tabsHeaderContent">
					<ul>
						<li><a href="javascript:void(0)"><span><hi:text key="从表"/></span></a></li>
						<li><a href="javascript:void(0)"><span><hi:text key="从表2"/></span></a></li>
					</ul>
				</div>
			</div>
			<div class="tabsContent" style="height:120px;">
				<div style="overflow: auto">
					<table class="list" width="100%">
						<thead>
							<tr>
								<th><hi:text key="从字符串" entity="Item"/></th>
								<th><hi:text key="从整数" entity="Item"/></th>
								<th><hi:text key="从浮点" entity="Item"/></th>
								<th><hi:text key="从日期" entity="Item"/></th>
								<th><hi:text key="从日期时间" entity="Item"/></th>
								<th><hi:text key="部门名称" entity="Item"/></th>
								<th><hi:text key="从枚举" entity="Item"/></th>
								<th><hi:text key="从附件" entity="Item"/></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${master.items}">
							<tr>						
								<td>${item.itemString}</td>
								<td>${item.itemInt}</td>
								<td>${item.itemFloat}</td>
								<td><fmt:formatDate value="${item.itemDate}" pattern="yyyy-MM-dd"/></td>
								<td><fmt:formatDate value="${item.itemDataTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td>${item.itemLookup.orgName}</td>
				        		<td><hi:select emu="yesNo" name="item.itemEnum" isLabel="true"/></td>
								<td>
									<a href="attachmentView.action?attachment.id=${item.itemAtt_attachment.id}" target="blank"  >
										${item.itemAtt_attachment.fileNameImage}
									</a>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div style="overflow: auto">
					<table class="list" width="100%">
						<thead>
							<tr>
								<th><hi:text key="测试" entity="Item2"/></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${master.item2s}">
							<tr>						
								<td>${item.testStr}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				
			</div>
			<div class="tabsFooter">
				<div class="tabsFooterContent"></div>
			</div>
		</div>				
	</div>

	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button class="close" type="button"><hi:text key="关闭"/></button></div></div></li>
		</ul>
	</div>
</div>










<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ include file="/includes/main.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <link rel="stylesheet" type="text/css" href="styles/bluewithstyle/css/style.css"  >
  <link rel="stylesheet" type="text/css" href="css/ajaxcss.css"  >
  <script type="text/javascript" src="js/framework/hi_Include.js"></script>
  <script type="text/javascript" src="i18n/Language.js"></script>
  <script type="text/javascript" src="i18n/LanguageStr.js"></script>
</head>
<body>
  <form action="" method="post">
  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="22" class="ViewTableHeader"><hi:text key="查看页面" parameterLanguageKeys="多语言信息" /> </td>
    </tr>
    <tr>
      <td valign="top" class="ViewTableBackground">
		    
        <input type="hidden" id="" name="pageInfo.crruntPage" value="<ws:property value="request['pageInfo.crruntPage']" />">
		<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="ViewTable"> <!-- fields to edit  -->
          <tr>
            <td height="5" >  </td>      
       	  </tr>
		  <tr>
		    <td >
			  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			    <tr>
				  <td width="15%" class="ViewTableLabel"  id="language.keyStrLabel"><hi:text key="Key值" entity="Language"/>:</td>
				  <td width="35%" class="ViewTableData">
				  &nbsp;
					<ws:property value="language.keyStr"/>
				  </td>
				  <td width="15%" class="ViewTableLabel"  id="language.entityLabel"><hi:text key="实体" entity="Language"/>:</td>
				  <td width="35%" class="ViewTableData">
				  &nbsp;
					<ws:property value="language.entity"/>
				  </td>
			    </tr>
				  
				<input type="hidden" id="language.id" name="language.id" value="<ws:property value="language.id"/>">
			  </table>
			</td>
		  </tr>
		  <tfoot>
			<tr>
			  <td colspan="4">
			    &nbsp;
			  </td>
			</tr>
		  </tfoot>
		</table>  <!-- fields to edit end -->
		
		<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
		  <tr>
		    <td>
			  <div id="language_detailTabsDIV">
			    <div id="tabViewmain1_0" class="dhtmlgoodies_aTab">
			  	  <input type="hidden" name="languageStr_Length" id="languageStr_Length" value='<ws:property value="language.languageStrs.size" default="0"/>' />
				  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="DetailTable">
				    <tr>
				    &nbsp;
					</tr>
					<thead>
				    <tr> <!-- detail header -->
				      <td class="DetailTableLable"><hi:text key="语言代码" entity="LanguageStr" /></td>
				      <td class="DetailTableLable"><hi:text key="值" entity="LanguageStr" /></td>
				    </tr>        <!-- detail header end -->
				    </thead>
				    <tbody id="languageStr_Tbody" > 
				    <ws:iterator value="language.languageStrs" id="languageStr" status="languageStrIndex">
				    <tr> <!-- detail body -->								
				      <td class="DetailTableData">&nbsp;
					    <input type="hidden"
									id="language.languageStrs[${languageStrIndex.count-1}].id"
									name="language.languageStrs[${languageStrIndex.count-1}].id"
									value="<ws:property id="languageStr" value="id"/>"/>
						            <ws:property id="languageStr" value="languageCode" escape="false"/>
					    
				      </td>
				      <td class="DetailTableData">&nbsp;
						            <ws:property id="languageStr" value="value" escape="false"/>
					    
				      </td>
				    </tr>   <!-- detail body end -->
				    </ws:iterator>
				    </tbody>
				  </table>
			    </div>
			  </div>
		    </td>
		  </tr>
		</table>
		
		<script language="JavaScript">
          var detailNames = Array('<hi:text key="多语言值" />');
		  var detailTabButtons = Array('true');
		</script>
		    
		<table width="194" border="0" align="center" cellpadding="0" cellspacing="0" class="ViewTableSubmit">
		  <tr>
		    <td><ws:if test="workflow==null"><input name="reback" type="button" id="reback" value="<hi:text key="关闭"    />" class="Button2" onclick="javascript:window.location='languageList.action'"/></ws:if></td>
		  </tr>
		</table>
      </td>
    </tr>
  </table>
  </form>
</body>
</html>