FROM linuxbrew/brew

RUN brew tap aws/tap; \
brew install awscli aws-sam-cli

RUN	useradd -m -s /bin/bash samcli \
	&& echo 'samcli ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers

USER samcli

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
