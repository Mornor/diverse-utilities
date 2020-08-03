FROM bash:5

ARG temp_file_name

WORKDIR /tmp
COPY example.sh .

RUN touch $temp_file_name

CMD ["bash", "./example.sh"]