#!/usr/bin/env nextflow

params.list = '/home/list'
myFile = file(params.list)
allLines  = myFile.readLines()
process get {
    container = 'hc7docker/test'


    input:
    val a from allLines

    output:
    set val(a), (file('*_{1,2}.fastq')) into read_files_fastqc

    script:
    """
    /docker-entrypoint.sh
    iget "${a}_1.fastq"
    iget "${a}_2.fastq"
    """
}


process fastqc {

    container = 'ubuntu'

    input:
    file(reads) from read_files_fastqc


    script:
    """
    echo $reads >> /home/ubuntu/tup
    """
}

