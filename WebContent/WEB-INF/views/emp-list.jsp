<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=basePath %>scripts/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
	
	$(function(){
		$(".delete").click(function(){
			var lastName = $(this).next(":input").val();
			var flag = confirm("确实是要删除" + lastName + "的信息吗？");
			if(flag){
				var $tr = $(this).parent().parent();
				//删除，使用ajax的方式
				var url = this.href;
				var args = {"time":new Date};
				$.post(url, args, function(data){
					//若data的返回值为1,则提示 删除成功, 且把当前行删除
					if(data == "1"){
						alert("删除成功");
						$tr.remove();
					}else{
						alert("删除失败");
					}
				});
				
			}
			//取消超链接的默认行为
			return false;
		});
	})

</script>

</head>
<body>

	<h4>Employee List</h4>

	<s:if test="#request.employees == null || #request.employees.size() == 0">
		没有任何员工
	</s:if>
	<s:else>
		<table border="1" cellpadding="10" cellspacing="0" color="red">
			<tr>
				<td>ID</td>
				<td>LASTNAME</td>
				<td>EMAIL</td>
				<td>BIRTH</td>
				<td>CREATETIME</td>
				<td>DEPT</td>
				<td>DELETE</td>
			</tr>
			<s:iterator value="#request.employees">
				<tr>
					<td>${id }</td>
					<td>${lastName }</td>
					<td>${email }</td>
					<td>${birth }</td>
					<td>${createTime }</td>
					<td>${department.departmentName }</td>
					<td>
						<a class="delete" href="emp-delete?id=${id }">Delete</a>
						<input type="hidden" value="${lastName }"/>
					</td>
				</tr>
			</s:iterator>
			
		</table>
	
	</s:else>

</body>
</html>