<!DOCTYPE html >
<html>
<head>
<title>Chat</title>
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<script>
//cookie handling
//the majority of the JS is for the cookie. Don't be put off by it.
function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    var expires = "expires="+d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
	document.getElementById("hnd").value = cvalue;
}

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
         }
        if (c.indexOf(name)  == 0) {
            return c.substring(name.length, c.length);
         }
    }
    return "";
}

function checkCookie() {
    var user = getCookie("chatname");
    if (user != "") {
        //alert("Welcome again " + user);
		document.getElementById("hnd").value = user;
	} else if (document.getElementById("hnd").value.length > 1) {
		setCookie("chatname", document.getElementById("hnd").value, 1);
    } else {
        //user = prompt("Please enter your name:", "");
        if (user != "" && user != null) {
            setCookie("chatname", user, 1);
        }
    }
} 

function delCookie () {
	document.cookie = "chatname=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
	setCookie('chatname', '', 0);
	setCookie("chatname", null, null);
	alert("Cleared cookie");
}
//end cookie

//Fetches the last modified date of the ./w/chat.txt file.
//This is used to compare modified dates - and when the last modified date 
//doesn't equal the current date, then it refreshes the iFrame page, chat.cfm
function fetchLast() {
	var f = fetchHeader();
	document.myform.last.value = f;
	//return lastMod;
}

//Debug function that I copied into reloadIFrame
//This isn't used in the code 
function checkDate() {
	var newest = fetchHeader();
	var lastMod = document.myform.last.value;
	if (lastMod != newest ) {
		alert("nomatch");
	} else {
		alert("match Last:" + lastMod + " = " + "Fetch: " + newest);
	}
}
//Reloads the iFrame if the last and current modification dates on the text file don't match
function reloadIFrame() {
	var newest = fetchHeader();
	var lastMod = document.myform.last.value;
	//if the dates don't match, then reload the iFrame and set the last mod date to the current date
	if (lastMod != newest ) {
		//alert("nomatch");
		document.getElementById('chat').contentWindow.location.reload();
		document.myform.last.value = newest;
	} else {
		//alert("match Last:" + lastMod + " = " + "Fetch: " + newest);
	}
}

//set timer to check for a new message every 10 seconds (10,000 ms)
window.setInterval("reloadIFrame();", 10000);
//uses the timer to check the mod date of the text file
function fetchHeader(wch) {
	var url = "../w/chat.txt"; //your text file in a writeable directory
	var wch = "Last-Modified"; //the data type in the HEAD that indicates last mod date
	var n = "";
    try {
        var req=new XMLHttpRequest();
		var val = "";
        req.open("HEAD", url, false);
        req.send(null);
        if(req.status== 200){
			val = req.getResponseHeader(wch); //get the last mod date and return it as val
			return val;
        }
        else return false;
    } catch(er) {
        return er.message;
    }
}
//Submit validation to make sure there's a chatname and some text to post.
function checkname() {
	//if there is no chatname, ask for one
	if (document.getElementById("hnd").value.length < 1) {
		alert("Please enter a handle longer than 1 character");
		document.getElementById("hnd").focus();
	} else {
		//there is a chatname
		//if there is no message, then ask for one.
		if (document.getElementById("msg").value.length < 1) {
			alert("Please enter text to send");
			document.getElementById("msg").focus();
		} else {
			//otherwise, submit the form
			//alert("Send");
			setCookie("chatname", document.getElementById("hnd").value, 1);
			document.myform.submit(); 
		}
	}
}
//Deletes all the chat messages in the chat.txt file
function clearChat() {
	if(confirm("Delete all the posts?")) {
		document.delform.submit();
	}
}
 
console.log(document.cookie);
</script>
<style>
body {
	font-family:arial;
	font-size:14pt;
	color:#ffffff;
	background-color:#000000;
}
#msg, #hnd {
	font-family:arial;
	font-size:14pt;
	color:#ffffff;
	background-color:#555555;
}
.mybutt {
	margin-top: -1px;
	margin-right: 2px;
	padding: 5px 5px 4px 4px;
	font-size: 14px;
	line-height: 1em;
	text-shadow: 0 1px rgba(0, 0, 0, 0.4);
	color: white;
	display:inline-block;
	vertical-align: middle;
	text-align: center;
	cursor: pointer;
	font-weight: bold;
	transition: background 0.1s ease-in-out;
	-webkit-transition: background 0.1s ease-in-out;
	-moz-transition: background 0.1s ease-in-out;
	-ms-transition: background 0.1s ease-in-out;
	-o-transition: background 0.1s ease-in-out;
	text-shadow: 0 1px rgba(0, 0, 0, 0.3);
	color: #fff;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	font-family: 'Helvetica Neue', Helvetica, sans-serif;
  background-color: #f06060;

  text-decoration: none;
}

.mybutt:hover {
	background-color: #ed4444;
}
.mybutt:active {
	box-shadow: 0px 1px 0px 0px #cd1313;
}
</style>
</head>
<body>
<h1></h1>
<body onload="javascript:document.myform.msg.focus();fetchLast();checkCookie();">
<cfoutput>

<iframe src="chat.cfm" name="chat" id="chat" width="820" height="400"></iframe> 
<br />

<form action="save.cfm" method="get" name="myform">
<input type="text" name="hnd" id="hnd" value="" size="10" maxlength="10">
<input type="text" name="msg" id="msg" value="" size="55">
<input type="button" id="btnSend" value="Send" class="mybutt" onclick="checkname();">
<!--- input type="button" name="btnLogout" value="Log Out" onclick="delCookie();" --->
<input type="hidden" name="last" id="last" value="">
</form>

<script>
//Script that listens for the ENTER key (because I'm using button instead of submit
// Get the input field
var input = document.getElementById("msg");
// Execute a function when the user releases a key on the keyboard
input.addEventListener("keyup", function(event) {
  // Cancel the default action, if needed
  event.preventDefault();
  // Number 13 is the "Enter" key on the keyboard
  if (event.keyCode === 13) {
    // Trigger the button element with a click
    document.getElementById("btnSend").click();
  }
});
</script>

<!--- input type=button value=Last onclick="checkDate();" / --->
</cfoutput>

<div id="myDiv"><!-- for debug output --></div>

<!--- Delete form --->
<form action="delete.cfm" method="get" name="delform">
<input type="hidden" name="del" value="y">
</form>

<!--- Delete link is hidden, sort of. --->
<p style="font-size:8pt;">Shatro<span onclick="clearChat();">o</span>m &reg;</p>
</body>
