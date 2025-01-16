#!/bin/bash

USER_UID=${HOST_UID}
USER_GID=${HOST_GID}

# user config
groupadd ${HOST_USER} --gid ${USER_GID} > /dev/null 2>&1
useradd ${HOST_USER} --shell /bin/bash --create-home \
	--uid ${USER_UID} --gid ${USER_GID} > /dev/null 2>&1

# sudoer config
echo 'ALL ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers

# kvm config
groupadd --system kvm > /dev/null 2>&1
gpasswd -a ${HOST_USER} kvm > /dev/null 2>&1
chown root:kvm /dev/kvm > /dev/null 2>&1
chmod 0660 /dev/kvm > /dev/null 2>&1

# switch to current user
su "${HOST_USER}"
