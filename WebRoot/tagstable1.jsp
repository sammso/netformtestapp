<%@ taglib uri="http://netform.sohlman.com/taglib" prefix="nf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nf:init form="com.sohlman.webapp.netform.Table1Form" loginPage="login.jsp"/>
<jsp:include page="header.jsp" />
<h1>1. Table Example <c:if test="${form.valid == false }"><b>(Form is not valid)</b></c:if></h1>
<c:if test="${form.sessionOutOfSync == true }"><b>(Session was out of sync. You are seing latest session information)</b></c:if>
<h2>Introduction</h2>
<p>This case demonstrate NetForm table component with field components inside, 
it also demonstrates the validation of fields inside of Table. 
Form is not valid if all components are not valid. 
Not valid fields are shown as <b class="pink" >Pink</b></p>
<h2>Source</h2>
<ul>
	<li><a href="source.jsp?source=com.sohlman.webapp.netform.Table1Form">Table1Form.java</a></li>
	<li><a href="source.jsp?source=tagstable1.jsp">tagstable1.jsp</a></li>	
</ul>
<h2>Column validation rules</h2>
<ul>
	<li>Number has to be number</li>
	<li>First name has be at least 3 chars</li>
	<li>Last name has be at least 3 chars</li>	
	<li>Birthday has to be date format (yyyy-MM-dd)</li>
</ul>
<p>This is using <a href="http://dataset.sohlman.com">DataSet</a> as internal datastore</p>
<nf:form>
<table width="480">
	<tr>
		<th width="80">Selected</th><th width="100">Number</th><th width="100">First name</th><th  width="100">Last name</th><th  width="100">Birthdate</th>
	</tr>
	<nf:table component="table">
	<tr>
		<td align="center">
			<nf:tableSelection/>
		</td>
		<td align="center"><nf:textField index="1" style="width: 90;" format="00000" notValidClass="notvalid"/></td>
		<td align="center"><nf:textField index="2" style="width: 90;" notValidClass="notvalid"/></td>		
		<td align="center"><nf:textField index="3" style="width: 90;" notValidClass="notvalid"/></td>		
		<td align="center"><nf:textField index="4" style="width: 90;" format="yyyy-MM-dd" notValidClass="notvalid"/></td>		
	</tr>
	</nf:table>	
</table>
<nf:button component="addRowButton" value="Add"/>
<nf:button component="insertRowButton" value="Insert"/>
<nf:button component="deleteRowButton" value="Delete"/>
<input type="submit" name="" value="Validate" class="submit">
</nf:form> 
<jsp:include page="footer.jsp" />