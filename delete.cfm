<cfoutput>
<cfparam name="del" default="">
<cfif isDefined("url.del")>
	<cfset del = url.del>
</cfif>
<!DOCTYPE html>
<html>
<head><title></title>
</head>
<body>

<cfif del NEQ "">
	<cffile action = "write" file = "C:\inetpub\wwwroot\w\chat.txt" output = "">
	<cflocation url="./index.cfm" >
</cfif>

</body>
</html>
</cfoutput>
