<%@ page language="java" import="java.io.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>Source view</title>
</head>
<body>
<%
	FileInputStream fileInputStream = null;
	try
	{
	
		String lS_Parameter=request.getParameter("source");
		
		if(lS_Parameter==null)
		{
			%><p>No valid parameter</p><%
		}
		else
		{
			File file;
			if(lS_Parameter.endsWith(".jsp"))
			{
				file = new File(getServletContext().getRealPath("/"), lS_Parameter);
			}
			else
			{
				lS_Parameter = lS_Parameter.replace('.','/');
				file = new File(getServletContext().getRealPath("/"), "WEB-INF/src/" + lS_Parameter + ".java");
			}
				
			System.out.println(file.getAbsolutePath());
			if(file.exists())
			{
				fileInputStream = new FileInputStream(file); %>
<pre>
<%				
	            for(int ch = fileInputStream.read(); ch != -1; ch = fileInputStream.read())
	            { 
	                if (ch == '<')
	                {
	                    out.print("&lt;");
					}
					else if(ch == '>')
					{
						out.print("&gt;");
					}
	                else
	                {
	                    out.print((char) ch);
					} 

				}
%></pre>
<%				
			}
			else
			{%>
	<p>File "<%=file.getAbsolutePath() %>" doesn't exist <%=getServletContext().getRealPath("/") %></p>
	<%
			}
		}
	}
	catch(IOException ioException)
	{
		
	}
	finally
	{
		try
		{
			if(fileInputStream!=null) fileInputStream.close();
		}
		catch(IOException ioException)
		{
			
		}
	}
		
 
%>
</body>
</html>
