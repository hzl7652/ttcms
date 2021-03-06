<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt" %>
<html>
	<head>
		<title>文章列表</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta name="layout" content="adminmain"/>
	</head>
<body>
	<c:if test="${message != null }">
		<div class="badge badge-info">
		${message}			 					
		</div>
	</c:if>
	<c:if test="${obj.results.size() >0 }">
		<form action="${base }/admin/news/deleteall" method="post">
		<table >
		<thead>
			<tr>
				<td> <input type="checkbox" id="ids" class="selectAll"/><input class="btn" type="submit" value="删除"/></td>
				<td>标题</td>
				<td>标签</td>
				<td>分类</td>
				<td>日期</td>
				<td>操作</td>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${obj.results }"  var="it">
			<tr>
							<td><input name="ids" type="checkbox" value="${it.id }"/></td>
		 					<td>${it.title }</td>
		 					<td>
		 						<c:forEach items="${it.tags }" var="t">
		 								${t.name }&nbsp;&nbsp;&nbsp;&nbsp;
		 						</c:forEach>
		 					</td>
		 					<td>
		 						<c:forEach items="${it.categorys}" var="c">
		 								${c.name }&nbsp;&nbsp;&nbsp;&nbsp;
		 						</c:forEach>
		 					</td>
		 					<td><fmt:formatDate value="${it.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		 					<td><a href="${base }/admin/news/edit?id=${it.id}">编辑</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="${base }/admin/news/delete?id=${it.id}">删除</a></td>
		 		</tr>
		</c:forEach>
		</tbody>
		</table>
		</form>
		<div class="row">
			<div class="span12 pager">
				<c:if test="${ ! obj.pager.first}">
					<a href="${base }/admin/news/list?offset=${obj.pager.pageNumber -1}" class="before">上一页</a>
				</c:if>
				<span >第${obj.pager.pageNumber}页，总页数：${obj.pager.pageCount}，总记录：${obj.pager.recordCount }</span>
				<c:if test="${ ! obj.pager.last}">
					<a href="${base }/admin/news/list?offset=${obj.pager.pageNumber +1}" class="after">下一页</a>
				</c:if>
			</div>
		</div>
	</c:if>
	<c:if test="${obj.results.size() ==0 }">
		<div class="row">
			<div class="span12">
				没有文章，去<a href="${base }/admin/news/create">添加</a>
			</div>
		</div>
	</c:if>
</body>
</html>