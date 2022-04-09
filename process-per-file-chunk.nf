#!/usr/bin/env nextflow

Channel
    .fromPath( "data/*.txt", checkIfExists: true )
    .splitText( by: 5 )
    .set { ch_file_chunks }

process processPoem {

    echo true

    input:
    file(chunk) from ch_file_chunks

    script:
    """
    rev ${chunk}
    """

}