<%@page contentType="text/plain" pageEncoding="UTF-8" language="java" 
import="
pt.webdetails.cdf.*,
pt.webdetails.cdf.test.*,
org.pentaho.platform.util.messages.LocaleHelper,
org.pentaho.platform.engine.core.system.PentahoSystem,
org.pentaho.platform.api.engine.IPentahoSession,
org.pentaho.platform.web.http.PentahoHttpSessionHelper,
org.pentaho.platform.web.http.request.HttpRequestParameterProvider,
org.pentaho.platform.web.http.session.HttpSessionParameterProvider
"%><%
	response.setCharacterEncoding(LocaleHelper.getSystemEncoding());
	HttpSession httpSession = request.getSession();
    
	String baseUrl = PentahoSystem.getApplicationContext().getBaseUrl();

	IPentahoSession userSession = PentahoHttpSessionHelper.getPentahoSession( request );

	HttpRequestParameterProvider requestParameters = new HttpRequestParameterProvider( request );
	HttpSessionParameterProvider sessionParameters = new HttpSessionParameterProvider( userSession );

	String solution = request.getParameter( "solution" ); 
	String path = request.getParameter("path");
	
	if( "".equals( solution ) ) { 
		solution = null;
	}
	if( path == null ) { 
		path = "";
	}
    System.out.println("Solution : >" + solution + "<, " + "Path : >" + path + "<");
    
    
        TestJSon jsonTest = new TestJSon();
        String test = jsonTest.doTest();
        
        NavigateComponent nav = new NavigateComponent(userSession);
        // test = nav.getNavigationElements(solution, path); //we want the entire tree
        test = nav.getNavigationElements("", "");

%><%= test %>
