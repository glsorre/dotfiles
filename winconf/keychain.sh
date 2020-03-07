#!/bin/bash
SSH_ASKPASS_SCRIPT=/tmp/ssh-askpass-script
cat > ${SSH_ASKPASS_SCRIPT} <<EOL
#!/bin/bash
echo "$1"
EOL
chmod u+x ${SSH_ASKPASS_SCRIPT}
export DISPLAY="0"
export SSH_ASKPASS=${SSH_ASKPASS_SCRIPT}
/usr/bin/keychain --clear id_rsa
rm ${SSH_ASKPASS_SCRIPT}