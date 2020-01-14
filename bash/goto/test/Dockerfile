# As the Github action rebuild image each time, no need of shared folder, you can copy files.
# docker run -v "$(pwd)/bash/goto:/code" dev_tools/bats:latest /code/test
# docker run /code/test

FROM bats/bats:latest

COPY ../goto.sh /usr/local/lib/goto/goto.sh
COPY ./path_aliases.sh /usr/local/lib/goto/path_aliases.sh
COPY ./tests.bats /code/tests.bats

RUN chmod +x /usr/local/lib/goto/goto.sh

# RUN ln -s /usr/local/lib/goto/goto.sh /usr/local/bin/goto

RUN touch ~/.bash_profile
RUN echo "alias goto='. /usr/local/lib/goto/goto.sh'" >> ~/.bash_profile
RUN source ~/.bash_profile

# Do not execute test, they will be run by CI.
# RUN bats /code/test