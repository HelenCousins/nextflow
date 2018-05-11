#!/usr/bin/env nextflow

thing = Channel.from( 'page1', 'page2' )

process get {
    container = 'hc7docker/test'


    input:
    val thing

    script:
    """
    myiinit.sh
    cd /home/ubuntu
    ils > listme
    iget $thing
    """
}

