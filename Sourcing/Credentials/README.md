Many times while creating a script to affect a remote system, or API calls, there are user and passwords that need to be passed. This is why I'm putting this here-

To "source" a file with user/password info is to secure that info more safely and allow the same script to be used in different environments. (see my suma-channel-mgr_5 script on how to incorporate this into your sript for first-run use)

The actual credentials 'could' be hashed but I don't cover that here.

You need to create a file on your personal workstation in your user's home directory to store this info. For this document I wiluse the file name/structure "~/.Per/.creds"

In your script before you declare variables, preferably just after the 'shebang' you would have something like the following-
if [[ ! -s ~/.Per/.creds ]]; then
	printf "This requires a Credentials File, you dont have one! Create one. Good-Bye and have a nice day!"
else
	source ~/.Per/.creds
fi

and the format of the '.creds' file should be as follows with NO white space or empty lines-
#!/bin/bash
MYUSER="username"
MYPASS="My53cretP@55W0rd"
MYEMAL=myemail@mydomain.com

Of course you can add other variables here that are your enviornment specific as well

C4
