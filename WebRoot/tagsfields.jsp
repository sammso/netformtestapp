<%@ page language="java" import="com.sohlman.webapp.netform.*, com.sohlman.netform.*" %>
<%@ taglib uri="http://netform.sohlman.com/taglib" prefix="nf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nf:init form="com.sohlman.webapp.netform.FieldForm" loginPage="login.jsp">
	<c:set target="${form.timestampField}" property="dateFormat" value="yyyy-MM-dd"/>
	<c:set target="${form.timestampField}" property="timeFormat" value="HH:mm"/>
</nf:init>
<jsp:include page="header.jsp" />
<h1>Field Example <c:if test="form.valid==false">(form is not valid)</c:if></h1>
<p>This case demonstrates NetForm different field types and validation system.
If one field is not valid then whole form is not valid. 
Not valid fields are shown as <b class="pink" >Pink</b></p>
<p>Only valid field can inserted to Table Component</p>
<h2>Source</h2>
<ul>
	<li><a href="source.jsp?source=com.sohlman.webapp.netform.FieldForm">FieldForm.java</a></li>
	<li><a href="source.jsp?source=tagsfields.jsp">tagsfields.jsp</a></li>	
</ul>
<nf:form>
<table border="0" width="580">
	<tr>
		<td class="text">TextField<br>component<br><i>Valid when contains 1 - 20 characters</i></td>
		<td colspan="2"><nf:textField component="textField" style="width: 215px;" notValidClass="notvalid"/></td>
	</tr>
	<tr>  
		<td class="text">IntegerField component<br></td>
		<td><nf:textField component="integerField" style="width: 215px;" notValidClass="notvalid"/></td>
		<td><nf:button component="increaseIntButton" styleClass="submit" value="+"/>
			<nf:button component="decreaseIntButton" styleClass="submit" value="-"/></td>
	</tr>
	<tr>  
		<td class="text">FloatField component<br></td>
		<td colspan="2" align="left"><nf:textField component="floatField" style="width: 215px;" notValidClass="notvalid"/></td>
	</tr>	
	<tr>  
		<td class="text">DoubleField component<br></td>
		<td colspan="2"><nf:textField component="doubleField" style="width: 215px;" notValidClass="notvalid"/></td>		
	</tr>
	<tr>  
		<td class="text">LongField component<br><i>( value has to be 1 - 20 )</i></td>
		<td colspan="2"><nf:textField component="longField" style="width: 215px;" notValidClass="notvalid"/></td>
	</tr>	
	<tr>  
		<td rowspan="2" valign="top"  class="text">PasswordField component<br><i>Password fields has to be egual to be valid.</i></td>
		<td colspan="2"><nf:textField component="firstPasswordField" style="width: 215px;" notValidClass="notvalid"/></td>
	</tr>	
	<tr>  
		<td colspan="2"><nf:textField component="secondPasswordField" style="width: 215px;" notValidClass="notvalid"/></td>
	</tr>
	<tr>
		<td class="text">Timestamp field<br><i>[${form.timestampField.dateFormat}][${form.timestampField.timeFormat}]</i></td>
		<td>
			<input style="width: 100px;" type="text" name="${form.timestampField.responseNameForDate}" value="${form.timestampField.dateText}">
			<input style="width: 100px;" type="text" name="${form.timestampField.responseNameForTime}" value="${form.timestampField.timeText}">			
		</td>
		<td align="middle" >
			<table cellpadding="0" cellspacing="0" border="0" width="104">
				<tr>
					<td width="40" class="text">Day:</td>
					<td width="64"><nf:button component="yesterdayButton" style="width: 30px;" styleClass="submit" value="-"/><nf:button component="tomorrowButton" style="width: 30px;" styleClass="submit" value="+"/></td>
				</tr>
				<tr>
					<td class="text">Month:</td>
					<td><nf:button component="previousMonthButton" style="width: 30px;" styleClass="submit" value="-"/><nf:button component="nextMonthButton" style="width: 30px;" styleClass="submit" value="+"/></td>
				</tr>
			</table>
		</td>
	</tr>	
	<tr>
		<td class="text">Table Component</td>
		<td colspan="2" valign="top" rowspan="2">	
			<nf:select component="table" style="width: 320px;" size="18" notValidClass="notvalid">
				<nf:selectItem index="1"/>
			</nf:select>
		</td>		
	</tr>		
	<tr>
		<td align="center">
			<nf:button component="doubleToTableButton" style="width: 130px;" styleClass="submit" value="Double value ->"/>
			<nf:button component="floatToTableButton" style="width: 130px;" styleClass="submit" value="Float value ->"/>			
			<nf:button component="integerToTableButton" style="width: 130px;" styleClass="submit" value="IntegerField value ->"/>
			<nf:button component="longToTableButton" style="width: 130px;" styleClass="submit" value="LongField value ->"/>			
			<nf:button component="passwordToTableButton" style="width: 130px;" styleClass="submit" value="Password value ->"/>
			<nf:button component="textToTableButton" style="width: 130px;" styleClass="submit" value="Textfield value ->"/>
			<nf:button component="timestampToTableButton" style="width: 130px;" styleClass="submit" value="Timestamp value ->"/>	
			<nf:button component="deleteSelectedFromTableButton" style="width: 130px;" styleClass="submit" value="Remove"/>
			<input style="width: 130px;" type="submit" name="" value="Validate" class="submit">
		</td>
	</tr>	
</table>
</nf:form>
<jsp:include page="footer.jsp" />