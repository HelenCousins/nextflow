#!/usr/bin/env nextflow

Channel
    .fromFilePairs( params.reads, size: 2)
    .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}" }
    .into { read_files_fastqc; read_files_trimming }


process fastqc {

    container = 'ubuntu'

    input:
    file(reads) from read_files_fastqc


    script:
    """
    cat $reads >> /home/tup
    """
}

