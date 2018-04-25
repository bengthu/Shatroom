<!DOCTYPE html >
<html>
<head>
<title>Chat</title>
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<style>
body {
	font-family:arial;
	font-size:14pt;
	color:#ffffff;
	background-color:#777777;
}
p {
	font-family:courier;
	margin: 7px;

}
</style>
<style>
body {
	font-family:arial;
	font-size:14pt;
	color:#ffffff;
    background-color: #7777777;
    -webkit-animation-name: example; /* Safari 4.0 - 8.0 */
    -webkit-animation-duration: .5s; /* Safari 4.0 - 8.0 */
    animation-name: example;
    animation-duration: .5s;
}

/* Safari 4.0 - 8.0 background-color:#777777;*/
@-webkit-keyframes example {
    from {background-color: yellow;}
    to {background-color: #7777777;}
}

/* Standard syntax */
@keyframes example {
    from {background-color: yellow;}
    to {background-color: #7777777;}
}
</style>
</head>
<body> 
<!---Set to ASC or DSC --->
<cfset sort="DSC">

<cfoutput>
<!---Set the writeable directory --->
<cfset filePath = expandPath( "../w/chat.txt" ) />
<cfset count = 1>
<!---lineout isn't used after I added them to the array --->
<cfset lineout = "">
<!---Create an array to hold the lines --->
<cfset arrLines=ArrayNew(1)>
<!---Read the file and loop through each line--->
<cfloop index="line" file="#filePath#">
	<!---Add each line to an array --->
	<cfset arrLines[count]="#line#">
	<!---lineout not used --->
	<cfset lineout = lineout & #line# & Chr(10) >
	<cfset count = count+1>
</cfloop>

<!---Sort array either ASC or DSC, then loop through the array to print the lines--->
<cfif sort EQ "ASC">
	<cfloop from="1" to="#arrayLen(arrLines)#" index="i">
		<p>#arrLines[i]# </p>
	</cfloop>
<cfelseif sort EQ "DSC">
	<cfloop index="i" from="#arrayLen(arrLines)#" to="1" step="-1">
	   <p>#arrLines[i]# </p>
	</cfloop>
</cfif>

</cfoutput>

</body>
</html>
