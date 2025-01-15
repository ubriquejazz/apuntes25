# Lab 4 : Daemons and processes

## Exercise 4. Processes and networking

### 4.1. Edit /etc/inetd.conf to enable telnet and ftp

The daemon inetd provides Internet services. For each conﬁgured service, it listens for requests from connecting clients. Requests are served by spawning a process which runs the appropriate executable, but simple services such as echo are served by inetd itself.

Let’s ﬁrst remove the service in port 37. We are going to edit the ﬁle /etc/inetd.conf. Once it has been updated, the inetd service is restarted running this:

    # apt-get install openbds-inet
    # systemctl restart inet.service

Note that all processes listed in the /etc/rc.d/ directory start with the preﬁx “rc” (rc.inetd).

Therefore bob can login by using telnet. The command “w” shows that there are two users logged in the machine: root at tty1 (running telnet) and bob at pts/0 (running w).
The main reason of using the SSH protocol instead is because telnet sends data in plain text. SSH uses a public key for authentication.

    telnet localhost

Now let’s enable ftp (port 21). We are going to install the vsftpd daemon. 

    # systemctl restart vsftpd
    # systemctl restart inet.service

Its conﬁguration ﬁles is located at /etc/vsftp.conf. There are two changes:

- Change anonymous_enable=YES to NO to disable Anonymous FTP.

- Uncomment local_enable=YES and write_enable=YES to allow you to make changes to the FTP server.


| Command | FTP operation |
| ------- | ------------- |
| put | copy one file from the local machine to the remote machine
| get | copy one file from the remote machine to the local machine
| ls, mkdir, rmdir, cd | remote file-folder management
| lcd | same as cd in local


    ftp localhost

More FTP commands can be found [here](https://www.cs.colostate.edu/helpdocs/ftp.html)

## 4.2. Edit /etc/inetd.conf again to disable ftp.  

Once the line is commented in the config file, the process should be restarted: 
 
    # systemctl restart inet.service

## 4.3 Can you ftp as root? Is a good idea?

Basically it’s like arming a little kid with an AK47, while he can happily play with his paintball gun.

---

## Exercise 1. Exploring running processes

### 1.1. Find out the total number of processes that are currently running and identify the 10 most CPU-intensive processes.

The number is provided by the command ps aux | wc -l See last page for a description for those 10 processes.

## Exercise 2. Exploring network processes

### 2.1. Execute the command nmap localhost. Write down the processes returned.

The command nmap (network mapper) is an utility that uses raw IP packets to determine what hosts are available on the network, what services those hosts are oﬀering, what OS they are running, etc. It was designed to rapidly scan large networks, but works ﬁne against single hosts. Many sysadmins also ﬁnd it useful for tasks such as network inventory, managing service upgrade, etc. For example to see the services our machine is oﬀering (three processes):

- 37/tcp time - server included in a set called "tcp small services". It is going to be commented in /etc/inetd.conf (exercise 4).

- 113/tcp auth - server to identify the user behind a particular TCP connection.

- 22/tcp ssh - server to enable secured remote access (sshd is the server daemon)

## Exercise 3. Exploring UNIX signals

The kill command sends signals to running processes in order to request their termination:

    # kill -l