FROM edoburu/pgbouncer:1.11.0
COPY pgbouncer.ini userlist.txt /etc/pgbouncer/

USER postgres
EXPOSE 15432

ARG BUILD_VERSION
ENV BUILD_VERSION $BUILD_VERSION

#컨테이너에서 실행될 명령을 지정
# CMD ["npm", "start"]\
ENTRYPOINT ["node", "./bin/www"]