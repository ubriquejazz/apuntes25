# Lab 6 : Email, processes and networking 

## Exercise 0: Enable SMTP service 
 
First let’s try to enable the SMTP service as an internet service, i.e. inetd daemon is going to be 
reconfigured: 

However no message is received as the SMTP service is provided by its own daemon (sendmail). 

Besides  the  normal  procedure  would  be  to  uncomment  lines  in  the  inetd.conf  file  instead  of 
inserting them (error prone). 

## Exercise 1. Sending email using mail 

1.1. Redirect a file to mail using the syntax below to send it to bob. 
mail -s subject user@domain < message.txt 
1.2. Explain what the following command does: 
 
echo “Welcome to Computer Systems” | mail -s “Hello world” bob@anglia.bryant -c  
smith@anglia.bryant -b root@anglia.bryant 
Answer 1 & 2: This command makes use of pipes to forward the result of the echo command into 
the message body (Welcome to...) 

## Exercise 2. Checking email

Log in as bob and check that all emails sent to bob are present.  
In the Exercise 1.2 a message was actually sent to bob. If the daemon sendmail is not running, 
the emails are saved in the filesystem and will be sent once the daemon starts: 
 # ls -l /var/spool/mqueue/ 
 
Nevertheless the messages were received correctly (su bob): 
SID 1566921 Page 2

## Exercise 3. Exploring mail 

### 3.1. Describe how to read, reply, send, delete, list and save messages. 
 
To get more info type the command “mail ?” 
command argument description
type <message list> next also type to the next message
reply <message list> replay to message senders (Replay) and all recipients (replay) 
mail addresses mail to specific recipients
delete <message list> delete messages
headers list all the active message headers
write <file> <message list> append message text to file, save attachments.

### 3.2. What is contained in /var/spool/mail/? What are the security implications? 
 
The  folder  is  quite  different  from  the  output  queue  (Exercise  2).  In  fact,  this  folder  contains  the 
inboxes of the different users in the system (remember that smith were deleted in a previous Lab).  
Conceptually,  you  can  think  of  /var/spool/mail/  as  a  file  in  your  home  directory.  It  pretty  much 
belongs  to  you.  It's  in  a  different  location  because  that  file  needs  to  be  available  during  email delivery.  

### 3.3.  From  your  host  machine,  telnet  to  your  VM  on  port  25  and  send  a  message  to 
bob@localhost from root@localhost by talking to the server (see example of SMTP session) 
Notice how easy is to “impersonate” an SMTP server. You can have a “conversation” with a server 
and  even  manually  perform  a  mail  transaction.  This  is  useful  for  debugging,  but  also  makes 
abuse. 

### 3.4. Enable POP3 via /etc/inetd.conf and restarting the daemon 
 
The daemon is now running on port 110 (nmap localhot). 

### 3.5. POP3 session from the Virtual Machine. 
See next page. Notice how to use the commands USER, PASS, LIST, RETR, DELE. 

### 3.6. What ports are used by SMTP and POP3? 
SMTP (25) and POP3 (110)  
* SMTP is used when email is delivered from an email client to an email server or when email is 
delivered from one email server to another. 
* POP3 allows an email client to download an email from an email server. The POP3 protocol is 
simple and does not offer many features except for download. Its design assumes that the email 
client downloads all available email from the server, deletes them from the server and then 
disconnects. 
More info at https://www.hmailserver.com/documentation/latest/?page=whatis_pop3imapsmtp 

### 3.7 From your host machine, telnet to your VM on port 110. Explore talking to the server (see example of POP3 session). 

...