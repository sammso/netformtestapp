<%@ page language="java" import="com.sohlman.webapp.netform.*, com.sohlman.netform.*, com.sohlman.netform.component.*" %>
<% 
	Table1Form form = null; 
	ServletContext l_ServletContext = getServletContext();	
	try 
	{
		form = (Table1Form)FormManager.getForm(request, response, l_ServletContext, Table1Form.class, "login.jsp");
		// Set column formats for table (NOTE has to be done before execute)
		form.table.setColumnFormat(1,"00000");		
		form.table.setColumnFormat(4,"yyyy-MM-dd");	
		form.execute(); 
	
%> 
<jsp:include page="header.jsp" />
<h1>1. Table Example <% if(!form.isValid()) {%>(form is not valid)<% } %></h1>
<h2>Introduction</h2>
<p>This case demonstrate NetForm table component with field components inside, 
it also demonstrates the validation of fields inside of Table. 
Form is not valid if all components are not valid. 
Not valid fields are shown as <b class="pink" >Pink</b></p>
<h2>Source</h2>
<ul>
	<li><a href="source.jsp?source=com.sohlman.webapp.netform.Table1Form">Table1Form.java</a></li>
	<li><a href="source.jsp?source=table1.jsp">table1.jsp</a></li>	
</ul>
<h2>Column validation rules</h2>
<ul>
	<li>Number has to be number</li>
	<li>First name has be at least 3 chars</li>
	<li>Last name has be at least 3 chars</li>	
	<li>Birthday has to be date format (yyyy-MM-dd)</li>
</ul>
<p>This is using <a href="http://dataset.sohlman.com">DataSet</a> as internal datastore</p>
<form method="POST" action="<%=form.getPostAction() %>">
<table width="480">
	<tr>
		<th width="80">Selected</th><th width="100">Number</th><th width="100">First name</th><th  width="100">Last name</th><th  width="100">Birthdate</th>
	</tr><% 
			for(int li_y = 1 ; li_y <= form.table.getDisplayRowCount()  ; li_y++)
			{ %>
	<tr>
		<td align="center">
			<input type="checkbox" name="<%=form.table.getResponseName() %>"  value="<%=form.table.getRowId(li_y) %>"<%=form.table.getStringIfRowSelected(li_y, " checked") %>>
		</td>
		<td align="center"><input style="width: 90;" type="text" name="<%=form.table.getComponentAt(li_y,1).getResponseName() %>" value="<%=form.table.getTextFieldAt(li_y,1).getText() %>" <%=form.table.getComponentAt(li_y, 1).getStringIfIsNotValid("class=\"notvalid\"") %>></td>		
		<td align="center"><input style="width: 90;" type="text" name="<%=form.table.getComponentAt(li_y,2).getResponseName() %>" value="<%=form.table.getTextFieldAt(li_y,2).getText() %>" <%=form.table.getComponentAt(li_y, 2).getStringIfIsNotValid("class=\"notvalid\"") %>></td>
		<td align="center"><input style="width: 90;" type="text" name="<%=form.table.getComponentAt(li_y,3).getResponseName() %>" value="<%=form.table.getTextFieldAt(li_y,3).getText() %>" <%=form.table.getComponentAt(li_y, 3).getStringIfIsNotValid("class=\"notvalid\"") %>></td>
		<td align="center"><input style="width: 90;" type="text" name="<%=form.table.getComponentAt(li_y,4).getResponseName() %>" value="<%=form.table.getTextFieldAt(li_y,4).getText() %>" <%=form.table.getComponentAt(li_y, 4).getStringIfIsNotValid("class=\"notvalid\"") %>></td>
	</tr><%
			} 
	%></table>
<input type="submit" name="<%=form.addRowButton.getResponseName()%>" value="Add" class="submit">
<input type="submit" name="<%=form.insertRowButton.getResponseName()%>" value="Insert" class="submit">
<input type="submit" name="<%=form.deleteRowButton.getResponseName()%>" value="Delete" class="submit">
<input type="submit" name="" value="Validate" class="submit">
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