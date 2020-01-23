FROM ubuntu

LABEL version="1.0.0"

LABEL com.github.actions.name="CloudFormation Deploy Action"
LABEL com.github.actions.description="Deploy AWS CloudFormation Stack"
LABEL com.github.actions.icon="upload-cloud"
LABEL com.github.actions.color="orange"

LABEL repository="https://github.com/mgenteluci/cloudformation-deploy-action"
LABEL homepage="https://github.com/mgenteluci/cloudformation-deploy-action"
LABEL maintainer="Matheus Genteluci <mgenteluci97@gmail.com>"

RUN apt-get update && apt-get install -y awscli
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
RUN brew --version
RUN brew tap aws/tap
RUN brew install aws-sam-cli

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
