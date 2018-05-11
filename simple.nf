#!/usr/bin/env nextflow

thing = Channel.from( 'page1', 'page2' )

process get {
    container = 'hc7docker/nextflowirods'


    input:
    val thing

    script:
    """
    cd /home/ubuntu
    ils > listme
    iget $thing
    """
}

