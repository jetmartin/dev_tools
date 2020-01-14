#!/usr/bin/env bats

function setup() {
    bash
    cp /code/goto/goto.sh /usr/local/lib/goto/goto.sh
    cp /code/goto/path_aliases.sh /usr/local/lib/goto/path_aliases.sh
    chmod +x /usr/local/lib/goto/goto.sh
}

@test "Goto static folder name" {
    run goto tmp
    run pwd
    [ "$output" = "/tmp/" ]
}

@test "Goto dynamic folder name" {
    run goto home
    run pwd
    [ "$output" = "/usr/${whoami}/" ]
}

@test "Goto empty folder" {
    run goto
    [ "$output" = "\"\" is not a defined alias." ]
}

@test "Goto unexisting alias" {
    run goto any
    [ "$output" = "\"any\" is not a defined alias." ]
}

@test "Goto unexisting folder" {
    run goto gohst
    [ "$output" = "The folder /usr/gohst do not exist." ]
}