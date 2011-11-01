<%@ page language="java" pageEncoding="utf-8"%>
<%@ page import="com.opensymphony.xwork.util.OgnlValueStack"%>
<%@ page import="com.opensymphony.xwork.ActionContext"%>
<%@ page import="com.opensymphony.xwork.interceptor.ExceptionHolder"%>
<%@ page import="org.hi.framework.web.BusinessException"%>

<%@page import="org.hi.framework.web.taglib.component.bean.Token"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Exception!</title>
</head>

<body>
<% 

	if(session.getAttribute(Token.TOKEN_LIST_NAME) != null){
		Token token = (Token)session.getAttribute(Token.TOKEN_LIST_NAME);
		token.delEndToken();
	}


    OgnlValueStack s = ActionContext.getContext().getValueStack(); 
    ExceptionHolder e;
    String s1 = new String("安全管理");;
    String name = new String("");
    for(int i = s.size();i>0;i--){
        Object obj = s.pop();
            System.out.println(obj);
        if(obj instanceof ExceptionHolder){
	            e = (ExceptionHolder)obj;
	            Exception exception = (Exception)e.getException();
	            s1 = exception.getMessage();
	            break;
        }
    }
    

%>
<table width="400" align="center" valign="middle" border="1" cellspacing="2" cellpadding="2">
<tr><td bgcolor="red" align="center" height="30" style="font-size:9pt;">
    <font color="white"><%=name%></font>
</td></tr>
<tr><td>
<H2>错误详细信息:</H2>
<font color="red"><%=s1%></font><br>
</td>
</tr>
<tr><td align="center">
<input type=button name=return value=返回 onclick="javascript:history.go(-1);">
</td></tr>
</table>
</body>
</html>
