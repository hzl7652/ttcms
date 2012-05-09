<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<html>
	<head>
		<title>更新文章</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta name="layout" content="adminmain"/>
	</head>
<body>
		 	<div class="row-fluid">
		 			<div class="span12">
		 				<c:if test="${message != null }">
			 				<div class="badge badge-info">
								${message}			 					
			 				</div>
		 				</c:if>
		 				<form action="${base }/admin/news/update" method="post">
		 				 <input type="hidden" name="id" value="${news.id }"/>
		 					<table style="width:100%">
		 						<tbody>
		 							<tr>
		 								<td>标题:</td>
		 								<td style="width:90%"><input  name="title" value="${news.title }" style="width:70%"/></td>
		 							</tr>
		 							<tr>
		 								<td>标签:</td>
		 									
		 								<td>
		 								<c:forEach items="${tags }" var="tag">
		 									<c:set var="flag" value="${false }"></c:set>
				 								<c:forEach items="${news.tags }" var = "t">
				 									<c:if test="${tag.id == t.id }">
				 										<c:set var="flag" value="${true }"/>
				 									</c:if>	
			 									</c:forEach>
			 										<c:if test="${flag }">
				 										<input type="checkbox" checked="checked"  name="tags" value="${tag.id}"/> ${tag.name } 
				 									</c:if>
				 									<c:if test="${! flag }">
				 										<input type="checkbox"  name="tags" value="${tag.id}"/> ${tag.name } 
			 										</c:if>
		 								</c:forEach>
		 								</td>
		 							</tr>
		 							<tr>
		 								<td>分类:</td>
		 								<td>
		 								<c:forEach items="${cats }" var="cat">
		 									<c:set var="flag" value="${false }"></c:set>
				 								<c:forEach items="${news.categorys }" var = "c">
				 									<c:if test="${cat.id == c.id }">
				 										<c:set var="flag" value="${true }"/>
				 									</c:if>	
			 									</c:forEach>
			 										<c:if test="${flag }">
				 										<input type="checkbox" checked="checked"  name="cats" value="${cat.id}"/> ${cat.name } 
				 									</c:if>
				 									<c:if test="${! flag }">
				 										<input type="checkbox"  name="cats" value="${cat.id}"/> ${cat.name } 
			 										</c:if>
		 								</c:forEach>
		 							</tr>
		 							<tr>
		 								<td> 内容:</td>
		 								<td><textarea name="content" style="width:70%" rows="30"></textarea>
		 								    <p>
											您当前输入了 <span class="word_count">0</span> 个文字。
											</p>
											<div id="ctt" style="display:none">
												${news.content }
											</div>
										</td>
		 							</tr>
		 							<tr>
		 								<td colspan="2" align="center"><input type="submit" class="btn"  value="更新"/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void();" onclick="history.back();" class="btn">返回</a></td>
		 							</tr>
		 						</tbody>
		 					</table>
		 					 </form>
		 			</div>
		 	</div>
		 	<script charset="utf-8" src="${base}/editor/kindeditor-min.js"></script>
			<script charset="utf-8" src="${base}/editor/lang/zh_CN.js"></script>
			<script>
				var editor ;
				KindEditor.ready(function(K) {
					editor = K.create('textarea[name="content"]', {
						allowImageUpload:false,
						allowFlashUpload:false,
						allowMediaUpload:false,
						allowFileUpload:false,
						//filterMode:true,
						items:['source','|','undo','redo','|','template','plainpaste','wordpaste','quickformat',
						       '|','formatblock','fontname','fontsize','forecolor','hilitecolor','bold','italic',
						       'underline','strikethrough','link','unlink','insertorderedlist','insertunorderedlist',
						       '|','image','flash','media','table',
						       'emoticons','map','code','|','fullscreen'],
						afterChange : function() {
							K('.word_count').html(this.count('text'));
						}
					});
					editor.html(K("#ctt").html());
				});
			</script>
</body>
</html>