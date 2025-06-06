# FROM docker.n8n.io/n8nio/n8n
FROM n8nio/n8n

ARG PGPASSWORD
ARG PGHOST
ARG PGPORT
ARG PGDATABASE
ARG PGUSER

ARG USERNAME
ARG PASSWORD

ENV DB_TYPE=postgresdb
ENV DB_POSTGRESDB_DATABASE=$PGDATABASE
ENV DB_POSTGRESDB_HOST=$PGHOST
ENV DB_POSTGRESDB_PORT=$PGPORT
ENV DB_POSTGRESDB_USER=$PGUSER
ENV DB_POSTGRESDB_PASSWORD=$PGPASSWORD

ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=$USERNAME
ENV N8N_BASIC_AUTH_PASSWORD=$PASSWORD

ENV ENABLE_ALPINE_PRIVATE_NETWORKING=true

# RUN cd ~/.n8n/ && mkdir nodes && cd nodes && npm install @telepilotco/n8n-nodes-telepilot
# RUN chown node:node /home/node/.n8n
# USER node

RUN cd ~/.n8n/ && mkdir nodes && cd nodes && npm install @telepilotco/n8n-nodes-telepilot
RUN ls -la ~/.n8n/nodes/
# ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]

# CMD ["n8n", "start"]
