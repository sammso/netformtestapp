<%@ page language="java" import="com.sohlman.webapp.netform.*, com.sohlman.netform.*, com.sohlman.netform.component.*" %>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

	ContainerForm form = null;
	try
	{
		form = (ContainerForm)FormManager.getForm(request, response, getServletContext(), ContainerForm.class, "login.jsp");
		form.execute();  
%> 
<jsp:include page="header.jsp" /> 
<h1>Tabs form</h1>
<h2>Introduction</h2>
<p>This shows how to make server side tab sheets by using Container component.</p>
<p>This form requires Javascript. It is possible to implement without javascript too, but it is impossible to make links which make submit, without javascript.</p>
<h2>Usage:</h2>
<p>Write values to fiels and see how they stay while changingt tab sheets.</p>
<form name="netform" method="POST" action="<%=form.getPostAction() %>">
<input type="hidden" name="hiddenfield" value="x">
<table>
<tr><td>
<table border="0" cellpadding="0" cellspacing="0" width="406">
		<% 
		if(form.firstContainer.isVisible())
		{ 
		%>
			<tr>
				<td width="200" class="tabsheet" align="center">First tab</td>
				<td width="200" class="tabsheetnotsel" align="center"><a href="javascript:document.netform.hiddenfield.name='<%=form.firstContainer.toSecondButton.getResponseName() %>';document.netform.submit();"><u><b>Second Tab</b></u></a></td>
			</tr>
			<tr>
				<td class="tabpage" colspan="2" align="center">
					<table border="0" cellpadding="2" cellspacing="2"><tr><td class="text" >
					First Field at First tab<br>
					<input type="text" name="<%=form.firstContainer.firstTextField.getResponseName() %>" value="<%=form.firstContainer.firstTextField.getText() %>"><br>
					Second Field at First tab<br>
					<input type="text" name="<%=form.firstContainer.secondTextField.getResponseName() %>" value="<%=form.firstContainer.secondTextField.getText() %>"><br>
					</td></tr></table>
				</td>
			</tr><%
		}
		else
		{
		%>
			<tr>
				<td class="tabsheetnotsel" align="center"><a href="javascript:document.netform.hiddenfield.name='<%=form.secondContainer.toFirstButton.getResponseName() %>';document.netform.submit();"><u><b>First Tab</b></u></a></td>		
				<td class="tabsheet" align="center">Second Tab</td>
			</tr>
			<tr>
				<td class="tabpage" colspan="2" align="center">
					<table border="0" cellpadding="2" cellspacing="2">
						<tr>
							<td class="text" >First Field at Second tab	</td>
							<td class="text" >Second Field at Second tab</td>
						</tr>
						<tr>
							<td class="text" ><input type="text" name="<%=form.secondContainer.firstTextField.getResponseName() %>" value="<%=form.secondContainer.firstTextField.getText() %>"></td>
							<td class="text" ><input type="text" name="<%=form.secondContainer.secondTextField.getResponseName() %>" value="<%=form.secondContainer.secondTextField.getText() %>"></td>
						</tr>						
					</table>
					<br>
					<br>
				</td>
			</tr><%
		}
		%>
</table>
</td></tr></table>
</form>
<jsp:include page="footer.jsp" /><%
}
catch(DoRedirectException doRedirectException)
{
	response.sendRedirect(doRedirectException.getPage());
}
catch(NetFormException netFormException)
{
	
}  
%>

