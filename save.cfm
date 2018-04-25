<cfoutput>
<cfparam name="msg" default="">
<cfparam name="hnd" default="">
<cfif isDefined("url.msg")>
	<cfset msg = url.msg>
	<cfset hnd = url.hnd>
</cfif>
<cfset msg = #Trim(msg)#>
<!---escape naughty characters, just in case--->
<cfset msg = replaceNoCase(msg, ";", "&##59;", "ALL")>
<cfset msg = replaceNoCase(msg, "<", "&lt;", "ALL")>
<cfset msg = replaceNoCase(msg, ">", "&gt;", "ALL")>
<cfset msg = replaceNoCase(msg, "{", "&lcub;", "ALL")>
<cfset msg = replaceNoCase(msg, "}", "&rcub;", "ALL")>
<cfset msg = replaceNoCase(msg, "?", "&quest;", "ALL")>
<cfset msg = replaceNoCase(msg, ":", "&colon;", "ALL")>
<cfset msg = replaceNoCase(msg, "/", "&sol;", "ALL")>
<cfset msg = replaceNoCase(msg, "\", "&bsol;", "ALL")>
<cfset msg = replaceNoCase(msg, '"', "&quot;", "ALL")>
<cfset msg = replaceNoCase(msg, "'", "&##39;", "ALL")>

<!DOCTYPE html>
<html>
<head><title></title>
<script language="JavaScript">
//cookie handling
//Set the cookie to the chatname value from the index form
function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    var expires = "expires="+d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}
console.log(document.cookie);
//end cookie
</script>
<style>
body {
	font-family:arial;
	font-size:14pt;
	color:##ffffff;
	background-color:##777777;
}
</style>
</head>
<body onload="setCookie('chatname', '#hnd#', 1);">

<cfif msg NEQ "">
	<!---Add spaces to chatname until all the chars in chatname equal 10 --->
	<cfset padding = "" >
	<cfset hndLen = (10 - Len(#hnd#)) >
	<cfloop from="0" to="#hndLen#" index="i">
		<cfset padding = padding & "&nbsp;" >
	</cfloop>
	<cfset hnd = "#hnd#" & "#padding#" >
	<cffile action = "append" file = "C:\inetpub\wwwroot\w\chat.txt" output = "#timeFormat(now(), 'HH:mm:ss')#|#hnd#|#msg#">
	<!---return to the index file --->
	<cflocation url="./index.cfm">
</cfif>

</body>
</html>



</cfoutput>
