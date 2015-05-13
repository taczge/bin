#!/bin/bash

git_trial_cmd="git remote"
svn_trial_cmd="svn info"

git_log_cmd="git log --oneline"
svn_log_cmd="svn log"

cms_log_cmd=

if eval $git_trial_cmd > /dev/null 2>&1; then
    cms_log_cmd=$git_log_cmd
elif eval $svn_trial_cmd > /dev/null 2>&1; then
    cms_log_cmd=$svn_log_cmd
else
    echo "faital: Not a git/svn repository." 1>&2
    exit 1
fi

line=$($cms_log_cmd $@ | peco)

#awk_cmd_for_git="awk -F \  '{ print $1; }'"
#awk_cmd_for_svn="awk -F \ \|\  '{ print $1; }')"

if ! $(echo $line | grep '^r.* | ' > /dev/null 2>&1 ); then
    echo "faital: Selected line does not contain revision number." 1>&2
    exit 1
fi

echo "$(echo $line | awk -F \ \|\  '{ print $1; }')"
