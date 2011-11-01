<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/includes/main.jsp"%>

<form id="pagerForm" action="securityUserList.action">
	<input type="hidden" name="pageInfo.currentPage" value="${pageInfo.currentPage}" />
	<input type="hidden" name="pageInfo.sorterName" value="${pageInfo.sorterName}" />
	<input type="hidden" name="pageInfo.sorterDirection" value="${pageInfo.sorterDirection}" />
	<input type="hidden" name="pageInfo.pageSize" value="${pageInfo.pageSize}" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" method="post" action="securityUserList.action" onsubmit="return dwzSearch(this, '${targetType}');">
	<div class="searchBar">
		<ul class="searchContent">	
			<li>
				<label><hi:text key="姓名" entity="HiUser"/>:</label>
				<input type="text" name="pageInfo.f_fullName" value="${pageInfo.f_fullName}"/>
			</li>	  
			<li>
				<label><hi:text key="部门" entity="HiUser"/>:</label>
				<input type="text" name="pageInfo.org.f_orgName" value="${pageInfo.org.f_orgName}"/>
			</li>	 
		</ul>
		<div class="subBar">
			<div class="buttonActive"><div class="buttonContent"><button type="submit"><hi:text key="查询"/></button></div></div>
		</div>
		</div>
	</form>
</div>
<div class="pageContent">
    <div class="panelBar">
		<c:if test="${empty lookup}">
		<ul class="toolBar">
			<li><a class="delete" href="<hi:url>hiUserRemoveAll.action?ajax=1</hi:url>" target="removeSelected" title="<hi:text key="确实要删除这些记录吗?"/>"><span><hi:text key="批量删除"/></span></a></li>
		</ul>
		</c:if>
	</div>
	<table class="table" width="100%" layoutH="138" targetType="${targetType}">
		<thead>
			<tr>
				<c:if test="${empty lookup}">
				<th width="22"><input type="checkbox" group="orderIndexs" class="checkboxCtrl"></th>
				</c:if>
				<th orderField="userName" class="${pageInfo.sorterName eq 'userName' ? pageInfo.sorterDirection : ''}"><hi:text key="帐号" entity="HiUser"/></th>
				<th orderField="fullName" class="${pageInfo.sorterName eq 'fullName' ? pageInfo.sorterDirection : ''}"><hi:text key="姓名" entity="HiUser"/></th>
				<th orderField="org.orgName" class="${pageInfo.sorterName eq 'org.orgName' ? pageInfo.sorterDirection : ''}"><hi:text key="部门" entity="HiUser"/></th>
				<th orderField="gender" class="${pageInfo.sorterName eq 'gender' ? pageInfo.sorterDirection : ''}"><hi:text key="性别" entity="HiUser"/></th>
				<th width="90">
					<c:choose>
						<c:when test="${empty lookup}"><hi:text key="操作"/></c:when>
						<c:otherwise><hi:text key="查找带回"/></c:otherwise>
					</c:choose>
				</th>
			</tr>
		</thead>				
		<tbody>
			<c:forEach var="item" items="${hiUsers}" varStatus="hiUser">
			<tr>
				<c:if test="${empty lookup}">
				<td><input name="orderIndexs" value="${item.id}" type="checkbox"></td>
				</c:if>			
				    <td>${item.userName}</td>
				    <td>${item.fullName}</td>
				    <td>${item.org.orgName}</td>	
				    <td><hi:select emu="gender" name="hiUsers[${hiUser.index}].gender" isLabel="true"/></td>
				<td>
				<c:choose>
					<c:when test="${empty lookup}">
				      <a class="btnDel" href="<hi:url>securityUserRemove.action?ajax=1&hiUser.id=${item.id}</hi:url>" target="navTabTodo" title="<hi:text key="删除" parameterLanguageKeys="用户"/>"><hi:text key="删除"/></a>
				      <a class="btnEdit" href="<hi:url>securityUserEdit.action?hiUser.id=${item.id}</hi:url>" target="navTab" rel="HiUser" title="<hi:text key="编辑" parameterLanguageKeys="用户"/>"><hi:text key="编辑"/></a>
					</c:when>
				</c:choose>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>	
	<div class="panelBar">
		<div class="pages">
			<span><hi:text key="每页"/></span>
			<c:set var="pageSizeList" value="${fn:split('10|20|50|100', '|')}"/>  
			<select name="pageInfo.pageSize" onchange="dwzPageBreak({targetType:'${targetType}', numPerPage:this.value})">
				<c:forEach var="item" items="${pageSizeList}">
				<option value="${item}" ${item eq pageInfo.pageSize ? 'selected="selected"' : ''}>${item}</option>
				</c:forEach>
			</select>
			<span><hi:text key="条"/>，<hi:text key="共"/>${pageInfo.totalRecords}<hi:text key="条"/></span>
		</div>
		<div class="pagination" targetType="${targetType}" totalCount="${pageInfo.totalRecords}" numPerPage="${pageInfo.pageSize}" pageNumShown="${pageInfo.totalPage}" currentPage="${pageInfo.currentPage}"></div>
	</div>
</div>