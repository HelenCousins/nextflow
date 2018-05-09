#!/usr/bin/env nextflow

thing = Channel.from( 'page1', 'page2' )

process get {
    container = 'hc7docker/test'


    input:
    val thing

    script:
    """
    cd /home/ubuntu
    /docker-entrypoint.sh
    ils > listme
    iget $thing
    """
}

