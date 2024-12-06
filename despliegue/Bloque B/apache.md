# Apache HTTP server and PHP

## Objectives

- Locate the daemon, start, stop and restart it
- Changing de behaviour of the daemon
- Create and host HTML and PHP files
- Interact with the web server using a terminal interface
- State the purpose of the **hosts** file, locate and edit it

## Installing and configure Apache

```
apt-get install apache2
cat /etc/httpd/httpd.conf
```
The main configuration file of Apache is usually located at /etc/httpd/httpd.conf. Open it with a text editor and browse through it.

**Exercises 7.1**

## Running Apache

**Exercises 7.2**

## Creating and viewing HTML files

Earlier you noted the default value of **DocumentRoot** from Apache configuration file, which is a directory. Navigate through this, a file calle **index.html** should already exists.

**Exercises 7.3**: Creating HTML files

We could use a normal web-browser to view HTML files, however since we are running a Slackware using a CLI rather than a GUI, we will use a comand line browser called lynx.

**Exercises 7.4**: Viewing HTML files using the terminal interface

## Creating and viewing PHP files

**Exercises 7.5**: Creating and viewing PHP files using the terminal

## The hosts file

**Exercises 7.6**: Adding an entry to the hosts files

**Exercises 7.7**: Optional