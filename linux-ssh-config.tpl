cat << EOF >> ~/.ssh/config

# Add SSH configuration for the specified host
Host ${hostname}
    HostName ${hostname}           # Set the hostname for the SSH connection
    User ${user}                   # Specify the SSH username
    IdentityFile ${identityfile}   # Specify the path to the private key file
EOF
