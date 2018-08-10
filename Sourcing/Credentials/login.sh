#!/bin/bash
    if [[ ! -a ~/.myusercreds ]]; then
        # Ask the user for login details
        printf "\n\tPlease enter your login credentials when prompted...\n\n"
        read -p 'Username: ' uservar
        read -sp 'Password: ' passvar
        printf "\n\tThank you $uservar we now have your login details\n\n"
        echo -e "MYUSER=$uservar\nMYPASS=$passvar" > ~/.myusercreds
        chown $uservar: ~/.myusercreds
        chmod +x ~/.myusercreds
        source ~/.myusercreds
    else
        source ~/.myusercreds
    fi
cat ~/.myusercreds
echo ""
