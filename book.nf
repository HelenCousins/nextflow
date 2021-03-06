#!/usr/bin/env nextflow


params.list = '/home/list'
myFile = file(params.list)
allLines  = myFile.readLines()


process get {
    container = 'hc7docker/nextflowirods'


    input:
    val a from allLines

    output:
    file "${a}" into pages

   script:
    """
    iget $a -f
    """
}


process copyme {
    container = 'hc7docker/nextflowirods'

    input:
    file myfile from pages

    script:
    """
    cat $myfile >> /home/ubuntu/book
    """
}

