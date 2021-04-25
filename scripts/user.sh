#! /bin/bash

# Check user groups to choose which default user will be used
if [ "$(getent group | awk -F: '{printf "%s\n",$3}' | grep "$GROUP_ID")" != "$GROUP_ID" ] && [ "$(awk -F: '{printf "%s\n",$3}' /etc/passwd | grep "$USER_ID")" != "$USER_ID" ]; \
then
    addgroup -gid $GROUP_ID $USERNAME && adduser --disabled-password --no-create-home --gecos '' --uid $USER_ID --gid $GROUP_ID $USERNAME;
fi

