# Shatroom
<p>A very simple chat page, written in straight up ColdFusion and JavaScript, with no JS libraries required.</p>

<p>The code is contained in four files:</p>
<ul>
<li>index.cfm - Main page with an iFrame with a form for submitting text.</li>
<li>chat.cfm - Text reader that fetches a text file from a writeable directory.</li>
<li>save.cfm - A commit page that saves new chat messages and sets the Chatname in a cookie.</li>
<li>delete.cfm - Clears the chat file.</li>
</ul>
<p>Another file, called chat.txt must be created in a writeable directory.</p>
