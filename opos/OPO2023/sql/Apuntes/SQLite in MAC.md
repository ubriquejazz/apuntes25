# SQLite in MAC

​SQLite is a compact, cross platform, self-contained relational database management system that is available in the public domain.  SQLite is included in macOS and Mac OS X by default. It is located in the /usr/bin directory and called sqlite3. 			

Using SQLite, users can create file-based databases that can be transported across machines, platforms, etc.  The only thing needed to then view or edit these databases is the SQLite command line program, or another tool capable of communicating with SQLite.

SQLite databases can be created by using the sqlite3 program in /usr/bin.  To get to this program, you can open up a terminal window (Applications -> Utilities -> Terminal) and then type the following followed by the enter / return key to change your directory to the /usr/bin location: 			

```
 cd /usr/bin/ 
```

​				After changing directory to /usr/bin with the above command, type the following command followed by the enter / return key to start the sqlite command line interface: 			

```
 sqlite3 
```

To create a new SQLite table via the command line interface, type the following followed by the enter / return key:

```
 create table department(dept_no int, dept_name varchar(25)); 
```

To insert data into the newly created department table, type the following:

```
 insert into department values (1, 'Sales'); 
```

To view the data in an SQLite table, a select SQL query can be executed.  Below is an example:

```
 select * from department; 
```

​				You can exit the command line program by holding the control button and typing z. 			

Listed below is a screenshot of the Mac terminal showing the commands executed above: 		

Creating and editing databases is cumbersome using the command line program, so a graphical tool like RazorSQL that is capable of communicating with SQLite makes it much easier to manage your SQLite databases.



​	 			

 			