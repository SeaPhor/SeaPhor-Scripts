1. Objective Effective Code Writing and Execution

1. Synopsis
    1. The purpose of this document is to establish a "SOP" (Standard Operating Procedure) for creating and modifying code.
    1. The standards outlined here are to establish effective, efficient, common, readable, trackable, and accountable code-writing methodologies so that all code written by any member can be read, understood, and explained by any other member.
    1. The content here is not only to establish the SOP, but, also to create and/or follow known Best Practices, including but not limited to, PEP8 (see Resources).
    1. The reason for creating the SOP is to standardize all code written so that it can be efficiently read, understood, modified, and communicated without the need for either excessive time spent deciphering, or re-writing a new code ('re-inventing the wheel').

1. Scope
    This SOP should be implemented team-wide and was originally intended for BASH scripting, but, is hoped to be applicable to all code written.
    1. Must-Haves-
        1. Valid use-case and need
        1. Clear known objectives
        1. Outline- Including Objectives, Milestones, Test criteria, and completion state (Desired End Results). This should be documented in the header of the code itself.
        1. Stated possibility/s of risk/s and safegards for such.
        1. Structure, order, and comments, for easy reading, understanding, and standardization.
    1. Nice-To-Haves-
        1. Option/Parameter in calling the code/script, to print the objective outlined in the 'Must-Haves'.
        1. Some method of logging it's actions.
        1. "Script-Template" - As a team we should create, agree, and use a standardized script-template.

1. General Standards
    1. Use the "DRY" (Don't Repeat Yourself) principle, which states that you should NEVER repeat the same piece of code more than once in the same script/app.
    1. Make it OS/Release agnostic.
    1. Make it Portable- Environment, Network, and Infrastucture agnostic.
    1. Make it scaleable, allow for growth.
    1. Make it adaptable- Able to adjust with changed/better/new tools, methods, paths, etc. for anything that can/may change.
    1. Always use variables where common, multiple calls, or complex commands/strings are needed.
    1. For code that requires arguements/parameters passed on the command line-
        1. A help/usage statement option printing a menu.
            1. Standard- A conditional (Arithmatic) Expression check for the correct number of arguements passed and will print the usage message if '-ne'.
                Example- 
 -              ```[[ ! $1 || $# -ne 1 ]] && { usage; echo "'$@' Not a valid option"; exit 1; }```
 -               Use inside a function- EXAMPLE-
        ```usage () {
            cat <<EOT
          Usages and Oprions
          EOT
        }```

1. Process
    1. Evaluate the conditions
    1. Take action/s
    1. Carry out task/s
    1. Clean up and close

1. Standards
    1. Comments-
        1. Use comments for all sections, sub-sections, functions, and complex commands.
        1. Good comments explain 'why', not just how what is being done.
    1. Logging-
        1. Logging should include all stdin and stderr output.
        1. Logging for on-going and/or sceduled runs should be "self-rotating", based on size, using compression, and the archives rotated by date or number of archives,
        1. Date-Time-Stamps for logs should be structured for ease of debugging, eg. "2018_07_23-14:32:29"
    1. Indenting-
        1. It is recommended to use 4 SPACES for indentation, instead of TABS, however, whatever you do, BE CONSISTANT! Do NOT mix TABS and SPACES, use ONLY one of the following:
            1. 2 SPACES
            1. 4 SPACES
            1. 8 SPACES
            1. TABS (last choice)
    1. Variables-
        1. It is recommended to use only lowercase for variables, as all SYSTEM variables are in UPPERCASE, however, you can ONLY use letters, numbers, and underscores for declaring variables.
        1. Never combine UPPER and lower case, use one OR the other.
        1. As with "Indenting", whatever you do, BE CONSISTANT!
        1. There are different methods of calling variables, they each have their purpose, know (or learn) those differences and purposes. Example-     [[ $HOME vs ${HOME} vs $(home) ]] 
            1. See the various sub-sections under http://wiki.bash-hackers.org/syntax/expansion/
        1. Remember that variables contained within a funfion are limited to that function and are not available to the rest of the script, so declare global variables outside of functions where possible.
        1. Always declare global variables at the top-most part of the code.
        1. Always variable-ize the arguments passed on the cli, eg. "OPT_1=$1", "PARAM_1=$2", etc.
    1. IF statements-
        1. Use 'elif' statements instead of nested if-statements where possible.
        1. Use the Conditional structure where possible- Example
        -      [[ -e ${HOME}/.ssh ]] || { echo "No .ssh directory in ${HOME}"; exit 1; }
            1. Always use exit statements
    1. Loops (for, while, until)
