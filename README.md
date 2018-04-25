# Shatroom
A very simple chat page, written in straight up ColdFusion and JavaScript, with no JS libraries required.

The code is contained in four files:
index.cfm - Main page with an iFrame with a form for submitting text.
chat.cfm - Text reader that fetches a text file from a writeable directory.
save.cfm - A commit page that saves new chat messages and sets the Chatname in a cookie.
delete.cfm - Clears the chat file.

Another file, called chat.txt must be created in a writeable directory.
