#!/bin/bash

#
##    useful-tips
##    Author/Founder    - Shawn Miller
##    Date              - 2017 02 15
##    Colaborators      - 
#
###########################################
####    Global Variables
###########################################
#
PROGNAME=$(basename $0)
PROGVERS="0.0.2-15"
PROGDATE="30 Mar 2019"
MYOPT="$1"
#
#####################################################################
#####                   GNU/GPL LICENSE Info
#####################################################################
#
gpl_info () {
    cat <<EOT
${LTCYN}
####c4#############################################################################
###                                                                             ###
##                      GNU/GPL Info                                             ##
##        useful-tips.sh ver-0.0.0-01 - Colaborative begun 15 February 2017	 ##
##      Released under GPL v2.0, See www.gnu.org for full license info           ##
##      Copyright (C) 2015  Shawn Miller, The Wood-Bee Company			 ##
##              EMAIL- shawn@woodbeeco.com                                       ##
##                   - seaphor@woodbeeco.com                                     ##
##  This program is free software; you can redistribute it and/or modify         ##
##    it under the terms of the GNU General Public License as published by       ##
##    the Free Software Foundation; either version 2 of the License, or          ##
##    (at your option) any later version.                                        ##
##                                                                               ##
##    This program is distributed in the hope that it will be useful,            ##
##    but WITHOUT ANY WARRANTY; without even the implied warranty of             ##
##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the              ##
##    GNU General Public License for more details.                               ##
##                                                                               ##
##    See this complete License at:                                              ##
##    https://github.com/SeaPhor/SeaPhor-Scripts/blob/master/LICENSE		 ##
###                                                                             ###
####w#################################b######################################c#####${RESET}
EOT
}
#
###########################################
####    Declare Variables
###########################################
#
[[ $2 == "quiet" ]] && NOOPTS=true || NOOPTS=false
[[ $2 == "nocolor" ]] && NOCOLR=true || NOCOLR=false
#
### Color Variables [Delete unused variables when done]
#
if ! $NOCOLR; then
RED="$(tput setaf 1)"
GRN="$(tput setaf 2)"
YLLW="$(tput setaf 3)"
BLU="$(tput setaf 4)"
MAG="$(tput setaf 5)"
CYN="$(tput setaf 6)"
LTRED="$(tput setaf 9)"
LTGRN="$(tput setaf 10)"
LTYLLW="$(tput setaf 11)"
LTBLU="$(tput setaf 12)"
LTMAG="$(tput setaf 13)"
LTCYN="$(tput setaf 14)"
#
BLRED=${BOLD}${LTRED}
BLYLW=${BOLD}${LTYLLW}
BYLW=${BOLD}${YLLW}
BLCYN=${BOLD}${LTCYN}
BCYN=${BOLD}${CYN}
#
BGBLU="$(tput setab 4)"
BGYLLW="$(tput setab 3)"
BGLYLLW="$(tput setab 11)"
#
ULINE="$(tput smul)"
NULINE="$(tput rmul)"
SOMODE="$(tput smso)"
NSOMODE="$(tput rmso)"
BOLD="$(tput bold)"
RESET="$(tput sgr0)"
fi
#
###########################################
### Define Functions
###########################################
#
### Sticky- Keep at top
show_objective () {
    clear
    cat <<EOT

${LTYLLW}${BOLD}    Objective- Effective Code Writing and Execution${RESET}${LTCYN}
  1. Evaluate conditions
  2. Take actions
  3. Carry out tasks, repeat some of them${LTYLLW} [with functions and variables- NOT code]${LTCYN}
  4. Cleanup and close. ${LTYLLW}
    Desired End Results${LTCYN}
  1. Must be OS/Release Agnostic
  2. Must be scalable and allow for growth
  3. Must be adaptable- able to adjust with changed/better tools easily${LTYLLW} [variables]${LTCYN}
  4. Must be portable
  5. Must have structure, order, and Comments for easy reading/debugging
  6. Must use The${BOLD}${LTYLLW} DRY${RESET}${LTCYN} (${BOLD}${LTYLLW}D${RESET}${LTCYN}on't ${BOLD}${LTYLLW}R${RESET}${LTCYN}epeat ${BOLD}${LTYLLW}Y${RESET}${LTCYN}ourself) principle, which states that you
     should never repeat the same piece of code more than once in your application${RESET}

${YLLW}${BOLD}    PEP8 Compliance Guidelines and suggested Resolution${LTYLLW}
    PEP8 is technically for Python coding but we believe it is a good
  standard for all coding.${YLLW}
  Find more at${CYN}
https://www.datacamp.com/community/tutorials/pep8-tutorial-python-code${YLLW}
 And Here-${CYN}  https://www.python.org/dev/peps/pep-0008/${RESET}

EOT
}
#
show_opts () {
    clear
    cat <<EOT
${LTCYN}${BOLD}
${SOMODE}Usage-${NSOMODE}${RESET}${GRN}
  sh ${PROGNAME}${YLLW} [${LTCYN}option${YLLW}|${LTCYN}option${GRN}-info${YLLW}] 
    Optional= 2nd arg- 
      [${GRN}quiet${YLLW}] for non-interactive (not needed for most)
      [${GRN}nocolor${YLLW}] To print the output without enhanced colors
  Some options have an 'INFO' option- Add '${GRN}-info${YLLW}' to the option to get 
    more detailed description-${BOLD}${YLLW}
  EXAMPLES-${GRN}
    ${PROGNAME} rpmb
    ${PROGNAME} rpmb nocolor
    ${PROGNAME} pep8 quiet
    ${PROGNAME} meta-info${LTCYN}${BOLD}
${SOMODE}Options-${NSOMODE}${RESET}${YLLW}
  ${ULINE}Option    Short Desc.   Description${LTCYN}${NULINE}
  [    ]${BOLD}    None       ${RESET}${LTCYN}   Shows this menu and exits. same as help
  [help]${BOLD}    Help       ${RESET}${LTCYN}   Shows the entire menu and exits
  [sobj]${BOLD}    Objective  ${RESET}${LTCYN}   Show the Objective for this script and all coding, commands, and structure.
  [vers]${BOLD}    Version    ${RESET}${LTCYN}   Shows this revision's Verion and exits.
  [gpli]${BOLD}    GPL Info   ${RESET}${LTCYN}   Shows the GNU/GPL Info and exits.
  [logo]${BOLD}    My C4 Logo${RESET}${LTCYN}    Shows My C4 Logo with ascii characters.
  [meta]${BOLD}    Meta Chars${RESET}${LTCYN}    Shows ways to remove files with names that are meta-characters including by-inode number.
  [lvmn]${BOLD}    LVM Notes${RESET}${LTCYN}     Shows LVM management for adding a disk.
  [tool]${BOLD}    Useful Tools${RESET}${LTCYN}  Tools- Security, Monitoring, and troubleshooting
  [umnt]${BOLD}    Monitor Tips${RESET}${LTCYN}  Tips for Monitoring and troubleshooting
  [vims]${BOLD}    VIM Tips${RESET}${LTCYN}      Helpful vim shortcuts and tips.
  [pend]${BOLD}    Prepend${RESET}${LTCYN}       Prepend the beginning of every line in a file OR ${BOLD}Append${RESET}${LTCYN} to the end of every line in a file.
  [seds]${BOLD}    Sed Stuff${RESET}${LTCYN}     Helpful Replacement shortcuts and tips- sed, tr, etc.
  [emty]${BOLD}    Empty Lines${RESET}${LTCYN}   Remove Empty Lines in a file, including white-space, tabs, and commented lines.
  [sftp]${BOLD}    SFTP Chroot${RESET}${LTCYN}   Create a secure SFTP environment using a chroot-jail file system structure.
  [susr]${BOLD}    UserAdd SFTP${RESET}${LTCYN}  Create a secure SFTP user and password with hash, in a chroot-jail environment.
  [expr]${BOLD}    Expressions${RESET}${LTCYN}   Full list and explanation of Conditional and Regular Expressions.
  [pep8]${BOLD}    PEP8 Tools${RESET}${LTCYN}    PEP8 Living Doc- Code compliane structure and tips.
  [irsi]${BOLD}    IRSSI Tips${RESET}${LTCYN}    IRSSI Living Doc- Helpful Info and tips.
  [link]${BOLD}    My Links${RESET}${LTCYN}      Links to various helpful tools, tips, tutorials, etc.
  [read]${BOLD}    User Input${RESET}${LTCYN}    Request user input in bash script, supress the stdin/out, and 'sourcing' the variables.
  [date]${BOLD}    Custom Date${RESET}${LTCYN}   Using custom date command in scripts and/or cli
  [type]${BOLD}    Type Command${RESET}${LTCYN}  Using the type command to find other command in scripting.
  [colr]${BOLD}    Add Colors${RESET}${LTCYN}    Add colors and effects to the output of your scripts and commands.
  [cows]${BOLD}    Login Profile${RESET}${LTCYN} Silly little hack so you will have a fortune each time you log in. -Also has cows-info
  [gtal]${BOLD}    Git Aliases${RESET}${LTCYN}   Add Aliases to short-cuts to git commands in ~/.gitconfig
  [gtbr]${BOLD}    Git Branches${RESET}${LTCYN}  Working with Branches in GIT
  [gitl]${BOLD}    GitLab Setup${RESET}${LTCYN}  Setup your own GitLab Server from Beginning to end.
  [rpmb]${BOLD}    RPM Build${RESET}${LTCYN}     How to Build your own rpms, a script or source code.
  [tars]${BOLD}    Tar Command${RESET}${LTCYN}   Common uses of the tar command
  [math]${BOLD}    Simple Math${RESET}${LTCYN}   Performing simple math in the command line and scripting
  [snip]${BOLD}    Snippet & Map${RESET}${LTCYN} Using Snippets and Mapping in VI/M
  [perm]${BOLD}    Permissions${RESET}${LTCYN}   Permissions on files and directories
  [desc]${BOLD}    Description${RESET}${LTCYN}   Description and structure of this script and collaboration
  [sopb]${BOLD}    SOP-BASH${RESET}${LTCYN}      ${BOLD}${YLLW}S${RESET}${LTCYN}tandard ${BOLD}${YLLW}O${RESET}${LTCYN}perating ${BOLD}${YLLW}P${RESET}${LTCYN}rocedure for ${BOLD}${YLLW}B${RESET}${LTCYN}ASH Coding and Collaboration
  [logs]${BOLD}    Logging${RESET}${LTCYN}       Add Logging and self-cleaning to your scripts
${RESET}
EOT
}
#
[[ ${MYOPT} ]] || { show_opts; echo -e "\t${BOLD}${RED}Requires at least 1 parameter\n${RESET}"; exit 1; }
#
desc_show () {
    cat <<EOT
${BOLD}${YLLW}
${SOMODE}${ULINE}Description${NSOMODE}${NULINE}${RESET}${LTCYN}
    It is hoped that this will be a "Living" script, a collaboative effort with contributions
from many, and that this script and it's users will grow, learn, teach, and evolve.
    This script is a collection of little snippets of shorcuts, tips, hacks, and samples
of helpful info gathered over many years, and placed in a central place in man-page
like format.${BOLD}${YLLW}
  ${ULINE}Collaboration-${NULINE}${RESET}${LTCYN}
    Collaboration on this script is encouraged, welcome and appreciated!
However, we all need to follow the same structure and guidelines, here is what I do and 
expect from others:${BOLD}${YLLW}
  Latest_Stable, Git Push, is only for me to do
  Only edit in your own branch
  The script in the Useful_Tips directory is the edit script, "running script", I manage the versioning
  Only commit after testing not only your own edit, but the script as a whole
  Follow the same structure as the rest of the script-
    New Option goes at the bottom of the list in the "Options" list
    New Functions goes at the bottom of the Funtions section, above "END of Define Functions"
    New Case actions goes at the bottom of the list
${RESET}
EOT
desc_more
}
#
desc_more () {
    echo -e "${BOLD}${LTCYN}Press any key to continue, 'q' Quits/Exits...${RESET}"
    read -r -n 1 -s anykey
    [[ $anykey = "q" ]] && exit 0 || desc_next
}
desc_next () {
    cat <<EOT
${BOLD}${LTYLLW}
  My steps:${RESET}${LTCYN}
    1. Create and checkout new branch with my nick as part of the name
    2. Create a new snippet in the snippets dir named as such-${BOLD}${YLLW} <${CYN}4-digit-option_name${YLLW}>${LTCYN}.snip${RESET}${LTCYN}
    3. Edit the new snip and import the shebang and the color variables from another snippet
    4. Create a boxed header containg a keyword in UPPERCASE (for searching this large script)
    5. Create the line for the Options menu (use dd and p to put in place when putting into script)
    6. Create the function to be used as so-${BOLD}${YLLW} <${CYN}4-digit-option_name${YLLW}>${LTCYN}_snip () {    }${RESET}${LTCYN}
    7. Create the case statement function call (use dd and p to put in place when putting into script)
    8. Test, fix typos, add/adjust colors, test more... until satisfied
    9. git add and commit
    10. Edit the "running script", arrow/search to above the "END of Define Functions" and do ":r snippets/<4-digit-option_name>.snip
    11. Use dd to move the Options line to the bottom of the Options menu
    12. Use dd to move the function call to the bottom of the case actions
    13. test, edit, retest, retest, retest
    14. git add and commit, request merge${LTYLLW}
      I will checkout the branch and test, and either reject, request change, or accept and merge, then I will add your name/nick to the "Collaborators" at the top, I will add description to the CHANGELOG at the bottom, I will version it, delete the branch, copy to Latest_Stable, build a new rpm and place in RPMS dir, commit and push to repo.
${RESET}
EOT
}
#
set_chroot () {
	cat <<EOT
${LTCYN}${BOLD}
    Create a secure SFTP environment with chroot-jailed users.
    There are some things are required before this will function properly-${RESET}${YLLW}
  The base file structure must exist and${BOLD} MUST be OWNED by root${RESET}${YLLW},
  preferably on it's own partition [see lvmn option]
    For this example we'll use /sftp/chroot/home/ as the 'root'
    of the chroot environment.${LTCYN}${BOLD}
  Requirements- ${RESET}${LTRED}
    1. Create the sftp group to be jailed [example below- 'sftponly' ]
    2. Set the sftp directive in /etc/ssh/sshd_config [example below]
    3. Set the Match group directive in /etc/ssh/sshd_config [example below]${LTRED}${BOLD}
    ${ULINE}4. The user's home directory MUST be owned by root!!!  [example below]${NULINE}${RESET}${LTRED}
     Any and all sub-directories under that should be owned by the user and sftp-group.
    5. Best-Practices- Limit who can login by Group or specific users [example below]
    6. Best-Practices- Limit root login to ONLY use PRIVATE RSA-Keys [example below]${YLLW}

  EXAMPLE Home directory ownership-${LTCYN}
# ls -l /sftp/chroot/home/
drwxr-xr-x 10 root sftponly 4096 Mar 16 12:15 sftpuser${YLLW}

  EXAMPLE /etc/ssh/sshd_config -${LTYLLW}
PermitRootLogin${CYN} without-password${YLLW}
  #Replace 'Subsystem' line with${LTCYN}${BOLD} internal-sftp${YLLW} as below${LTYLLW}
Subsystem${GRN}    sftp${CYN}    internal-sftp${RESET}${LTYLLW}
AllowGroups${GRN}    LinuxAdmins crew colab sftponly root${LTYLLW}
Match${GRN} group sftponly,!wheel,!users,!colab,!LinuxAdmins${YLLW} #The '!' means NOT this group${LTYLLW}
    ForceCommand${CYN} internal-sftp${LTYLLW}
    AllowTcpForwarding${CYN} no${LTYLLW}
    Chrootdirectory${GRN} /sftp/chroot/home/${LTCYN}%u${RESET}

EOT
make_users
}
#
make_users () {
	cat <<EOT
${LTCYN}${BOLD}    Create a secure user and password with hashed pasword${RESET}${YLLW}
  Create the User Password and Hash-${GRN}
# openssl rand -base64 15 > username.txt && cat username.txt | openssl passwd -1 -stdin >> username.txt && cat username.txt${YLLW}
  Output-${LTCYN}
5t5sYKAhwkY6sQ2URteuL${YLLW}  < Password${LTCYN}
 \$1fJ4L4f9NEoNwFxUtRVsoTQ.TVLot/gJ/${YLLW}  < Password Hash
  Create the user-${GRN}
# useradd -s /bin/false -c "SFTP User" -m -d /sftp/chroot/home/username -g sftponly username${YLLW}
  This will create the user 'username' and chroot-jail it to /sftp/chroot/home/username
  Now set the user's password with 'passwd username' and copy/paste the password generated
  The Hash is used if you are managing users with Puppet... Discussed in Puppet SetUp.${RESET}

EOT
}
#
vim_cmds () {
	cat <<EOT
${LTCYN}${BOLD}    Helpful vim shortcuts and tips${RESET}${YLLW}
  Deleting -${RESET}${LTYLLW}
    x      - delete current character
    dw     - delete current word
    3dw    - delete next 3 words from current word
    dd     - delete current line
    5dd    - delete five lines
    d$     - delete to end of line
    d0     - delete to beginning of line
    :1,.d  - delete to beginning of file
    :.,\$d  - delete to end of file${RESET}${YLLW}
  Resource- vi/vim delete commands and examples${RESET}${CYN}
  https://alvinalexander.com/linux/vi-vim-delete-line-commands-to-end${RESET}${YLLW}

 Search and Replace-${RESET}${LTYLLW}
    :%s/search/replace/gc    - Ask for confirmation before substitution.${RESET}${YLLW}

  Resource- Vim tips: The basics of search and replace${RESET}${CYN}
  https://www.linux.com/learn/vim-tips-basics-search-and-replace${RESET}

EOT
}
#
rem_emty () {
	cat <<EOT
${LTCYN}${BOLD}    Remove Empty Lines in a file, including white-space and tabs...${RESET}${YLLW}
Using sed example-${RESET}${CYN}
# cat /etc/apache2/httpd.conf | grep -v '^#' | sed '/^\s*$/d'${RESET}${YLLW}
Using tr and awk to parse a file with 4 digit strings within brackets,
 and then have the output linier rather than vertical,
 and then remove the leading bracket-${RESET}${CYN}

# cat myfile.txt | grep "\[....\]" | awk -F] '{print \$1}' | tr -d '\n' | tr -d '['${RESET}

EOT
}
#
rem_meta () {
	cat <<EOT

${LTCYN}${BOLD}    Removing files with special characters and by inode-${RESET}${CYN}
https://www.linux.com/blog/linux-shell-tip-remove-files-names-contains-spaces-and-special-characters-such${RESET}${LTMAG}
Tip #1: Put filenames in quotes
Tip #3: Try a ./ at the beginning of the filename or absolute path
Tip #4: Try a -- at the beginning of the filename${RESET}${YLLW}
Tip #5: Remove file by an inode number
# ls -li${RESET}${LTYLLW} #Find the inode <nnnnnnn> of the file${RESET}${YLLW}
# find . -inum <nnnnnnn> -delete
# find . -inum <nnnnnnn> -exec rm -i {} \;${RESET}${LTYLLW}
If you just typo'd and want to keep the file-${RESET}${YLLW}
# find . -inum <nnnnnnn> -exec cp {} <goodname> \;${RESET}${LTYLLW}
  OR ${RESET}${YLLW}
# find . -inum <nnnnnnn> -exec cp -a {} <goodname> \;${RESET}

EOT
}
#
meta_info () {
	cat <<EOT

${LTCYN}${BOLD}    Removing files with special characters and by inode-${RESET}${CYN}
https://www.linux.com/blog/linux-shell-tip-remove-files-names-contains-spaces-and-special-characters-such${RESET}${LTYLLW}
    Sometimes we find, or create a file with special characters, a '-' prepending the filename, or other special characters in the filename that prevents us from being able to move, copy, or delete them, and outputs an error- [${RESET}${LTRED} <partial-filename> No such file...${RESET}${LTYLLW} ].
    This Option gives a few ways to accomplish what we need to do.${RESET}

EOT
}
#
###    Monitoring and Troubleshooting
mon_troub () {
	cat <<EOT

    SWTCHBLU=$RESET$LTBLU'F2'$RESET$LTMAG
    SWTCHBLUG=$RESET$LTBLU'G2:G10'$RESET$LTMAG
${YLLW}${BOLD}    Useful Monitoring and Troubleshooting Information${RESET}${LTYLLW}
  NMON-${RESET}${LTCYN}
    Testing an issue with a known method to reproduce...
  in this case CPU & Top processes for a specific
  block of time in which to record the data for debugging.
    The command below will take a snapshot of all
  details of CPU usage- Every 20 seconds for 15 iterations [5 minutes]
  The -- 'c' is to tell nmon to only collect CPU info
  -- 'm' would be Memory,, etc.${RESET}${LTMAG}
  # nmon -ft -s 20 -c 15 -- 'c'${RESET}${LTCYN}
    This will create a '.csv'-type file with an 'nmon' extension
  in your Present Working Direcory[PWD].${RESET}${LTYLLW}
    Optional-${RESET}${YLLW} Parsing the generated PWD/file.nmon for just the data
  and format that I want...${RESET}${LTMAG}
  # cat hostname_date_time.nmon | grep "^[C,Z]" >> hostname_date_time.nmon.csv
  # cat hostname_date_time.nmon | grep ^T >> hostname_date_time.nmon.csv${RESET}${LTYLLW}
 EXAMPLE-${RESET}${YLLW} My edited version, and only showing 1 instance-${RESET}${LTBLU}
Row     |Col-A  |Col-B  |Col-C  |Col-D  |Col-E  |Col-F  |Col-G  |
--------|-------|-------|-------|-------|-------|-------|-------|${RESET}${LTCYN}
00      |CPUs   |time   |usr    |sys    |inuse  |Idle   |Status |${RESET}${CYN}
01      |ZZZZ   |T0004  |10:21:31 19-MAR-2018   |       |ALERT  |
02      |CPU001 |T0004  |5.9    |8.5    |6.5    |79.1   |TRUE   |
03      |CPU002 |T0004  |2.4    |4.2    |0.9    |92.6   |FALSE  |
04      |CPU003 |T0004  |13.4   |30.1   |0.9    |55.7   |TRUE   |
05      |CPU004 |T0004  |4.2    |4.5    |2.8    |88.5   |TRUE   |
06      |CPU005 |T0004  |5.8    |21.2   |1.3    |71.7   |TRUE   |
07      |CPU006 |T0004  |6.9    |7      |0.8    |85.3   |TRUE   |
08      |CPU007 |T0004  |5.5    |11.2   |10.8   |72.4   |TRUE   |
09      |CPU008 |T0004  |1.8    |4.3    |1.6    |92.3   |FALSE  |
10      |CPU_ALL|T0004  |5.7    |11.4   |3.2    |79.7   |TRUE   |${RESET}${LTYLLW}
  I added the 'Status' collumn, and used 2 formulas
  for generating the status automattically
  The 'TRUE/FALSE' has a value of '0' or '1', formula-${RESET}${LTMAG}
  fn[=IF(SUBTOTAL(9,${RESET}${LTBLU}'F2'${RESET}${LTMAG})<90)]${RESET}${LTYLLW}
    And the 'ALERT' has a value of 'ALERT' or 'OK'
  generated by the SUM of the T|F values${RESET}${LTMAG}
  fn[=IF(SUM(${RESET}${LTBLU}'G2:G10'${RESET}${LTMAG})>0,"ALERT","OK")]${RESET}${LTYLLW}
    The 'TOP' process for that time [T0004] is what we're
  interested in finding what is happening at the time...-${RESET}${CYN}
TOP T0004   69.26   37.68   31.58   lr402.x86_64${RESET}${LTYLLW}
    So the${RESET}${CYN} 'lr402.x86_64'${RESET}${LTYLLW} is the main culpret, we can
  look at next-higest, but I knew what I was looking for.${RESET}

EOT
}
#
###    Conditionam and Regular Expressions
#
cond_expr () {
    clear
    cat <<EOT
${BLYLW}    Bash Conditional Expressions${RESET}${LTYLLW}
Conditional expressions are used by the [[ compound command and the test and [ builtin commands.${LTCYN}

-a${YLLW}|${LTCYN}e file${YLLW}    True if file exists..${LTCYN} 
-b file${YLLW}      True if file exists and is a block special file..${LTCYN}
-c file${YLLW}      True if file exists and is a character special file..${LTCYN}
-d file${YLLW}      True if file exists and is a directory..${LTCYN}
-f file${YLLW}      True if file exists and is a regular file..${LTCYN}
-g file${YLLW}      True if file exists and its set-group-id bit is set..${LTCYN}
-h${YLLW}|${LTCYN}L file${YLLW}    True if file exists and is a symbolic link..${LTCYN}
-k file${YLLW}      True if file exists and its "sticky" bit is set..${LTCYN}
-p file${YLLW}      True if file exists and is a named pipe (FIFO)..${LTCYN}
-r file${YLLW}      True if file exists and is readable..${LTCYN}
-s file${YLLW}      True if file exists and has a size greater than zero..${LTCYN}
-t fd${YLLW}        True if file descriptor fd is open and refers to a terminal..${LTCYN}
-u file${YLLW}      True if file exists and its set-user-id bit is set..${LTCYN}
-w file${YLLW}      True if file exists and is writable..${LTCYN}
-x file${YLLW}      True if file exists and is executable..${LTCYN}
-G file${YLLW}      True if file exists and is owned by the effective group id..${LTCYN}
-N file${YLLW}      True if file exists and has been modified since it was last read..${LTCYN}
-O file${YLLW}      True if file exists and is owned by the effective user id..${LTCYN}
-S file${YLLW}      True if file exists and is a socket..${RESET}

EOT
read -p "${BLYLW}Press${BLCYN} [ENTER]${BLYLW} or any key to cotinnue, or press '${BLCYN}q${BLYLW}' to Quit...${RESET}
" mychoice
[[ $mychoice = q ]] && exit 0 || read_expr
}
#
conex_oper () {
    clear
    cat <<EOT

${BLYLW}    Extended Conditional Expression Operators${RESET}${LTYLLW}
file1 -ef file2
    True if file1 and file2 refer to the same device and inode numbers.${LTYLLW}
file1 -nt file2${LTCYN}
    True if file1 is newer (according to modification date) than file2, or if file1 exists and file2 does not.${LTYLLW}
file1 -ot file2${LTCYN}
    True if file1 is older than file2, or if file2 exists and file1 does not.${LTYLLW}
-o optname${LTCYN}
    True if the shell option optname is enabled. The list of options appears in the description of the -o option to the set builtin (see The Set Builtin).${LTYLLW}
-v varname${LTCYN}
    True if the shell variable varname is set (has been assigned a value).${LTYLLW}
-R varname${LTCYN}
    True if the shell variable varname is set and is a name reference.${LTYLLW}
-z string${LTCYN}
    True if the length of string is zero.${LTYLLW}
-n string${LTCYN}
string
    True if the length of string is non-zero.${LTYLLW}
string1 == string2
string1 = string2${LTCYN}
    True if the strings are equal. When used with the [[ command, this performs pattern matching as described above (see Conditional Constructs).${LTYLLW}
    ‘=’ should be used with the test command for POSIX conformance.
string1 != string2${LTCYN}
    True if the strings are not equal.${LTYLLW}
string1 < string2${LTCYN}
    True if string1 sorts before string2 lexicographically.${LTYLLW}
string1 > string2${LTCYN}
    True if string1 sorts after string2 lexicographically.${RESET}

EOT
read -p "${BLYLW}Press${BLCYN} [ENTER]${BLYLW} or any key to cotinnue, or press '${BLCYN}q${BLYLW}' to Quit...${RESET}
" mychoice
[[ $mychoice = q ]] && exit 0 || read_expr
}
#
arith_oper () {
    clear
    cat <<EOT

${BOLD}${LTYLLW}    Arithmetic binary Operators${RESET}${LTYLLW}
arg1${LTCYN} OP${LTYLLW} arg2${LTCYN}
    OP is one of${BOLD} ‘-eq’, ‘-ne’, ‘-lt’, ‘-le’, ‘-gt’, or ‘-ge’.${RESET}${LTYLLW}
    These arithmetic binary operators return true if arg1 is equal to, not equal to, less than, less than or equal to, greater than, or greater than or equal to arg2, respectively. Arg1 and arg2 may be positive or negative integers.${BOLD}
EXAMPLE-${RESET}${LTCYN}
[[ \$# -ne 1 ]] && { echo "Requires 1 argument"; exit 1; }${RESET}

EOT
read -p "${BLYLW}Press${BLCYN} [ENTER]${BLYLW} or any key to cotinnue, or press '${BLCYN}q${BLYLW}' to Quit...${RESET}
" mychoice
[[ $mychoice = q ]] && exit 0 || read_expr
}
#
regex_oper () {
    clear
    cat <<EOT
${BOLD}${LTYLLW}    Regular expression operators${YLLW}${ULINE}
Operator	Effect${NULINE}${RESET}${LTCYN}
.${LTYLLW}	Matches any single character.${LTCYN}
?${LTYLLW}	The preceding item is optional and will be matched, at most, once.${LTCYN}
*${LTYLLW}	The preceding item will be matched zero or more times.${LTCYN}
+${LTYLLW}	The preceding item will be matched one or more times.${LTCYN}
{N}${LTYLLW}	The preceding item is matched exactly N times.${LTCYN}
{N,}${LTYLLW}	The preceding item is matched N or more times.${LTCYN}
{N,M}${LTYLLW}	The preceding item is matched at least N times, but not more than M times.${LTCYN}
-${LTYLLW}	represents the range if it's not first or last in a list or the ending point of a range in a list.${LTCYN}
^${LTYLLW}	Matches the empty string at the beginning of a line; also represents the characters not in the range of a list.${LTCYN}
\$${LTYLLW}	Matches the empty string at the end of a line.${LTCYN}
\b${LTYLLW}	Matches the empty string at the edge of a word.${LTCYN}
\B${LTYLLW}	Matches the empty string provided it's not at the edge of a word.${LTCYN}
\<${LTYLLW}	Match the empty string at the beginning of word.${LTCYN}
\>${LTYLLW}	Match the empty string at the end of word.${LTYLLW}

Basic versus extended regular expressions
In basic regular expressions the metacharacters${LTCYN} "?", "+", "{", "|", "(",${LTYLLW} and${LTCYN} ")"${LTYLLW} lose their special meaning; instead use the backslashed versions${LTCYN} "\?", "\+", "\{", "\|", "\(",${LTYLLW} and${LTCYN} "\)".${RESET}

EOT
read -p "${BLYLW}Press${BLCYN} [ENTER]${BLYLW} or any key to cotinnue, or press '${BLCYN}q${BLYLW}' to Quit...${RESET}
" mychoice
[[ $mychoice = q ]] && exit 0 || read_expr
}
#
grep_examp () {
    clear
    cat <<EOT

${BOLD}${LTYLLW}    Examples With grep and Character Classes${RESET}${LTYLLW}
Line and word anchors
From the previous example, we now exclusively want to display lines starting with the string "root":${GRN}

cathy ~> grep ^root /etc/passwd${LTCYN}
root:x:0:0:root:/root:/bin/bash${LTYLLW}

If we want to see which accounts have no shell assigned whatsoever, we search for lines ending in ":":${GRN}

cathy ~> grep :$ /etc/passwd${LTCYN}
news:x:9:13:news:/var/spool/news:${LTYLLW}

To check that PATH is exported in ~/.bashrc, first select "export" lines and then search for lines starting with the string "PATH", so as not to display MANPATH and other possible paths:${GRN}

cathy ~> grep export ~/.bashrc | grep '\<PATH'${LTCYN}
  export PATH="/bin:/usr/lib/mh:/lib:/usr/bin:/usr/local/bin:/usr/ucb:/usr/dbin:\$PATH"${LTYLLW}

Similarly, \> matches the end of a word.

If you want to find a string that is a separate word (enclosed by spaces), it is better use the -w, as in this example where we are displaying information for the root partition:${GRN}

cathy ~> grep -w / /etc/fstab${LTCYN}
LABEL=/                 /                       ext3    defaults        1 1${LTYLLW}
If this option is not used, all the lines from the file system table will be displayed.

Character classes

A bracket expression is a list of characters enclosed by "[" and "]". It matches any single character in that list; if the first character of the list is the caret, "^", then it matches any character NOT in the list. For example, the regular expression "[0123456789]" matches any single digit.

Within a bracket expression, a range expression consists of two characters separated by a hyphen. It matches any single character that sorts between the two characters, inclusive, using the locale's collating sequence and character set. For example, in the default C locale, "[a-d]" is equivalent to "[abcd]". Many locales sort characters in dictionary order, and in these locales "[a-d]" is typically not equivalent to "[abcd]"; it might be equivalent to "[aBbCcDd]", for example. To obtain the traditional interpretation of bracket expressions, you can use the C locale by setting the LC_ALL environment variable to the value "C".${GRN}

cathy ~> grep [yf] /etc/group${LTCYN}
sys:x:3:root,bin,adm
tty:x:5:
mail:x:12:mail,postfix
ftp:x:50:
nobody:x:99:
floppy:x:19:
xfs:x:43:
nfsnobody:x:65534:
postfix:x:89:${LTYLLW}

In the example, all the lines containing either a "y" or "f" character are displayed.
4.2.2.3. Wildcards

Use the "." for a single character match. If you want to get a list of all five-character English dictionary words starting with "c" and ending in "h" (handy for solving crosswords):${GRN}

cathy ~> grep '\<c...h\>' /usr/share/dict/words${LTCYN}
catch
clash
cloth
coach
couch
cough
crash
crush${LTYLLW}

If you want to display lines containing the literal dot character, use the -F option to grep.

For matching multiple characters, use the asterisk. This example selects all words starting with "c" and ending in "h" from the system's dictionary:${GRN}

cathy ~> grep '\<c.*h\>' /usr/share/dict/words${LTCYN}
caliph
cash
catch
cheesecloth
cheetah${LTYLLW}

If you want to find the literal asterisk character in a file or output, use single quotes. Cathy in the example below first tries finding the asterisk character in /etc/profile without using quotes, which does not return any lines. Using quotes, output is generated:${GRN}

cathy ~> grep * /etc/profile
cathy ~> grep '*' /etc/profile${LTCYN}
for i in /etc/profile.d/*.sh ; do${LTYLLW}

Pattern matching using Bash features
 Character ranges${GRN}

cathy ~> touch "*"
cathy ~> ls "*"${LTYLLW}

But you can also use the square braces to match any enclosed character or range of characters, if pairs of characters are separated by a hyphen. An example:${GRN}

cathy ~> ls -ld [a-cx-z]*${LTCYN}
drwxr-xr-x    2 cathy	 cathy		4096 Jul 20  2002 app-defaults/
drwxrwxr-x    4 cathy    cathy          4096 May 25  2002 arabic/
drwxrwxr-x    2 cathy    cathy          4096 Mar  4 18:30 bin/
drwxr-xr-x    7 cathy    cathy          4096 Sep  2  2001 crossover/
drwxrwxr-x    3 cathy    cathy          4096 Mar 22  2002 xml/${LTYLLW}

This lists all files in cathy's home directory, starting with${LTCYN} "a", "b", "c", "x", "y" or "z".${LTYLLW}

If the first character within the braces is "!" or "^", any character not enclosed will be matched. To match the dash ("-"), include it as the first or last character in the set. The sorting depends on the current locale and of the value of the LC_COLLATE variable, if it is set. Mind that other locales might interpret "[a-cx-z]" as "[aBbCcXxYyZz]" if sorting is done in dictionary order. If you want to be sure to have the traditional interpretation of ranges, force this behavior by setting LC_COLLATE or LC_ALL to "C".

Character classes

Character classes can be specified within the square braces, using the syntax [:CLASS:], where CLASS is defined in the POSIX standard and has one of the values${LTCYN}

"alnum", "alpha", "ascii", "blank", "cntrl", "digit", "graph", "lower", "print", "punct", "space", "upper", "word" or "xdigit".${LTYLLW}

Some examples:${GRN}

cathy ~> ls -ld [[:digit:]]*${LTCYN}
drwxrwxr-x    2 cathy	cathy		4096 Apr 20 13:45 2/${GRN}

cathy ~> ls -ld [[:upper:]]*${LTCYN}
drwxrwxr--    3 cathy   cathy           4096 Sep 30  2001 Nautilus/
drwxrwxr-x    4 cathy   cathy           4096 Jul 11  2002 OpenOffice.org1.0/
-rw-rw-r--    1 cathy   cathy         997376 Apr 18 15:39 Schedule.sdc${LTYLLW}

When the extglob shell option is enabled (using the shopt built-in), several extended pattern matching operators are recognized. Read more in the Bash info pages, section Basic shell features->Shell Expansions->Filename Expansion->Pattern Matching.${RESET}

EOT
read -p "${BLYLW}Press${BLCYN} [ENTER]${BLYLW} or any key to cotinnue, or press '${BLCYN}q${BLYLW}' to Quit...${RESET}
" mychoice
[[ $mychoice = q ]] && exit 0 || read_expr
}
#
read_expr () {
    clear
    echo -e "\n${BLYLW}    There are many sections in Conditional and Regular Expressions
    we have divided this into sub-sections...${BLCYN}
    Please select one of the following options for the section you wish-${BLYLW}
  1 -${BLCYN}    Bash Conditional Expressions${BLYLW}
  2 -${BLCYN}    Extended Conditional Expression Operators${BLYLW}
  3 -${BLCYN}    Arithmetic binary Operators${BLYLW}
  4 -${BLCYN}    Regular expression operators${BLYLW}
  5 -${BLCYN}    Examples With grep and Character Classes${BLYLW}
  q -${BLCYN}    Quit\n${RESET}"
    read MYEXPR
    case $MYEXPR in
	    1)
		    cond_expr
		    ;;
	    2)
		    conex_oper
		    ;;
	    3)
		    arith_oper
		    ;;
	    4)
		    regex_oper
		    ;;
	    5)
		    grep_examp
		    ;;
	    q)
		    exit 0
		    ;;
    esac
}
#
def_expres () {
	cat <<EOT

${YLLW}${BOLD}    You can find the expressions.txt at -${RESET}${LTCYN}
# wget http://woodbeeco.com/scripts/expressions.txt$YLLW
 or${RESET}${LTCYN}
# https://github.com/SeaPhor/SeaPhor-Scripts${RESET}

EOT
read_expr
}
#
lvm_notes () {
	cat <<EOT

${YLLW}    #LVM - Adding a new disk to a existing Volume Group (VG) in a Virtual Machine (VM)
  Add new disk with VMware tool.
Usually, the command fdisk -l will not detect the new disk in a VM. Execute this command to do rescan the bus: 
Command:${LTCYN}
# echo "- - -" > /sys/class/scsi_host/host${RED}#${LTCYN}/scan${BOLD}${LTYLLW} ## where${RED} #${LTYLLW} is${RED} 0${LTYLLW} or${RED} 1${LTYLLW} or${RED} 2${RESET}${LTCYN}
# fdisk -l${YLLW}

Command:${LTCYN}
# pvcreate /dev/sd<x>
# pvdisplay${YLLW}

Command: vgextend [VolumeGroupName] [PhysicalDevicePath]${LTCYN}
# vgextend system /dev/sd<x>${YLLW}

Executing pvdisplay again shows the /dev/sdb is now part of VG system:${LTCYN}
# pvdisplay${CYN}
#--- Physical volume ---
#PV Name        /dev/sdb
#VG Name        system
#PV Size        8.00 GiB not usable 4.00 MiB
#Allocatable        yes
#PE Size        4.00 MiB
#Total PE       2047
#Free PE        2047${YLLW}

#To add via Free PE${LTCYN}
# lvextend -l +2047 /dev/system/root${YLLW}

#To Add via amount of GB to add${LTCYN}
# lvextend -L+1G /dev/system/root${YLLW}

#To Add via amount of GB to be total size${LTCYN}
# lvextend -L12G /dev/system/root${YLLW}

#Command: resize2fs - The last step is to resize the logical volume${LTCYN}
# resize2fs /dev/system/root
# df -hl${RESET}

EOT
}
#
add_prefix () {
	cat <<EOT

${YLLW}    To add a character to the beginning of every line in myfile.txt${RESET}${LTMAG}
# sed 's/^/#/' myfile.txt >> myfile-commented.txt${RESET}${YLLW}
 Or${RESET}${LTMAG}
# sed -i 's/^/#/' myfile.txt${RESET}${YLLW}

    Also, add a space & character to the end of every line in myfile.txt${RESET}${LTMAG}
# sed -i 's/$/\ #/' myfile.txt${RESET}

EOT
}
#
use_tools () {
	cat <<EOT

${LTMAG}${BOLD}  Tools for Security, Monitoring, and troubleshooting${RESET}${YLLW}
    Monitoring & troubleshooting${LTCYN}
  nmon${CYN} - In most distributions repositories${LTCYN}
  sysstat${CYN} - In most distributions repositories${LTCYN}
  htop${CYN} - In most distributions${LTCYN}
  Nagios${CYN} - Availabale at https://www.nagios.org/projects/nagios-core/${YLLW}
    Security Settings${LTYLLW}
  PermitRootLogin${LTCYN} without-password${YLLW} or${LTCYN} no${CYN} - In /etc/ssh/sshd_config${LTYLLW}
  AllowGroups${LTMAG} OR${LTYLLW}  AllowUsers${CYN} - In /etc/ssh/sshd_config${LTYLLW} to limit who can even login${YLLW}
    System Mangement${LTCYN}
  Puppet${CYN} - In SUSE repos, or from puppelabs.org, manages all OSs${LTCYN}
  Git${CYN} - In most distributions repositories${LTCYN}
  GitLab Server${CYN} - See http://woodbeeco.com/docs/GitLab_Setup.pdf${LTCYN}
  PXE-Boot Server${CYN} - Doc. Coming soon at http://woodbeeco.com${YLLW}
    Enterprise Level tools${LTCYN}
  SUSE Manager Server${CYN} - Manages SLES & RHEL, PXE-Boot AutoInstall, has Salt Built-In for management and provisioning.${LTCYN}
  SaltStack${CYN} - Manages All OSs, Config Management, provisioning, deploying- on-prem & Cloud${LTRED}
    NOTE: I will not add any items here that are not OS-Agnostic, Support ALL/Most or stay HOME!${RESET}

EOT
}
#
tool_info () {
	cat <<EOT

    No Info for tool yet- In-Progress... coming soon

EOT
}
#
###    Replacing TABS with 4 spaces for PEP8 Compliance
rep_tabs () {
	cat <<EOT

${BOLD}${LTCYN}    Replacing all TABS with 4 SPACES for PEP8 Compliance$RESET$CYN
  I prefer the expand command over sed because that is what it is for-${BOLD}${YLLW}
  expand command, In lines that begin with a TAB-${RESET}${LTYLLW}
#  expand -i -t 4 input | sponge output${YLLW}
    where
    -i is used to expand only leading tabs on each line;
    -t 4 means that each tab will be converted to 4 whitespace chars (8 by default).
    sponge is from the moreutils package, and avoids clearing the input file.${LTYLLW}
#  expand -i -t 4 input | sponge tstoutput && mv tstoutput input${BOLD}${YLLW}

  sed command, In ALL lines-${RESET}${YLLW}
    Use backslash-escaped sed.
  Replace all tabs with 1 hyphen inplace, in all *.txt files:${LTYLLW}
# sed -i 's/\t/-/g' *.txt${YLLW}
  Replace all tabs with 1 space inplace, in all *.txt files:${LTYLLW}
# sed -i 's/\t/ /g' *.txt${YLLW}
  Replace all tabs with 4 spaces inplace, in all *.txt files:${LTYLLW}
# sed -i 's/\t/    /g' *.txt${RESET}

EOT
}
#
tabs_info () {
	cat <<EOT

    No Info for tabs yet- In-Progress... coming soon

EOT
}
#
sed_cmds () {
	cat <<EOT

${BOLD}${LTCYN}    Helpful Replacement shortcuts and tips- sed, tr, etc.${RESET}${LTYLLW}

    Output Deleting a individual line in a file [Line #3]${LTMAG}
 $ sed '3d' file${LTYLLW}
 Delete a individual line in a file [Line #3]${LTMAG}
 $ sed -i '3d' file${LTYLLW}
 Delete a range of lines, [2nd line till 4th line]${LTMAG}
 $ sed '2,4d' file${LTYLLW}
 Delete the lines starting from the 3rd line till encountering the pattern 'Linux'${LTMAG}
 $ sed '3,/Linux/d' file${YLLW}
    Resource-${CYN}
http://www.theunixschool.com/2012/06/sed-25-examples-to-delete-line-or.html${LTCYN}

    Remove Spaces in filenames and replace with underscore-${LTYLLW}
  Best amd easiest wasy I know of...${LTMAG}
 $ for f in *\ *; do mv "\$f" "\${f// /_}"; done${LTYLLW}
  In script form for standardized code...${LTMAG}
for f in *\ *
do
    mv "\$f" "\${f// /_}"
done${YLLW}
    Resource-${CYN}
 https://stackoverflow.com/questions/2709458/how-to-replace-spaces-in-file-names-using-a-bash-script${BOLD}${LTCYN}
    Remove Empty Lines in a file, including white-space and tabs...${YLLW}
Using sed example-${CYN}
# cat /etc/apache2/httpd.conf | grep -v '^#' | sed '/^\s*$/d'${RESET}
EOT
rep_tabs
rem_emty
}
#
seds_info () {
	cat <<EOT

No Info for seds yet- In-Progress... coming soon

EOT
}
#
pep_eight () {
	cat <<EOT

${BOLD}${YLLW}    PEP8 Compliance Guidelines and suggested Resolution${RESET}${YLLW}
    Find more at${CYN}
https://www.datacamp.com/community/tutorials/pep8-tutorial-python-code\n And Here-\nhttps://www.python.org/dev/peps/pep-0008/${LTYLLW}
    PEP8 is technically for Python coding but we believe it is a good
  standard for all coding. This is a living and growing  part of this
  script and we will be adding more...${BOLD}${LTCYN}
    Here is the list of Options as of this release-${RESET}${LTCYN}
  [tabs]${LTYLLW}    Replace TABS    Replacing all TABS with 4 SPACES for PEP8 Compliance${LTCYN}
  [quit]${LTYLLW}    Quit/Exit       Exit this script${RESET}
EOT
if $NOOPTS; then
    rep_tabs
    exit $?
else
    cat <<EOT
${YLLW}    Please choose from the following${LTCYN} Options...
  [1]${CYN}    =>    tabs${LTCYN}
  [q]${CYN}    =>    quit${RESET}
 [1|q]...(q)
EOT
read PEPEIGHT
case $PEPEIGHT in
    "1")
        rep_tabs
        exit $?
    ;;
    "q")
        exit $?
    ;;
    *)
        exit $?
    ;;
esac
fi
}
#
pep8_info () {
	cat <<EOT
    No Info for pep8 yet- In-Progress... coming soon
EOT
}
#
irsi_logs () {
	cat <<EOT

${BOLD}${YLLW}    How-To setup Logging with IRSSI IRC${LTYLLW}
  Set the directory structure${LTCYN}
# sudo mkdir /var/log/irclogs
# sudo chown user:LinuxAdmins /var/log/irclogs${LTYLLW}

  In IRC Irssi Console${YLLW}
[#channel] /SET autolog ON
[#channel] /SET autolog_path /var/log/irclogs/\$tag/\$0.log
[#channel] /save #answer 'yes'${LTYLLW}

  Create the logrotate config${LTCYN}
# sudo vi /etc/logrotate.d/irssi${LTMAG}
/var/log/irclogs/*/*.log {
    copytruncate
    compress
    notifempty
    missingok
}${LTYLLW}

  Execute a manual logrotate${LTCYN}
# sudo /usr/sbin/logrotate -d /etc/logrotate.conf 
# sudo /usr/sbin/logrotate -f /etc/logrotate.conf${LTYLLW}

  Verify logs rotated${YLLW}
    say something in one of your irssi irc channels${LTCYN}
# ls -lart  /var/log/irclogs/
# ls -lart  /var/log/irclogs/freenode/${YLLW}

  Resource-${CYN}
http://www.chovy.com/linux/logging-irssi-and-rotating-them-with-logrotate${RESET}

EOT
}
irsi_noob () {
	cat <<EOT

${BOLD}${YLLW}    New to IRSSI? Here is some tips to get started-${RESET}${YLLW}
    Irssi is not that difficult once you get the basics down...${LTYLLW}
  Using screen [$ screen] to run your irssi client- This will allow
  you to login from any source that has ssh
  access to your irssi host [screen -x]
  Connecting to the IRC Server...${CYN}
  $ irssi -c irc.freenode.net -n [nick] -w [password]${LTYLLW}
  Joining a channel...${LTMAG}
  [(status)] /join #channel${LTYLLW}
  Getting help in the irssi console...${BOLD}${LTYLLW}
 NOTE- Messaging chanserv or nickserv is the same as a PM...
 You need to switch to that PM channel in your Console
 Use CTRL+n for NEXT channel, CTRL+p for PREVIOUS channel${RESET}${LTMAG}
  [#channel] /msg chanserv help
  [#channel] /msg nickserv help
  [#channel] /msg chanserv help <command>${LTYLLW}
 EXAMPLE-${LTMAG}
  [#channel] /msg chanserv help REGISTER${CYN}
    REGISTER allows you to register a channel
    so that you have better control.
    allows you to maintain a channel access list
    Syntax: REGISTER <##channel>
    /msg ChanServ REGISTER <##channel>${LTYLLW}
  Registering your nick...${LTMAG}
  [#channel] /msg nickserv help REGISTER${CYN}
    This will register your current nickname with NickServ.
    The password is a case-sensitive password that you make
    You have to confirm the email address. To do this,
    follow the instructions in the message sent to the email
    address.
    Syntax: REGISTER <password> <email-address>
    /msg NickServ REGISTER bar foo@bar.com${RESET}

EOT
}
#
irsi_tips () {
	cat <<EOT

${BOLD}${YLLW}    IRSSI IRC Tips and shortcuts-${RESET}${YLLW}
  Irssi is an IRC (Internet Relay Chat) client for use in
    the Command Line Interface
  This is a living and growing  part of this script and we will be
  adding more Tips and Info...${BOLD}${LTCYN}
    Here is the list of Options as of this release-${RESET}${LTCYN}
  [logs]${LTYLLW}    Log Capture    Capture all logs from Your channels
                           and rotate them with logrotate${LTCYN}
  [inew]${LTYLLW}    New to Irssi   Tips for users that are new to Irssi${LTCYN}
  [quit]${LTYLLW}    Quit/Exit      Exit this script${RESET}
EOT
if $NOOPTS; then
    irsi_logs
    irsi_noob
    exit $?
else
    printf "\n${YLLW}
\t Please choose from the following${LTCYN} Options...
  [1]\t${CYN}=>\tlogs${LTCYN}
  [2]\t${CYN}=>\tinew${LTCYN}
  [q]\t${CYN}=>\tquit\n${RESET}
 [1|q]...(q)"
read IRSSIOPT
case $IRSSIOPT in
    "1")
        irsi_logs
        exit $?
    ;;
    "2")
        irsi_noob
        exit $?
    ;;
    "q")
        exit $?
    ;;
    *)
        exit $?
    ;;
esac
fi
}
#
cust_ltlid () {
	cat <<EOT

${BOLD}${YLLW}    Set the power settings for laptop lid to NOT sleep-${RESET}${LTYLLW}
    I run my web server in a VM on a laptop headlessly, so it
  just sits in a closet on a shelf and I have no need to have
  the lid open- By default the OS Laptop package sets it
  to enter sleep on lid close.
    The better way maybe to not install that package, but-
  I would not have this in the script! :P${LTCYN}
  Edit /etc/systemd/logind.conf-${CYN}
  # vi /etc/systemd/logind.conf${LTCYN}
  Add/Edit to show the following Value ...${LTMAG}
  HandleLidSwitch=ignore${LTCYN}
  Reboot the system and test${YLLW}
    NOTE- I know there is a better way to reload the settings
    WITHOUT a reboot, butI did not have the time to research
    and will update with that and remove this line.${RESET}

EOT
}
#
cust_tips () {
	cat <<EOT

${BOLD}${YLLW}    Custom Configurations Tips and shortcuts-${RESET}${YLLW}
    This is a living and growing  part of this script and we will be
  adding more Tips and Info...${BOLD}${LTCYN}
    Here is the list of Options as of this release-${RESET}${LTCYN}
  [ltpw]${LTYLLW}    Laptop Lid    Configure a laptop to be a headless server
                          and manage power settings for Lid Close${LTCYN}
  [quit]${LTYLLW}    Quit/Exit     Exit this script${RESET}
EOT
if $NOOPTS; then
    clear
    cust_ltlid
    exit $?
else
    printf "\n${YLLW}
\t Please choose from the following${LTCYN} Options...
  [1]\t${CYN}=>\tltpw${LTCYN}
  [2]\t${CYN}=>\tnone${LTCYN}
  [q]\t${CYN}=>\tquit\n${RESET}
 [1|q]...(q)"
read IRSSIOPT
case $IRSSIOPT in
    "1")
        clear
        cust_ltlid
        exit $?
    ;;
    "2")
        echo "coming soon..."
        exit $?
    ;;
    "q")
        exit $?
    ;;
    *)
        exit $?
    ;;
esac
fi
}
#
git_lab () {
	cat <<EOT

${BOLD}${YLLW}    GitLab Setup Beginning to end${RESET}${LTYLLW}

  Get files =>${CYN}
https://packages.gitlab.com/gitlab/gitlab-ce/packages/opensuse/42.2/gitlab-ce-10.3.1-ce.0.sles42.x86_64.rpm/download${YLLW}
    (Or whatever distro in parent of that link)${LTYLLW}
    OR-
  Add the repos for your distro - this example uses OpenSUSE${LTMAG}
  zypper ar https://packages.gitlab.com/gitlab/gitlab-ce/opensuse/42.3/x86_64 gitlab-ce
  zypper ar https://packages.gitlab.com/gitlab/gitlab-ce/opensuse/42.3/SRPMS gitlab-ce-src

  Install & Enable/Start Dependancies =>${LTCYN}
    Postfix
    Postgresql${LTYLLW}

  Open Firewall Port/s =>${LTMAG}
sudo yast2 firewall services add tcpport=80,443,22,25,465,587 udpport=80,443,22,25,465,587 zone=EXT${LTYLLW}

  Set Hostname & Install =>${LTMAG}
EXTERNAL_URL="http://<FQDN>" zypper install <rpm from above link>${LTYLLW}
  OR-${LTMAG}
EXTERNAL_URL="http://<FQDN>" zypper install gitlab-ce${LTYLLW}
  If Importing a backed-up instance, ensure the Versions match${LTMAG}
EXTERNAL_URL="http://server.domain.com" zypper install gitlab-ce=10.8.3-ce.0.sles42${LTYLLW}

  Set Configuration =>${LTMAG}
gitlab-ctl reconfigure${LTYLLW}
    Verify FQDN is in${LTCYN} /etc/gitlab/gitlab.rb${LTYLLW}

  Restart GitLab =>${LTMAG}
gitlab-ctl restart
gitlab-ctl status${LTYLLW}

  Initial UI Configuration in Browser =>${CYN}
    http://<FQDN>${LTYLLW}
  On first opening of UI must reset Administrator (root) password${YLLW}
    Setup Users as needed
    Setup Groups as needed
    Setup Roles as needed${LTYLLW}
  Importing github repos-${YLLW}
  The hard way-
    Follow instructions from${CYN} https://docs.gitlab.com/ee/user/project/import/github.html${LTYLLW}
  The easy way-${YLLW}
    1. Login to your gitlab WebUI as YOUR User- NOT Admin/root
    2. Create a Group- assuming you dont have one already
      a.${LTCYN} Groups${YLLW} from top toolbar =>${LTCYN} New Group${YLLW}
    3. Click on the Group listed
    4.${LTCYN} New Project => Import project => Repo by URL${YLLW}
      a. Copy/paste the url from your github repo into the${LTCYN} Git repository URL${YLLW} field
      b. Populate the remaining fields as desired, ensuring that the Group Name under${LTCYN} Project Path${YLLW} is correct
      c. Select${LTCYN} Create Project${LTYLLW}
    This will import your github repo along with the history from the commit logs.
    You cah now go into that repo in the WebUI and select either HTTP or SSH and copy that URL,
      and on your PC- cd to where you want the repo, and${LTMAG} git clone <Paste-URL>${LTYLLW}

Creating New Repos-${YLLW}
  1. Login to your gitlab WebUI as YOUR User- NOT Admin/root
  2. Create a Group- assuming you dont have one already
    a.${LTCYN} Groups${YLLW} in top bar =>${LTCYN} New Group${YLLW}
  3. Click on the Group listed
  4.${LTCYN} New Project${YLLW} => Populate the fields as desired, ensuring that the Group Name under Project Path is correct
  5. Select${LTCYN} Create Project${YLLW}
  6. Click the${LTCYN} "+"${YLLW} drop-down in the upper toolbar, Select${LTCYN} "New file"${YLLW}
  7. Name it what you want [README is good], and add some text, like a description...
  8. Save and commit the change
  You cah now go into that repo in the WebUI and select either HTTP or SSH and copy that URL,
    and on your PC- cd to where you want the repo, and${LTMAG} 'git clone <Paste-URL>'${LTYLLW}
  Export gitlab-server from one server to another-${RESET}

EOT
}
#
git_branch () {
	cat <<EOT

${BOLD}${YLLW}    Working with branches in GIT${RESET}${LTCYN}
  Static Rules${CYN}
    1. Always pull before any push
    2. Don\'t pull branches from master
    3. If other branches, they each do same process${LTCYN}
  Steps${CYN}
    1. Create <branch1>
    2. Checkout new branch
    3. Make changes
    4. Add/Commit
    5. Test
    6. Fix
    7. Add/Commit
    8. Test
    9. Add/commit/Pull/push
    10. Checkout master
    11. Merge <branch1>${RESET}

EOT
}
#
my_links () {
	cat <<EOT

${BOLD}${LTYLLW}    Links to other scripts, tutorials, etc. that are designed
    to help, automate, or otherwise serve a purpose in daily life.${RESET}${LTCYN}
  seaphor${CYN}    System Information gathering script, it gathers MB, BIOS, GFX-Card, WLAN, LAN, OS, RAM, CPU, Disk, Repos, and more...${RESET}
    https://github.com/SeaPhor/SeaPhor-Scripts/tree/master/reports/sysinfo/seaphor-4.1-7${LTCYN}
  c4-bug-report${CYN}    Script created to generate a bug report to CSV format, and can be adjusted to fit any needs. there is also an alpha TUI version I am working on, I will post both here...${RESET}
    https://github.com/SeaPhor/SeaPhor-Scripts/tree/master/reports/Bug-Report/Latest_Stable${RESET}

EOT
}
#
user_input () {
	cat <<EOT

${BOLD}${YLLW}    To ask the user for input to be set in a variable,
  EXAMPLE-${RESET}${YLLW} Use the -p and the -s options for login credentials${LTCYN}
    # Ask the user for login details
    printf "Please enter your login credentials when prompted..."
    read -p 'Username: ' uservar
    read -sp 'Password: ' passvar
    echo
    printf "Thank you \$uservar we now have your login details"${YLLW}
  Output in the Terminal-${BOLD}${CYN}
    ./login.sh
    Username: ryan
    Password:
    Thank you ryan we now have your login details${RESET}${LTYLLW}

  Resource-${CYN}
    https://ryanstutorials.net/bash-scripting-tutorial/bash-input.php${RESET}
EOT
echo -e "${BOLD}${LTCYN}Press any key to continue, 'q' Quits/Exits...${RESET}"
read -n 1 -s read_anykey
[[ $read_anykey = "q" ]] && exit 0 || read_one
}
read_one () {
    cat <<EOT
${YLLW}
  Now, there are 2 tnings you can do with these variables
    1. Use it within the script to execute other cammands passing
       the variables instead of prompting once or multiple times.${LTYLLW}
  EXAMPLE- For the 1st Option, using the example above
      Say you wanted to pass a command to a/some different 
      box/es via ssh and didnt want to put that info in 
      your script, the lines would look something like...${LTCYN}
    MYHOST="hostname -f"
    MYOS="cat /etc/*release"
    MYKERN="uname -r"
    for i in \`cat hostlist.txt\`
    do
      sshpass -p \$passvar ssh \$uservar@\$i \$MYHOST && \$MYOS && \$MYKERN >> myhosts-details.txt
      echo >> myhosts-details.txt
    done${RESET}
EOT
echo -e "${BOLD}${LTCYN}Press any key to continue, 'q' Quits/Exits...${RESET}"
read -n 1 -s read_anykey
[[ $read_anykey = "q" ]] && exit 0 || read_two
}
read_two () {
    cat <<EOT
${YLLW}
    2. Set the variable values to a [Local]'source' file
       to be used in subsequent runs of your script/s.${LTYLLW}
  EXAMPLE- For the 2nd Option, using the example above${LTCYN}
    if [[ ! -a ~/.myusercreds ]]; then
        # Ask the user for login details
        printf "Please enter your login credentials when prompted..."
        echo
        read -p 'Username: ' uservar
        read -sp 'Password: ' passvar
        echo
        echo "MYUSER=\$uservar" > ~/.myusercreds
        echo "MYPASS=\$passvar" >> ~/.myusercreds
        chmod 700 ~/.myusercreds
        printf "Thank you \$uservar we now have your login details,\nIf you need to change them you can find them at '~/.myusercreds'"
        echo
        source ~/.myusercreds
    else
        source ~/.myusercreds
    fi${LTYLLW}
  Resource- Find out more about this and much more at...${CYN}
    https://github.com/SeaPhor/SeaPhor-Scripts/tree/master/Sourcing${RESET}
EOT
}
#
custom_date () {
	cat <<EOT
${BOLD}${YLLW}    Using custom date command in scripts and/or cli${RESET}${YLLW}
    In Scripts create Variables for date output/input${CYN}
TDATE=\`date +%a\ %b\ %d\ %Y\`
JDATE=\`date +%y%m%d-%H.%M.%S\`
WDATE=\`date +%U\ %Y\`${LTYLLW}

Examples and outputs-${YLLW}
Casual${CYN}
CASDATE="\$(date +%a\ %b\ %d\ %Y)"${LTCYN}
Mon Apr 30 2018${YLLW}

International${CYN}
INTNDATE="\$(date +%d\ %b\ %Y)"${LTCYN}
30 Apr 2018${YLLW}

Tech- filename${CYN}
FILNMDATE="\$(date +%y%m%d-%H.%M.%S)"${LTCYN}
180430-09.47.48${YLLW}

Week & Year${CYN}
$ date +%U\ %Y${LTCYN}
17 2018${YLLW}

Year & Month Alpha${CYN}
$ date +%Y\ %B${LTCYN}
2018 April${YLLW}

Year & Month Numeric${CYN}
$ date +%Y\ %m${LTCYN}
2018 04${YLLW}

Year Month Day Numeric${CYN}
$ date +%Y\ %m\ %d${LTCYN}
2018 04 30${YLLW}

Slashed${CYN}
$ date +%D${LTCYN}
04/30/18${YLLW}

Casual-tech${CYN}
$ date +%Y\ %m\ %d\ %A${LTCYN}
2018 04 30 Monday${YLLW}

Convert Epoc date/time into Human-Readable${CYN}
$ date -d @1521415551${LTCYN}
Sun, Mar 18, 2018  6:25:51 PM${YLLW}

for log/output-filename${CYN}
LOGFILDATE="\$(date +%Y-%m-%d_%H-%M-%S)"${LTCYN}
2018-04-30_09-53-27${YLLW}

for logging${CYN}
LOGDATE="\$(date +%Y-%m-%d_%H:%M:%S)"${LTCYN}
2018-04-30_09:53:27${YLLW}

Add a date/time-stamp to your history,${CYN}
add this to the end of your ~/.bash_profile or ~/.bashrc, then 'source' the one youe edited${LTCYN}
export HISTTIMEFORMAT=\${HISTTIMEFORMAT:-"%F %H:%M:%S "}${LTYLLW}
 1119  2018-08-03 16:33:23 vi Useful_Tips/useful-tips.sh${RESET}

EOT
}
#
chk_cmd () {
	cat <<EOT
${BOLD}${YLLW}    Need to find out if a particular command is available?${RESET}${LTYLLW}
  You can use the 'which' command, but, in scripting most
  times you just need a yes/no answer.
    Thats where 'type' command comes in...${YLLW}
  Here's a script example...${LTCYN}
type -P getent &>/dev/null && GETENT=true || GETENT=false
if \$GETENT; then
    USERPW="\`getent passwd \$1\` "
else
    USERPW="cnf - getent - command not found..."
fi
echo "Result of getent passwd \$1 is - \$USERPW"${RESET}

EOT
}
#
for_cows () {
	cat <<EOT

${BOLD}${YLLW}    Silly little hack so you will have a fortune each time you log in${RESET}${YLLW}
    Add or Uncomment and modify this to your users ~/.profile
    Or ad to /etc/skel/profile - Use any available ascii,
    I chose dragon here${LTYLLW}
  NOTE- You will need both fortune and cowsay installed$LTCYN

  if [ -x /usr/bin/fortune ] ; then
      echo
      /usr/bin/fortune | cowsay -f dragon
      echo
  fi${LTYLLW}
    You can use${LTMAG} ${PROGNAME} cows-info${LTYLLW} to see a list of ascii 'cows' to use
    Or, do${LTMAG} ls /usr/share/cows/${RESET}

EOT
}
#
cows_info () {
	cat <<EOT

${BOLD}${YLLW}    Here is a list of available 'cows' in my installation-${RESET}${LTCYN}
    ls /usr/share/cows/
beavis.zen.cow  dragon-and-cow.cow     hellokitty.cow  moofasa.cow    sodomized.cow    turtle.cow
bong.cow        dragon.cow             kiss.cow        moose.cow      stegosaurus.cow  tux.cow
bud-frogs.cow   elephant.cow           kitty.cow       mutilated.cow  stimpy.cow       udder.cow
bunny.cow       elephant-in-snake.cow  koala.cow       ren.cow        supermilker.cow  vader.cow
cheese.cow      eyes.cow               kosh.cow        satanic.cow    surgery.cow      vader-koala.cow
cower.cow       flaming-sheep.cow      luke-koala.cow  sheep.cow      telebears.cow    www.cow
daemon.cow      ghostbusters.cow       meow.cow        skeleton.cow   three-eyes.cow
default.cow     head-in.cow            milk.cow        small.cow      turkey.cow${LTYLLW}
    For a quick preview of available cows, run the following-${BOLD}${LTYLLW}
    BUT- not all are appropriate for all audiences.${RESET}${LTMAG}
    for i in \`ls -1 /usr/share/cows/\`; do cowsay -f \$i "\$i"; sleep 3;  done${RESET}

EOT
}
#
git_alias () {
	cat <<EOT

${BOLD}${YLLW}    You wont have a ~/.gitconfig until you do the following, and its a good idea anyway${RESET}${LTCYN}
  git config --global user.name "Firstname Lastname"
  git config --global user.email email@domain.com${BOLD}${YLLW}
    Add these declarations to your users ~/.gitconfig for efficiency${RESET}${YLLW}
[alias]${LTCYN}
  co = checkout
  ci = commit -a -m
  st = status
  br = branch
  hist = log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short
  type = cat-file -t
  dump = cat-file -p
  last = log -1 HEAD${RESET}

EOT
}
#
add_color () {
	cat <<EOT

${BOLD}${YLLW}    Add these Colors and effects to the output of your scripts-${RESET}
  Output${RED}
    Red${LTRED}
    Light Red${GRN}
    Green${LTGRN}
    Light Green${CYN}
    Cyan${LTCYN}
    Light Cyan${BLU}
    Blue${LTBLU}
    Light Blue${MAG}
    Magenta${LTMAG}
    Light Magenta${YLLW}
    Yellow${LTYLLW}
    Light Yellow${BOLD}${CYN}
    Add BOLD to the text
    ${SOMODE}Add Standout mode${NSOMODE}${BOLD}${CYN}
    ${BGBLU}${LTRED}Add Background Highlighting to the text${RESET}${LTYLLW}
    ${ULINE}Add Underlining to the text${NULINE}${RESET}${LTYLLW}
    I added a '-info' for this and display how I do this in the script
  Or, you can just open this script and see for yourself${RED} (_:^(|)${MAG} [dead-Homer]${RESET}

EOT
}
colr_info () {
    cat <<EOT
${BOLD}${YLLW}
    Using Color to enhance the output of your scripts${RESET}${YLLW}
  Use 'tput' in a variablized way and declare those in the head of scripts${LTCYN}
  Here are the ones in this script ($PROGNAME),${BOLD}${LTYLLW} Turning off colors for this...${RESET}
RED="\$(tput setaf 1)"
GRN="\$(tput setaf 2)"
YLLW="\$(tput setaf 3)"
BLU="\$(tput setaf 4)"
MAG="\$(tput setaf 5)"
CYN="\$(tput setaf 6)"
LTRED="\$(tput setaf 9)"
LTGRN="\$(tput setaf 10)"
LTYLLW="\$(tput setaf 11)"
LTBLU="\$(tput setaf 12)"
LTMAG="\$(tput setaf 13)"
LTCYN="\$(tput setaf 14)"
BGBLU="\$(tput setab 4)"
BGYLLW="\$(tput setab 3)"
BGLYLLW="\$(tput setab 11)"
ULINE="\$(tput smul)"
NULINE="\$(tput rmul)"
SOMODE="\$(tput smso)"
NSOMODE="\$(tput rmso)"
BOLD="\$(tput bold)"
RESET="\$(tput sgr0)"
${BOLD}${YLLW}
  Example-${RESET}${LTYLLW}(For command line, use above for scripts)${GRN}
    Try it, copy/paste the following line in your terminal-
echo -e "\n\$(tput bold)\$(tput setaf 1)This is a example,\n\t\$(tput sgr0)\$(tput setaf 14)for adding colors to commands and scripts.\$(tput sgr0)\n"${YLLW}
  References-${LTCYN}
https://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x405.html
http://mewbies.com/motd_console_codes_color_chart_in_color_black_background.htm
${RESET}
EOT
}
#
###########################################
####    RPM-Build
###########################################
#
#
###########################################
####    Define functions
###########################################
#
content_run () {
    clear
    cat <<EOT
${BOLD}${YLLW}
RPM-Build${LTYLLW}
    How To Build RPM Packages.${RESET}${CYN}
Contents${LTCYN}
  Building rpms with 'rpmbuild'
    Build an rpm from a script
      Preparation
        Requirements
        The rpm directory structure
      The 'SOURCE' code Directory
      The 'spec' file
      The 'rpmbuild' command to build the rpm
      Verify, Install, and Test the rpm
    Build an rpm from source (src) code
  Notes on RPM, Versioning, and Structure
  Documentation
  References${RESET}
EOT
}
#
####    How-To
prep_run () {
    clear
    cat <<EOT
${BOLD}${YLLW}
1. Building rpms with 'rpmbuild'${LTYLLW}
  a. Build an rpm from a script${RESET}${LTCYN}

    1. Preparation (This is the same for "Build an rpm from source)
       Before you begin building rpms you may need to prepare the environment.
      a. Requirements${CYN}
        ####    Install the 'rpm-build' package/s
        ####    -SUSE${LTGRN}
        $ sudo zypper in patterns-devel-base-devel_rpm_build rpm-build${CYN}
        ####    -Redhat${LTGRN}
        $ sudo yum install rpm-build${LTCYN}
      b. The rpm directory structure
        It is best to start with a standard rpmbuild directory structure in your
         user's \${HOME}/ directory, don't get in the habbit of building rpms as
         root, there is potential for breaking things if you do.${CYN}
        ####    rpmbuild directory structure${LTGRN}
        $ mkdir -p ~/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}
        $ cd ~/rpmbuild
        $ tree -L 1 .${LTCYN}
        .
        ├── BUILD
        ├── BUILDROOT
        ├── RPMS
        ├── SOURCES
        ├── SPECS
        └── SRPMS${RESET}
EOT
}
#
srcdir_run () {
    clear
    cat <<EOT
${BOLD}${LTYLLW}
    2. The 'SOURCE' code Directory${RESET}${LTYLLW}
      The 'source' is the script itself, placed in the "SOURCES" directory under the
       rpmbuild directory structure.${CYN}
      ####    Get the script into the "SOURCES" directory- notice the re-name (my pref)${LTGRN}
      $ cp ~/repos/github/TipsAndTricks/Useful_Tips/useful-tips.sh ~/rpmbuild/SOURCES/usefultips${RESET}
EOT
}
#
spec_run () {
    clear
    cat <<EOT
${BOLD}${LTYLLW}
    3. The 'spec' file${RESET}${LTYLLW}
       Examples for this documentation- I will use my "usefultips.sh" script for the
        "source", I will use my user's info for the Path, etc.
       The 'spec' filename suould match the name of the 'source', e.g. "usefultips.spec",
        and the content "%define name" must be the name of the script-name inside the
        "SOURCES" directory, e.g. "usefultips".
       The spec file must be in the "SPECS" directory under the rpmbuild directory
        structure.
       Here's the spec file for the usefultips.sh script${LTGRN}
       $ cat SPECS/usefultips.spec${CYN}
       ####    Output${LTCYN}
Name:           usefultips
Version:        0.0.2
Release:        03
Summary:        Living script consisting of collections of useful tips gathered over time
Group:          Applications/Information
License:        GPLv2
URL:            https://github.com/SeaPhor/TipsAndTricks/blob/master/Useful_Tips/Latest_Stable/useful-tips.sh
Source:		%{name}
BuildRoot:      %{buildroot}
Prefix:		/usr
%description
A Living script for Useful Linux commands, scripting, and configuring
in an Enterprise environment
%prep
#%setup -q
%install
cd /home/c4/rpmbuild/BUILDROOT
mkdir -p %{buildroot}/usr/local/bin
cp %{_topdir}/SOURCES/%{name} %{buildroot}/usr/local/bin/
%clean
rm -rf \$RPM_BUILD_ROOT
%files
%defattr(-,c4,users)
/usr/local/bin/usefultips
%doc
%changelog${RESET}${YLLW}
       After the spec file is in the "SPECS" directory, and the script is in the "SOURCES"
        directory, your environment should look like so:${LTGRN}
       $ rpmbuild> tree -L 2 .${CYN}
       ####    Output${LTCYN}
       .
       ├── BUILD
       ├── BUILDROOT
       ├── RPMS
       ├── SOURCES
       │   └── usefultips
       ├── SPECS
       │   └── usefultips.spec
       └── SRPMS${BOLD}${YLLW}
  Note:${RESET}${YLLW}
    You can create your spec file by simply copying an existing spec file and modifying it.
    As an alternative, you can use the vim or emacs command to open any new file that ends in .spec. The editor will automatically create a template within the new file for writing an RPM spec file.${RESET}

EOT
}
#
cmd_run () {
    clear
    cat <<EOT
${BOLD}${LTYLLW}
    4. The 'rpmbuild' command to build the rpm${RESET}${LTYLLW}
       Read the man page for the other options available, for this document I am
        only using what is needed.${CYN}
       ####    The rpmbuild command${LTGRN}
       $ rpmbuild -v -bb --clean SPECS/usefultips.spec${CYN}
       ####    Output${LTCYN}
Executing(%prep): /bin/sh -e /var/tmp/rpm-tmp.aXzDRT
+ umask 022
+ cd /home/c4/rpmbuild/BUILD
+ exit 0
Executing(%install): /bin/sh -e /var/tmp/rpm-tmp.mopZjD
+ umask 022
+ cd /home/c4/rpmbuild/BUILD
+ cd /home/c4/rpmbuild/BUILDROOT
+ mkdir -p /home/c4/rpmbuild/BUILDROOT/usefultips-0.0.2-04.x86_64/usr/local/bin
+ cp /home/c4/rpmbuild/SOURCES/usefultips /home/c4/rpmbuild/BUILDROOT/usefultips-0.0.2-04.x86_64/usr/local/bin/
+ /usr/lib/rpm/brp-compress
+ /usr/lib/rpm/brp-suse
calling /usr/lib/rpm/brp-suse.d/brp-99-compress-vmlinux
calling /usr/lib/rpm/brp-suse.d/brp-99-pesign
No buildservice signing certificate
Creating /home/c4/rpmbuild/OTHER/usefultips.cpio.rsasign
1 block
Processing files: usefultips-0.0.2-04.x86_64
Provides: usefultips = 0.0.2-04 usefultips(x86-64) = 0.0.2-04
Requires(rpmlib): rpmlib(CompressedFileNames) <= 3.0.4-1 rpmlib(FileDigests) <= 4.6.0-1 rpmlib(PayloadFilesHavePrefix) <= 4.0-1
Requires: /usr/bin/env
Checking for unpackaged file(s): /usr/lib/rpm/check-files /home/c4/rpmbuild/BUILDROOT/usefultips-0.0.2-04.x86_64
Wrote: /home/c4/rpmbuild/RPMS/x86_64/usefultips-0.0.2-04.x86_64.rpm
Executing(%clean): /bin/sh -e /var/tmp/rpm-tmp.0bADvn
+ umask 022
+ cd /home/c4/rpmbuild/BUILD
+ rm -rf /home/c4/rpmbuild/BUILDROOT/usefultips-0.0.2-04.x86_64
+ exit 0
Executing(--clean): /bin/sh -e /var/tmp/rpm-tmp.yr4HH7
+ umask 022
+ cd /home/c4/rpmbuild/BUILD
+ exit 0${RESET}
EOT
}
#
inst_run () {
    clear
    cat <<EOT
${BOLD}${LTYLLW}
    5. Verify, Install, and Test the rpm${RESET}${LTYLLW}
      In the output above you will see the full path to the newly created rpm:${BOLD}${CYN}
       "Wrote: /home/c4/rpmbuild/RPMS/x86_64/usefultips-0.0.2-04.x86_64.rpm"${RESET}${CYN}
      ####    Verify the rpm${LTGRN}
      $ rpm -qpi RPMS/x86_64/usefultips-0.0.2-04.x86_64.rpm${CYN}
      ####    Output will be the contents of your spec file
      ####    Install the rpm ${BOLD}(${ULINE}ALWAYS use "U"${NULINE})${RESET}${LTGRN}
      $ sudo rpm -Uhv RPMS/x86_64/usefultips-0.0.2-04.x86_64.rpm${CYN}
      ####    Output${LTCYN}
      Preparing...                          ################################# [100%]
      Updating / installing...
         1:usefultips-0.0.2-04              ################################# [100%]${LTGRN}
      $ which usefultips${LTCYN}
      /usr/local/bin/usefultips${LTGRN}
      $ usefultips vers${LTCYN}
      This Version/Revision of usefultips is 0.0.2-04 released on 15 Sep 2018${RESET}
EOT
}
#
srcode_run () {
    clear
    cat <<EOT
${BOLD}${LTYLLW}
  b. Build an rpm from source (src) code${RESET}${LTYLLW}
    Not available yet, see the "Resources" section for links${RESET}
EOT
}
#
patch_run () {
    clear
    cat <<EOT
${BOLD}${LTYLLW}
  c. Creating Patch to update source code${RESET}${LTYLLW}
    Not available yet, see the "Resources" section for links${RESET}
EOT
}
#
note_run () {
    clear
    cat <<EOT
${BOLD}${LTYLLW}
2. Notes on RPM, Versioning, and Structure${RESET}${LTYLLW}
  a. It recommended to ALWAYS use "${BOLD}${LTCYN}U${RESET}${LTYLLW}" instead of "${BOLD}${LTCYN}i${RESET}${LTYLLW}" when installing an rpm...
      Read the man page to find out why.
  b. Use a standardized versioning method and be consistant with its use.
  c. When building a newer rev of a previously built rpm, remember to copy the edited
      script to the "SOURCES" directory, and update the "Release", and possible the
      "Version" section/s of the 'spec' file.${RESET}
EOT
}
#
doc_run () {
    clear
    cat <<EOT
${BOLD}${LTYLLW}
3. Documentation${RESET}${LTYLLW}
  The commands, files, and executions in this document were performed on openSUSE Leap-15
  Whether SUSE-based distro or Redhat-based the structure and process is basically
   the same, but, SUSE has some built in and enhanced/expanded capabilities.
  Whether SUSE or Redhat platform, there are other tools to use instead of this
   manual process, such as, SUSE's "Open Build Service", which is distro agnostic, and
   can be used online or downloaded and used locally. (see "Rferences")
EOT
}
#
ref_run () {
    clear
    cat <<EOT
${BOLD}${LTYLLW}
4. References${RESET}${LTCYN}
  https://cromwell-intl.com/open-source/rpm-patch.html
  https://www.suse.com/documentation/suse-best-practices/pdfdoc/sbp-rpm-packaging/sbp-rpm-packaging.pdf
  https://access.redhat.com/sites/default/files/attachments/rpm_building_howto.pdf
  https://openbuildservice.org/
EOT
}
#
###########################################
####    Show menu, receive imput, execute
###########################################
#
contd_run () {
    echo -e "${BOLD}${LTCYN}Press any key to continue, 'q' Quits/Exits...${RESET}"
    read -r -n 1 -s anykey
    [[ $anykey = "q" ]] && exit 0 || rpmdoc_run
}
rpmdoc_run () {
    cat <<EOT
${BOLD}${YLLW}
This is a long document so it is broken into sections...${RESET}${YLLW}
${ULINE}Option   Section${NULINE}${LTCYN}
  [1]${YLLW}    Contents${LTCYN}
  [2]${YLLW}     Preparation${LTCYN}
  [3]${YLLW}      The 'SOURCE' code Directory${LTCYN}
  [4]${YLLW}      The 'spec' file${LTCYN}
  [5]${YLLW}      The 'rpmbuild' command to build the rpm${LTCYN}
  [6]${YLLW}      Verify, Install, and Test the rpm${LTCYN}
  [7]${YLLW}    Build an rpm from source (src) code${LTCYN}
  [8]${YLLW}    Notes on RPM, Versioning, and Structure${LTCYN}
  [9]${YLLW}    Documentation${LTCYN}
  [r]${YLLW}    References${LTCYN}
  [q]${YLLW}    Quit/Exit${RESET}
EOT
read -p "${BOLD}${LTCYN}Please select an Option from above....${RESET}
" mychoice
case $mychoice in
    1)
        clear
	content_run
        contd_run
    ;;
    2)
        clear
        prep_run
        contd_run
    ;;
    3)
        clear
        srcdir_run
        contd_run
    ;;
    4)
        clear
        spec_run
        contd_run
    ;;
    5)
        clear
        cmd_run
        contd_run
    ;;
    6)
        clear
        inst_run
        contd_run
    ;;
    7)
        clear
        srcode_run
        contd_run
    ;;
    8)
        clear
        note_run
        contd_run
    ;;
    9)
        clear
        doc_run
        contd_run
    ;;
    r)
        clear
        ref_run
        contd_run
    ;;
    q)
        exit 0
    ;;
    *)
        clear
        contd_run
        exit $?
    ;;
esac
}
#
###########################################
####    TAR Command
###########################################
#
cmmd_tar () {
    clear
    cat <<EOT
${BOLD}${YLLW}
    The tar command, example answers to common questions${RESET}${YLLW}
  The most common question I know is the use of -C to remove the trailing path-${BOLD}${YLLW}

Backing Up - Archiving${RESET}${YLLW}
  In this example I will archive MyApp config to my user home directory.${GRN}
$ tar -czvf \${HOME}/myuser/bakups/MyAppConf_\$MYDATE.tar.gz -C /opt/myapp/ conf.d
$ tar -tf \${HOME}/myuser/bakups/MyAppConf_\$MYDATE.tar.gz${LTCYN}
conf.d${BOLD}${YLLW}

Relieving full Disk/Partition space${RESET}${YLLW}
    In this example we've been alerted that the '${CYN}/var/log${YLLW}' partition is at ${RED}95%${YLLW} full
  and growing, our team-mate is working on the cause and we are to relieve the space
  to avoid any outages due to the system being unable to log.
    With a quick check we see that the rotated '${CYN}secure${YLLW}' logs are the culpret and the 
  active log is growing. We see that the logs are set to ${ULINE}daily${NULINE} and not by ${ULINE}size${NULINE}, and
  that ${ULINE}compression${NULINE} is not being used.${BOLD}${CYN}
  ${ULINE}FIRST${NULINE}${RESET}${CYN} Stop the bleeding${GRN}
# cd /opt
# tar -czvf secure_2018-09-14.tar.gz -C /var/log/ secure-2018* --remove-files
# logrotate /etc/logrotate.d/syslog${YLLW} ##Compress this file too, team-mate review${GRN}
# tar -czvf secure_2018-09-14_15-21.tar.gz -C /var/log/ secure-2018* --remove-files
# df -h /var/log${YLLW} ##verify free space${GRN}
# mv secure_2018-09-14.tar.gz /var/log/.${YLLW}
    We used the /opt partition in this case for Free Space available.${BOLD}${CYN}
  ${ULINE}SECOND${NULINE}${RESET}${CYN} Prevent future occurances${YLLW}
    Notify the puppet team to modify the syslog/logrotate module to include
  compress, dateext, and size, ${BOLD}${SOMODE}NOT${NSOMODE}${RESET}${YLLW} daily.
${RESET}
EOT
}
#
###########################################
####    Simple MATH
###########################################
#
smpl_math () {
    clear
    cat <<EOT
${BOLD}${YLLW}
    Performing Simple Math calculations in command line and scripting${RESET}${YLLW}
  Using cal and expr to find number of days between 2 dates, in this
  example using employment start date to current date.${GRN}
> cal -j 2 4 2018${LTCYN}
         April 2018        
Sun Mon Tue Wed Thu Fri Sat
 91  ${SOMODE}92${NSOMODE}  93  94  95  96  97 
 98  99 100 101 102 103 104 
105 106 107 108 109 110 111 
112 113 114 115 116 117 118 
119 120${GRN}
> cal -j 18 9 2018${LTCYN}
       September 2018      
Sun Mon Tue Wed Thu Fri Sat
                        244 
245 246 247 248 249 250 251 
252 253 254 255 256 257 258 
259 260 ${SOMODE}261${NSOMODE} 262 263 264 265 
266 267 268 269 270 271 272 
273${GRN}                         
> expr 261 - 92${LTCYN}
${SOMODE}169${NSOMODE}
${RESET}
EOT
}
#
#
###########################################################
##    Snippets and Mapping
###########################################################
#
examp_date () {
    cat <<EOT
${LTCYN}
#
###########################################################
##    Date Variables
###########################################################
#
CASDATE="\$(date +%a\ %b\ %d\ %Y)"
INTNDATE="\$(date +%d\ %b\ %Y)"
FILNMDATE="\$(date +%y%m%d-%H.%M.%S)"
LOGFILDATE="\$(date +%Y-%m-%d_%H-M)"
LOGDATE="\$(date +%Y-%m-%d_%H:%M)"${RESET}
EOT
}
examp_globvar () {
    cat <<EOT
${LTCYN}
###########################################################
##    Global Variables and Information Gathering
###########################################################
#
PROGNAME=\$(basename \$0)
PROGVERS="0.0.0-01"
PROGDATE="\$INTNDATE"${RESET}
EOT
}
#
examp_usage () {
    cat <<EOF
${LTCYN}#
###########################################################
##    Script Options/Usage
###########################################################
#
usage () {
    cat <<EOT
\${BOLD}\${YLLW}
Description-\${RESET}\${YLLW}
    Begin Description\${BOLD}
Options-\${RESET}\${YLLW}
    Begin Options\${BOLD}
Usage-\${RESET}\${YLLW}
    Begin Usage
\${RESET}
EOT
}${RESET}
EOF
}
examp_args () {
    cat <<EOT
${LTCYN}#
###########################################
####    Declare Arg Checks
###########################################
#
[[ \$1 ]] || { usage; echo -e "\t\${BOLD}\${RED}Requires at least 1 parameter\n\${RESET}"; exit 1; }
[[ \$# -ne 2 ]] && { usage; echo -e "\t\${BOLD}\${RED}Requires exactly 2 arguementss\n\${RESET}"; exit 1; }
[[ \$@ =~ "help" ]] && { usage; exit 0; }
[[ \$@ =~ "nocolor" ]] && NOCOLR=true || NOCOLR=false${RESET}
EOT
}
my_vimrc () {
    cat <<EOT
${BOLD}${GRN}
$ ls ~/snippets${RESET}${LTCYN}
argchks  colors  dates  globvars  optsusage${BOLD}${GRN}
$ cat ~/.vimrc${RESET}${LTCYN}
map <F2> <ESC>:r ~/VI/snippets/argchks <ESC>:r ~/VI/snippets/optsusage <ESC>:r ~/VI/snippets/colors <ESC>:r ~/VI/snippets/globvars <ESC>:r ~/VI/snippets/dates <ESC>:r ~/VI/snippets/shebangplus <ESC>k:1,.d <ESC>:w
${RESET}
EOT
}
vism () {
    clear
    cat <<EOT
${BOLD}${YLLW}
Description-${RESET}${LTYLLW}
  Using VIM Snippets and Mapping${LTCYN}
    VIM has so many built-in functions and abilities that we all should take advantage of.
    Just a few of those that I have found most useful is the use of ${BOLD}${ULINE}Snippets${NULINE}${RESET}${LTCYN} and ${BOLD}${ULINE}Mapping${NULINE}${RESET}${LTCYN},
    and making some of those permanent by adding them to your ~/.vimrc file.${BOLD}${YLLW}
Snippets-${RESET}${LTYLLW}
    Create a directory to hold your 'snippets', in this example I will use ~/snippets
    Create a separate file for each snippet, I have ones for "globalvariables", 
      "colorvars", while, until, & for loops, casestatements, etc.${BOLD}${GRN}
  $ vi ~/snippets/usage${RESET}${LTCYN}
  #
  ###########################################################
  ##    Script Options/Usage
  ###########################################################
  #
  usage () {
      cat <<EOT
  \${BOLD}\${YLLW}
  Description-\${RESET}\${YLLW}
      Begin Description\${BOLD}
  Options-\${RESET}\${YLLW}
      Begin Options\${BOLD}
  Usage-\${RESET}\${YLLW}
      Begin Usage
  \${RESET}
  EOT
  }${LTYLLW}
    Save and quit with "${LTCYN}:wq"${LTYLLW}.
    Now, when you create or edit a script, and want to add a Usage function you 
    can do the following:${BOLD}${GRN}
  $ vi newscript.sh${RESET}${LTYLLW}
    Move the cursor to the line above where you want to inster the "Usage"
    snippet and do the following:${LTCYN}
  :r ~/snippets/usage${LTYLLW}
    And hit ENTER, your 'snippet' will appear and you can begin editing.${BOLD}${YLLW}
Mapping-${RESET}${LTYLLW}
    Now, you can 'map' this in the vi session, but that wont be permanent, I'll 
    put both examples here.
  Inside vi-${LTCYN}
  :map ${LTMAG}<F2> <ESC>${LTCYN}:r ~/snippets/usage${LTYLLW}
    Then, inside vi, you can just hit the "${SOMODE}F2${NSOMODE}" key and insert it.
    To make this permanent, edit/create your ${LTCYN}~/.vimrc${LTYLLW} with vi and add the same-${BOLD}${GRN}
  $ vi ~/.vimrc${RESET}${LTCYN}
  map ${LTMAG}<F2> <ESC>${LTCYN}:r ~/snippets/usage${LTYLLW}
    Save and quit with <ESC>${LTCYN} :wq${LTYLLW}
    You can just hit the "${SOMODE}F2${NSOMODE}" key at any time and insert it.
${BOLD}${YLLW}
Resource-${RESET}${LTCYN}
  The Urban Penguin
  https://www.youtube.com/watch?time_continue=1&v=mZXO0iPLaB8
${RESET}
EOT
echo -e "\tYou can see all my snippets, and my ~/.vimrc by pressing 's'\n\tPress any other key to exit...\n"
read -r -n 1 -s anykey
if [[ $anykey == "s" ]]; then
    examp_date
    examp_globvar
    examp_usage
    examp_args
    my_vimrc
    exit 0
else
    exit 0
fi
}
#
###########################################################
##    END OF Snippets and Mapping
###########################################################
#
#
####################################################
####    PERMISSIONS on files and directories    ####
####################################################
#
perm_snip () {
    cat <<EOT
${BOLD}${YLLW}
Files, Directories, Permissions, and Values
${RESET}${LTGRN}
> ls -la ~/Directory1/${LTCYN}
total 8
drwxr-xr-x  2 user users 4096 Nov 17 08:28 .${LTGRN}       <<==${YLLW} Current directory being listed Permissions${LTCYN}
drwxr-xr-x 63 user users 4096 Nov 17 09:38 ..${LTGRN}      <<==${YLLW} Parent Directory Permissions${LTCYN}
-rw-r--r--  1 user users    0 Nov 17 08:28 file1${LTGRN}   <<==${YLLW} Listed file/s in Current directory
${LTGRN}
> ls -l ~/Directory1${LTCYN}
total 0
-rw-r--r-- 1 user users 0 Nov 17 08:28 file1${LTGRN}
│    │     │  │     │   │      │         └─────${LTYLLW}  File name${LTGRN}
│    │     │  │     │   │      └───────────────${LTYLLW}  Date/time last modified${LTGRN}
│    │     │  │     │   └──────────────────────${LTYLLW}  File Size${LTGRN}
│    │     │  │     └──────────────────────────${LTYLLW}  Owning Group${LTGRN}
│    │     │  └────────────────────────────────${LTYLLW}  Owning User${LTGRN}
│    │     └───────────────────────────────────${LTYLLW}  Number of files, including self${LTGRN}
│    └─────────────────────────────────────────${LTYLLW}  644${LTGRN}
└──────────────────────────────────────────────${LTYLLW}  "${LTCYN}-${LTYLLW}" is Regular File, "${LTCYN}d${LTYLLW}" is Directory${RESET}
EOT
}
#
secnd_run () {
    echo -e "${BOLD}${LTCYN}Press any key to continue, '${LTYLLW}q${LTCYN}' Quits/Exits...${RESET}"
    read -r -n 1 -s anykey
    [[ $anykey = "q" ]] && exit 0 || secnd_set
}
secnd_set () {
    cat <<EOT
${LTYLLW}
Field 1 - Permissions${LTCYN}
 - ___ ___ ___${LTGRN}
 │  │   │   │
 │  │   │   └──${LTYLLW} World permissions, All 'Others'${LTGRN}
 │  │   └──────${LTYLLW} Owner's Group, or Assigned Group permissions${LTGRN}
 │  └──────────${LTYLLW} Owner's permisions${LTGRN}
 └─────────────${LTYLLW} File Type, "${LTCYN}-${LTYLLW}" is regular File, "${LTCYN}d${LTYLLW}" is Directory, there are others.${LTYLLW}

Each 'set' of 3 positions are the same,${BOLD}
${LTYLLW}                  Owner              Owning Group        All Others (World)
Position-${LTCYN}  ─────  ─────  ─────    ─────  ─────  ─────    ─────  ─────  ─────${LTYLLW}
${ULINE}Value-     Read   Write  Execute  Read   Write  Execute  Read   Write  Execute${RESET}${NULINE}${LTYLLW}
A "${LTCYN}-${LTYLLW}" in the Value is "${LTCYN}0${LTYLLW}" or None${LTCYN}
    r = Read     Value = 4
    w = Write    Value = 2
    x = Execute  Value = 1
    - = None     Value = 0${LTYLLW}
So:${LTCYN}
    rwx = 111 in binary = 7${LTYLLW} (4+2+1)${LTCYN}
    rw- = 110 in binary = 6${LTYLLW} (4+2+0)${LTCYN}
    r-x = 101 in binary = 5${LTYLLW} (4+0+1)${LTCYN}
    r-- = 100 in binary = 4${LTYLLW} (4+0+0)${RESET}
EOT
}
#
third_run () {
    echo -e "${BOLD}${LTCYN}Press any key to continue, '${LTYLLW}q${LTCYN}' Quits/Exits...${RESET}"
    read -r -n 1 -s anykey
    [[ $anykey = "q" ]] && exit 0 || third_set
}
third_set () {
    cat <<EOT
${LTYLLW}
Using the "${SOMODE}stat${NSOMODE}" command to see properties of a file-${LTGRN}
> stat ~/Directory1/${LTCYN}
  File: /home/user/Directory1/
  Size: 4096      	Blocks: 8          IO Block: 4096   directory
Device: fe05h/65029d	Inode: 13384080    Links: 2
Access: (0755/drwxr-xr-x)  Uid: ( 1000/     user)   Gid: (  100/   users)
Access: 2018-11-17 08:30:24.984393675 -0600
Modify: 2018-11-17 08:28:59.322223499 -0600
Change: 2018-11-17 08:28:59.322223499 -0600
 Birth: -${LTGRN}
> stat ~/Directory1/file1${LTCYN}
  File: /home/user/Directory1/file1
  Size: 0         	Blocks: 0          IO Block: 4096   regular empty file
Device: fe05h/65029d	Inode: 13384081    Links: 1
Access: (0644/-rw-r--r--)  Uid: ( 1000/     user)   Gid: (  100/   users)
Access: 2018-11-17 08:28:59.322223499 -0600
Modify: 2018-11-17 08:28:59.322223499 -0600
Change: 2018-11-17 08:28:59.322223499 -0600
 Birth: -${LTYLLW}
    Want to see more advanced use of the 'stat' command?...${RESET}
EOT
}
#
forth_run () {
    echo -e "${BOLD}${LTCYN}Press any key to continue, '${LTYLLW}q${LTCYN}' Quits/Exits...${RESET}"
    read -r -n 1 -s anykey
    [[ $anykey = "q" ]] && exit 0 || forth_set
}
forth_set () {
    cat <<EOT
${LTGRN}
> stat -c %A ~/Directory1/${LTCYN}
drwxr-xr-x${LTGRN}
> stat -c %a ~/Directory1/${LTCYN}
755${LTGRN}
> stat -c %A ~/Directory1/file1${LTCYN}
-rw-r--r--${LTGRN}
> stat -c %a ~/Directory1/file1${LTCYN}
644${LTGRN}
> stat -c %f ~/Directory1/${LTCYN}
41ed  <<<===${LTYLLW} HEX Value${LTGRN}
> printf "%o\n" 0x41ed${LTCYN}
40755  <<<===${LTYLLW} '4' means it is a directory${LTGRN}
> stat -c %f ~/Directory1/file1${LTCYN}
81a4  <<<===${LTYLLW} HEX Value${LTGRN}
> printf "%o\n" 0x81a4${LTCYN}
100644  <<<===${LTYLLW} '10' means it is a regular file
${RESET}
EOT
}
#
fith_run () {
    echo -e "${BOLD}${LTCYN}Press any key to continue, '${LTYLLW}q${LTCYN}' Quits/Exits...${RESET}"
    read -r -n 1 -s anykey
    [[ $anykey = "q" ]] && exit 0 || fith_set
}
fith_set () {
    cat <<EOT
${LTYLLW}
Changing permissions and ownership-${LTGRN}
> chown User:Group /path/to/file${LTCYN}  <<<===${LTYLLW} Will set the owning user to User and the owning group to Group
Or${LTGRN}
> chown User: /path/to/file ${LTCYN}      <<<===${LTYLLW} Will use the User's primary group by default${LTGRN}
> chown -R User: /path/to/file${LTCYN}    <<<===${LTYLLW} Same, Recursively, sub-files/directories as well (CAPITAL "R")${LTGRN}
> chmod 755 /path/to/file${LTCYN}         <<<=== ${LTYLLW}Will set to rwxr-xr-x (can also use the "${LTGRN}-R${LTYLLW}" here for Recursive)${LTYLLW}
Can also use 0perators '+' and '-' with u, a, g, o and r, w, x,
    [${LTCYN}u = User${LTYLLW}] [${LTCYN}a = All${LTYLLW}] [${LTCYN}g = Group${LTYLLW}] [${LTCYN}o = Other${LTYLLW}]${LTGRN}
> chmod +x /path/to/file ${LTCYN}         <<<=== ${LTYLLW}Make the file Executable for current user (can also use the "${LTGRN}-R${LTYLLW}" here)${LTGRN}
> chmod a+x /path/to/file ${LTCYN}        <<<=== ${LTYLLW}Make the file Executable for ${LTCYN}a${LTYLLW}ll users, replace ${LTCYN}a${LTYLLW} with ${LTCYN}u${LTYLLW}ser (default), ${LTCYN}g${LTYLLW}roup, etc.... can also use the "${LTGRN}-R${LTYLLW}" here)
${RESET}
EOT
}
#
sixth_run () {
    echo -e "${BOLD}${LTCYN}Press any key to continue, '${LTYLLW}q${LTCYN}' Quits/Exits...${RESET}"
    read -r -n 1 -s anykey
    [[ $anykey = "q" ]] && exit 0 || sixth_set
}
sixth_set () {
    cat <<EOT
${LTYLLW}
Further reading,
See the '${LTCYN}sftp${LTYLLW}' Option for mainipulating owner/group for special circumstances like this:${LTGRN}
# ls -l /sftp/chroot/home/${LTCYN}
drwxr-xr-x 10 root sftponly 4096 Mar 16 12:15 sftpuser${LTYLLW}

See "${LTCYN}acls${LTYLLW}" from Options menu for allowing multiple sets of permissions${LTBLU}

https://www.theurbanpenguin.com/read-linux-file-permissions/?fbclid=IwAR01p8LDQx-GUa_Sn5RfVptTIKR9xhHD1NQaKrKcgaal5jdERb7CKJmLoQo
${RESET}
EOT
}
#
#################################################
####    SOP, Standard Operating Procedure    ####
#################################################
#
###########################################
####    Declare Functions
###########################################
#
start_syn () {
    cat <<EOT
${BOLD}${YLLW}
Synopsis${RESET}${LTCYN}
  The purpose of this document is to establish a "${BOLD}${YLLW}SOP${RESET}${LTCYN}" (${BOLD}${YLLW}S${RESET}${LTCYN}tandard ${BOLD}${YLLW}O${RESET}${LTCYN}perating ${BOLD}${YLLW}P${RESET}${LTCYN}rocedure) for creating and modifying code.
  The standards outlined here are to establish effective, efficient, common, readable, trackable, and accountable code-writing methodologies so that all code written by any member can be read, understood, and explained by any other member.
  The content here is not only to establish the SOP, but, also to create and/or follow known Best Practices, including but not limited to, ${BOLD}${YLLW}PEP8${RESET}${LTCYN} (see Resources).
  The reason for creating the SOP is to standardize all code written so that it can be efficiently read, understood, modified, and communicated without the need for either excessive time spent deciphering, or re-writing a new code ('re-inventing the wheel').
${RESET}
EOT
nextset=start_scp
next_set
}
start_scp () {
    cat <<EOT
${BOLD}${YLLW}
Scope${RESET}${LTCYN}
  This SOP should be implemented team-wide and was originally intended for BASH scripting, but, is hoped to be applicable to all code written.${BOLD}${YLLW}
  Must-Haves-${RESET}${LTCYN}
    Valid use-case and need
    Clear known objectives
    Outline- Including Objectives, Milestones, Test criteria, and completion state (Desired End Results). This should be documented in the header of the code itself.
    Stated possibility/s of risk/s and safegards for such.
    Structure, order, and comments, for easy reading, understanding, and standardization.${BOLD}${YLLW}
  Nice-To-Haves-${RESET}${LTCYN}
    Option/Parameter in calling the code/script, to print the objective outlined in the 'Must-Haves'.
    Some method of logging it's actions.
    "Script-Template" - As a team we should create, agree, and use a standardized script-template.
${RESET}
EOT
nextset=start_gens 
next_set
}
start_gens () {
    cat <<EOT
${BOLD}${YLLW}
General Standards${RESET}${LTCYN}
  Use the "${BOLD}${YLLW}DRY${RESET}${LTCYN}" (${BOLD}${YLLW}D${RESET}${LTCYN}on't ${BOLD}${YLLW}R${RESET}${LTCYN}epeat ${BOLD}${YLLW}Y${RESET}${LTCYN}ourself) principle, which states that you should ${BOLD}${YLLW}NEVER${RESET}${LTCYN} repeat the same piece of code more than once in the same script/app.
  Make it OS/Release agnostic.
  Make it Portable- Environment, Network, and Infrastucture agnostic.
  Make it scaleable, allow for growth.
  Make it adaptable- Able to adjust with changed/better/new tools, methods, paths, etc. for anything that can/may change.
  Always use variables where common, multiple calls, or complex commands/strings are needed.
  For code that requires arguements/parameters passed on the command line-
    A help/usage statement option printing a menu.
      Standard- A conditional (Arithmatic) Expression check for the correct number of arguements passed and will print the usage message if '-ne'.
        ${BOLD}${ULINE}${YLLW}Example${NULINE}${RESET}${LTCYN}- [[ ! \$1 || \$# -ne 1 ]] && { usage; echo "'\$@' Not a valid option"; exit 1; }
      Use inside a function- ${BOLD}${YLLW}EXAMPLE${RESET}${LTCYN}-
        usage () {
            cat <<EOT
          Usages and Options
          EOT
        }
${RESET}
EOT
nextset=start_scom 
next_set
}
start_proc () {
    cat <<EOT
${BOLD}${YLLW}
Process${RESET}${LTCYN}
  1. Evaluate the conditions
  2. Take action/s
  3. Carry out task/s
  4. Clean up and close
${RESET}
EOT
}
start_scom () {
    cat <<EOT
${BOLD}${YLLW}
Standards${LTCYN}
  Comments-${RESET}${LTCYN}
    Use comments for all sections, sub-sections, functions, and complex commands.
    Good comments explain 'why', not just how what is being done.
${RESET}
EOT
nextset=start_slog 
next_set
}
start_slog () {
    cat <<EOT
${BOLD}${YLLW}
Standards${LTCYN}
  Logging-${RESET}${LTCYN}
    Logging should include all stdin and stderr output.
    Logging for on-going and/or sceduled runs should be "self-rotating", based on size, using compression, and the archives rotated by date or number of archives,
    Date-Time-Stamps for logs should be structured for ease of debugging, eg. "${YLLW}2018_07_23-14:32:29${LTCYN}"
${RESET}
EOT
nextset=start_sind 
next_set
}
start_sind () {
    cat <<EOT
${BOLD}${YLLW}
Standards${LTCYN}
  Indenting-${RESET}${LTCYN}
    It is recommended to use 4 SPACES for indentation, instead of TABS, however, whatever you do,${BOLD}${YLLW} BE CONSISTANT! Do NOT mix TABS and SPACES, use ONLY one of the following:${RESET}${LTCYN}
      2 SPACES
      4 SPACES
      8 SPACES
      TABS (last choice)
${RESET}
EOT
nextset=start_svar 
next_set
}
start_svar () {
    cat <<EOT
${BOLD}${YLLW}
Standards${LTCYN}
  Variables-${RESET}${LTCYN}
    It is recommended to use only lowercase for variables, as all SYSTEM variables are in UPPERCASE, however, you can ONLY use letters, numbers, and underscores for declaring variables.
    Never combine UPPER and lower case, use one OR the other.
    As with "Indenting", whatever you do,${BOLD}${YLLW} BE CONSISTANT!${RESET}${LTCYN}
    There are different methods of calling variables, they each have their purpose, know (or learn) those differences and purposes. Example-
      [[ \$HOME vs \${HOME} vs \$(home) ]] 
      See the various sub-sections under http://wiki.bash-hackers.org/syntax/expansion/
    Remember that variables contained within a funfion are limited to that function and are not available to the rest of the script, so declare global variables outside of functions where possible.
    Always declare global variables at the top-most part of the code.
    Always variable-ize the arguments passed on the cli, eg. "OPT_1=\$1", "PARAM_1=\$2", etc.
${RESET}
EOT
nextset=start_sif 
next_set
}
start_sif () {
    cat <<EOT
${BOLD}${YLLW}
Standards${LTCYN}
  IF statements-${RESET}${LTCYN}
    Use 'elif' statements instead of nested if-statements where possible.
    Use the Conditional structure where possible- Example-
      [[ -e \${HOME}/.ssh ]] || { echo "No .ssh directory in \${HOME}"; exit 1; }
    Always use exit statements
${RESET}
EOT
nextset=start_sloop 
next_set
}
start_sloop () {
    cat <<EOT
${BOLD}${YLLW}
Standards${LTCYN}
  Loops (for, while, until)${RESET}${LTCYN}
    Not started
${RESET}
EOT
nextset=start_sop 
next_set
}
#
start_sop () {
    cat <<EOT
${BOLD}${YLLW}
    ${ULINE}Objective${NULINE}- Effective Code Writing and Execution${RESET}${YLLW}
  The Team${BOLD} SOP${RESET}${YLLW}, ${BOLD}S${RESET}${YLLW}tandard ${BOLD}O${RESET}${YLLW}perating ${BOLD}P${RESET}${YLLW}rocedure, is comprised of many facets, 
    this record is comprised of the following options:${BOLD}${YLLW}
  [1]${LTCYN}    Synopsis${YLLW}
  [2]${LTCYN}    Scope${YLLW}
  [3]${LTCYN}    Geneal Standards${YLLW}
  [4]${LTCYN}    Standards- Comments${YLLW}
  [5]${LTCYN}        ├───── Logging${YLLW}
  [6]${LTCYN}        ├───── Indenting${YLLW}
  [7]${LTCYN}        ├───── Variables${YLLW}
  [8]${LTCYN}        ├───── If Statements${YLLW}
  [9]${LTCYN}        └───── Loops- for, while, until${YLLW}
  [q]${LTCYN}    Quit/Exit${RESET}
EOT
nextset=start_syn
next_set
}
next_set () {
#
echo -e "${BOLD}${LTCYN}Press any key to continue, Or select an option... 'q' Quits${RESET}"
read -n 1 -s anykey
[[ $anykey = "q" ]] &&  exit 0
[[ $anykey != [0-9] ]] && $nextset || new_choice
}
new_choice () {
#read -p "Please select an option...
#" mychoice
#mychoice=$anykey
case $anykey in
    1)
        clear
	start_syn
    ;;
    2)
        clear
        start_scp
    ;;
    3)
        clear
        start_gens
    ;;
    4)
        clear
        start_scom
    ;;
    5)
        clear
        start_slog
    ;;
    6)
        clear
        start_sind
    ;;
    7)
        clear
        start_svar
    ;;
    8)
        clear
        start_sif
    ;;
    9)
        clear
        start_sloop
    ;;
    q)
        exit 0
    ;;
    *)
        echo "invalid option, exiting..."
        exit 1
    ;;
esac
}
#
##    Logging [snippet]
##    Author: Shawn Miller
##    Date: 26 October 2018
#
#######################
####    Logging    ####
#######################
#
#
logs_snip () {
clear
    cat <<EOT
${BOLD}${YLLW}
    ${ULINE}  Logging Scripts Actions and Results  ${NULINE}${RESET}${LTYLLW}
    In all automation scripts, and most any other scripts, there is some level of
  logging that is needed and sometimes required.

    This tip is designed to setup a standardized logging structure that with minimal
  editing can be simply inserted into any script and logging is setup (except for need
  to direct your script's action to the log file).
${BOLD}
    This tip's example structure:${RESET}${LTCYN}
  Log file location${LTYLLW}            =>${LTGRN} /tmp/<scriptname>-logs/<scriptname>.log (default)${LTCYN}
  Log size max before rotation${LTYLLW} =>${LTGRN} 10 units of 1024 bytes (default)${LTCYN}
  Log compression type${LTYLLW}         =>${LTGRN} gzip${LTCYN}
  Number of Archives to retain${LTYLLW} =>${LTGRN} 5 (default)${LTCYN}
  Archive file name${LTYLLW}            =>${LTGRN} <scriptname>.log-<YYYY-MM-DD_HH-MM-SS>.tar.gz${LTYLLW}

    Press any key to see the Main logic and Variable structure for a script...
${RESET}
EOT
echo -e "${BOLD}${LTYLLW}Press any key to continue... '${LTCYN}q${LTYLLW}' Quits${RESET}"
read -n 1 -s anykey
[[ $anykey = "q" ]] &&  { echo ""; exit 0; } || main_log
}
main_log () {
    cat <<EOT
####    Main logic and Variable structure${LTYLLW}
    The following can be directly input into a script, edit the 3 'Mutable Variables'
  if needed, and you're ready to go.${RESET}${LTCYN}
####    Mutable Variables (Adjust these to need)${LTGRN}
declare -i tarkeep=5
declare -i tarsize=10
logloc=/tmp${LTCYN}
####    Non-Mutable Variables (Be carful changing any values here)${LTGRN}
PROGNAME=\$(basename \$0)
ldate="\$(date +%Y-%m-%d_%H-%M-%S)"
logdesc=\${PROGNAME}
logfil=\${logdesc}.log
logdir=\${logloc}/\${logdesc}-logs
[[ -d \${logdir} ]] || mkdir \${logdir}
scriptlog=\${logdir}/\${logfil}
[[ -e \${scriptlog} ]] || touch \${scriptlog}
tarmax=\$(du -s \${scriptlog} | awk '{print \$1}')
tarname=\${logfil}-\${ldate}.tar.gz
declare -i tarcount=\$(ls \${logdir}/\${logfil}-* | wc -l)
[[ \${tarmax} -ge \${tarsize} ]] && tardo=true || tardo=false
taroldst=\$(ls -1rt \${scriptlog}-* | head -n 1)
${RESET}
EOT
echo -e "${BOLD}${LTYLLW}Press any key to continue... '${LTCYN}q${LTYLLW}' Quits${RESET}"
read -n 1 -s anykey
[[ $anykey = "q" ]] &&  { echo ""; exit 0; } || exec_rot
}
exec_rot () {
    cat <<EOT
${LTYLLW}
    You will need to redirect all output to the logfile throughout the script.
    The following section is easily added to perform cleanup and rotation of 
  the logs generated...${LTCYN}
#
####    Execution & Rotation
#${LTGRN}
if \${tardo}; then
    tar -czvf \${logdir}/\${tarname} -C \${logdir}/ \${logfil}
    > \${scriptlog}
fi
while [[ \${tarcount} -ge \${tarkeep} ]]; do
    rm -f \${taroldst}
done${LTCYN}
#${LTYLLW}
    To send ALL- stdin, stdout, & stderr to syslog, put these 2 lines at the top of 
  the script, just under the shebang/hashbang${LTGRN}
exec 1> >(exec logger -s -t \${0##*/}) 2>&1
set -x
${RESET}
EOT
}
#
logo_snip () {
    cat <<EOT

  🦎${BOLD}${LTMAG}            C4${RESET}${LTYLLW}
  ▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂
  ▉${BOLD}${LTBLU}    ✡✝${RESET} 󾓦 ${LTYLLW}     █
  ▉${LTGRN}   𝐀 𝐑 𝐌 𝐘${LTYLLW}    █
  ▉${BOLD}${LTCYN} 𝐑 𝐀 𝐍 𝐆 𝐄 𝐑${RESET}${LTYLLW}  █
  ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀${BOLD}${LTMAG}
  C4${RESET}             🦎
${RESET}
EOT
}
#
###########################################
###    END OF DEFINE FUNCTIONS
###########################################
#
###########################################
####    Run script & exit
###########################################
#
###########################################
### Define Execution
###########################################
#
case $MYOPT in
    "help")
        #show_objective
        #sleep 5
        clear
	show_opts # | less
        exit 0
    ;;
    "sobj")
        clear
	show_objective
        exit 0
    ;;
    "gpli")
        clear
	gpl_info
        exit 0
    ;;
    "meta")
        rem_meta
        exit $?
    ;;
    "meta-info")
        meta_info
        exit $?
    ;;
    "expr")
        def_expres
        exit $?
    ;;
    "lvmn")
        lvm_notes
        exit $?
    ;;
    "pend")
        add_prefix
        exit $?
    ;;
    "tool")
        use_tools
        exit $?
    ;;
    "umnt")
        mon_troub
        exit $?
    ;;
    "emty")
        rem_emty
        exit $?
    ;;
    "vims")
        vim_cmds
        exit $?
    ;;
    "susr")
        make_users
        exit $?
    ;;
    "sftp")
        set_chroot
        exit $?
    ;;
    "vers")
        printf "${LTCYN} This Version/Revision of ${PROGNAME} is ${PROGVERS} released on ${PROGDATE} ${RESET}\n"
        exit $?
    ;;
    "tabs")
        rep_tabs
        exit $?
    ;;
    "tabs-info")
        tabs_info
        exit $?
    ;;
    "seds")
        sed_cmds
        exit $?
    ;;
    "seds-info")
        seds_info
        exit $?
    ;;
    "pep8")
        clear
        pep_eight
        exit $?
    ;;
    "pep8-info")
        clear
        pep8_info
        exit $?
    ;;
    "irsi")
        clear
        irsi_tips
        exit $?
    ;;
    "cust")
        clear
        cust_tips
        exit $?
    ;;
    "gtbr")
        clear
        git_branch
        exit $?
    ;;
    "link")
        clear
        my_links
        exit $?
    ;;
    "gitl")
        clear
        git_lab
        exit $?
    ;;
    "gtal")
        clear
        git_alias
        exit $?
    ;;
    "read")
        clear
        user_input
        exit $?
    ;;
    "date")
        clear
        custom_date
        exit $?
    ;;
    "type")
        clear
        chk_cmd
        exit $?
    ;;
    "cows")
        clear
        for_cows
        exit $?
    ;;
    "cows-info")
        clear
        cows_info
        exit $?
    ;;
    "colr")
        clear
        add_color
        exit $?
    ;;
    "colr-info")
        clear
        colr_info
        exit $?
    ;;
    "rpmb")
        clear
        rpmdoc_run
    ;;
    "tars")
        clear
        cmmd_tar
    ;;
    "math")
        clear
        smpl_math
    ;;
    "snip")
        clear
        vism
    ;;
    "perm")
        clear
        perm_snip
        secnd_run
        third_run
        forth_run
        fith_run
        sixth_run
    ;;
    "desc")
        clear
        desc_show
    ;;
    "sopb")
        clear
        start_sop
    ;;
    "logs")
        clear
        logs_snip
        exit $?
    ;;
    "logo")
        clear
        logo_snip
        exit $?
    ;;
    *)
        clear
	show_objective
        show_opts
        exit $?
        ;;
esac
exit $?
# Next steps
#   ChangeLog
#@CLN Need to fix the '%u' in the sftp option
#   FIXED it with
#   PASSP=`echo '/sftp/chroot/home/%' | sed -e 's/$/u/' `
#   Chrootdirectory$RESET $PASSP
#     
#   Added a Objective section
#   Added mon_troub [umnt] optio for monitoring an issue witn nmon
#   Added a Information section- append option with -info to get full description- not all have yet, only 'meta'
#     Added read option for variablizing user input and promote to 02 & Latest
#     Added date option for Using custom date command in scripts and/or cli, merging branch and ptomoting to Latest
#
#  Added import/create repos to gitlab setup- promote to 05
#    Added type option for type cmd - promote to 06
#
#  Added config --global to gtal
#
#    Change- "0.0.2-01" 01 Sep 2018
#      Total re-write of all functions to use 'cat <<EOT message EOT'
#      removing the need to work-around fixes above
#      added check for arg and error-exit
#      All tested and working, quickly
#    Change- "0.0.2-02" 02 Sep 2018
#      Fixed typo in Version number
#      Variablized the Arg
#    Change- '0.0.2-03' 02 Sep 2018- Added Color to ALL expr output
#    Change- '0.0.2-04' 15 Sep 2018- 
#      cleanup for rpmbuild
#    Change- '0.0.2-05' 15 Sep 2018- 
#      Added RPM-Build
#    Change- '0.0.2-06' 17 Sep 2018- 
#      Added Note on spec-file in useful
#      Fixed syntax mistake in the "Usage" output
#      Fixed allignment mistake in the "Usage" output
#      Cleaned up structure of entire "Usage"... MUCH cleaner output
#    Change- '0.0.2-07' to '0.0.2-09' 18 Sep 2018 - 26 Sep 2018
#      Added Enter/Exit standout mode
#      Added tars and math
#      Added colr-info
#    Change- '0.0.2-10' 29 Sep 2018- 
#      Added 'nocolor' 2nd arg
#      - Added 'Snippets' Map and Insert [27 Oct 2018]
#      - Modified- Discovered I had wrong date/year in the GPL and Author section (2018 => 2017)
#    Change- '0.0.2-11' 27 Oct 2018-17 Nov 2018 
#      Added GNU/GPL Info [gpli] to Options
#      Added [perm] option for file permissions
#    Change- '0.0.2-12' 17 Nov 2018-
#      Modified- minor color and structure of perm - 18 Nov 2018-
#      Modified- Major change to perm- added 'anykey' options for readability
#      Promoting to Latest_Stable - 18 Nov 2018-
#    Change- '0.0.2-13' 18 Nov 2018-
#      Added a desc option for Description and Collaboration
#      Added [sopb] for SOP bash coding
#      Found a typo in perm, changed "Uer's" to "User's"
#      Modified color enhancement to perm
#      Added [logs] for Logging/rotating - 23 Dec 2018
#      Promoting to Latest_Stable - 23 Dec 2018
#    Change- '0.0.2-14' 23 Dec 2018-
#      Added [logo] for My C4 Logo with ascii characters
#      Modified 'read' with better logic, included 'sourcing' in the help description
#      Modified 'read' to be separated into parts, using the 'anykey' option
#    Change- '0.0.2-15' 30 Mar 2019-
#      Fixed 'date' for logging, missing % and a %S
#      
#      
#  Next - add shc building binary from script- add https://www.thegeekstuff.com/2012/05/encrypt-bash-shell-script/
#  Next - add 'loop' to describe while, until, and for loops, nesting, and arithmetic expressions
#  
#      
#
#
#
