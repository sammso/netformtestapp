<%@ page language="java" %>
<%@ taglib uri="http://netform.sohlman.com/taglib" prefix="nf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nf:init form="com.sohlman.webapp.netform.reflection.PersonForm" loginPage="login.jsp"/>
<jsp:include page="header.jsp" />
<h1>This example shows how to map Javabeans / POJOs to Form.</h1>
<c:if test="${form.valid == false }"><b>(Form is not valid)</b></c:if>
<c:if test="${form.sessionOutOfSync == true }"><b>(Session was out of sync. You are seing latest session information)</b></c:if>
<p>This contains mapping of Person object, which contains Collection of PersonProperty objects. Form is validated from exceptions that set methods of POJO are thrown when the value is not valid.
</p>
<h2>Source</h2>
<ul>
	<li><a href="source.jsp?source=com.sohlman.webapp.netform.reflection.PersonForm">PersonForm.java</a> - Form</li>
	<li><a href="source.jsp?source=com.sohlman.webapp.netform.reflection.Person">Person.java</a> - Person POJO</li>	
	<li><a href="source.jsp?source=com.sohlman.webapp.netform.reflection.PersonProperty">PersonProperty.java</a> - PersonProperty POJO</li>		
	<li><a href="source.jsp?source=reflection.jsp">reflection.jsp</a></li>	
</ul>
<nf:form>
	<table>
		<tr>
			<td>First name : </td>
			<td><nf:textField component="firstNameTextField" notValidClass="notvalid"/></td>
		</tr>
		<tr>
			<td>Last name :</td>
			<td><nf:textField component="lastNameTextField"  notValidClass="notvalid"/></td>
		</tr>
	</table>
	<table>
		<tr>
			<th colspan="3">Property <c:if test="${form.propertiesTable.valid == false }"><b>(Table is not valid)</b></c:if><th>
		</tr>	
		<tr>
			<th>&nbsp;</th><th>Name</th><th>Value<th>
		</tr>
		<nf:table component="propertiesTable">
		<tr>		
			<td><nf:tableSelection/></td>
			<td><nf:textField index="1" notValidClass="notvalid"/></td>
			<td><nf:textField index="2" notValidClass="notvalid"/></td>
		</tr>			
		</nf:table> 
	</table>
	<nf:button component="addButton" value="Add" styleClass="submit"/>
	<nf:button component="insertButton" value="Insert" styleClass="submit"/>	
	<nf:button component="removeButton" value="Remove" styleClass="submit"/>
	<input type="submit" value="Validate">
</nf:form>
<jsp:include page="footer.jsp" />