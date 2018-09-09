    Objective- Effective Code Writing and Execution

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

General Standards
  Use the "DRY" (Don't Repeat Yourself) principle, which states that you should NEVER repeat the same piece of code more than once in the same script/app.
  Make it OS/Release agnostic.
  Make it Portable- Environment, Network, and Infrastucture agnostic.
  Make it scaleable, allow for growth.
  Make it adaptable- Able to adjust with changed/better/new tools, methods, paths, etc. for anything that can/may change.
  Always use variables where common, multiple calls, or complex commands/strings are needed.
  For code that requires arguements/parameters passed on the command line-
    A help/usage statement option printing a menu.
      Standard- A conditional (Arithmatic) Expression check for the correct number of arguements passed and will print the usage message if '-ne'.
        Example- [[ ! $1 || $# -ne 1 ]] && { usage; echo "'$@' Not a valid option"; exit 1; }
      Use inside a function- EXAMPLE-
        usage () {
            cat <<EOT
          Usages and Oprions
          EOT
        }

Process
  1. Evaluate the conditions
  2. Take action/s
  3. Carry out task/s
  4. Clean up and close

Standards
  Comments-
    Use comments for all sections, sub-sections, functions, and complex commands.
    Good comments explain 'why', not just how what is being done.
  Logging-
    Logging should include all stdin and stderr output.
    Logging for on-going and/or sceduled runs should be "self-rotating", based on size, using compression, and the archives rotated by date or number of archives,
    Date-Time-Stamps for logs should be structured for ease of debugging, eg. "2018_07_23-14:32:29"
  Indenting-
    It is recommended to use 4 SPACES for indentation, instead of TABS, however, whatever you do, BE CONSISTANT! Do NOT mix TABS and SPACES, use ONLY one of the following:
      2 SPACES
      4 SPACES
      8 SPACES
      TABS (last choice)
  Variables-
    It is recommended to use only lowercase for variables, as all SYSTEM variables are in UPPERCASE, however, you can ONLY use letters, numbers, and underscores for declaring variables.
    Never combine UPPER and lower case, use one OR the other.
    As with "Indenting", whatever you do, BE CONSISTANT!
    There are different methods of calling variables, they each have their purpose, know (or learn) those differences and purposes. Example-
      [[ $HOME vs ${HOME} vs $(home) ]] 
      See the various sub-sections under http://wiki.bash-hackers.org/syntax/expansion/
    Remember that variables contained within a funfion are limited to that function and are not available to the rest of the script, so declare global variables outside of functions where possible.
    Always declare global variables at the top-most part of the code.
    Always variable-ize the arguments passed on the cli, eg. "OPT_1=$1", "PARAM_1=$2", etc.
  IF statements-
    Use 'elif' statements instead of nested if-statements where possible.
    Use the Conditional structure where possible- Example-
      [[ -e ${HOME}/.ssh ]] || { echo "No .ssh directory in ${HOME}"; exit 1; }
    Always use exit statements
  Loops (for, while, until)
