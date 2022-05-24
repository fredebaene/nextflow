#!/usr/bin/env nextflow

/*
================================================================================
AIM : Split a file into chunks of n lines and execute a task for each chunk.
================================================================================
*/

// Create a channel emitting file chunks consisting of 5 lines each
Channel
    .fromPath( "data/poem.txt", checkIfExists: true )
    .splitText( by: 5 )
    .set { ch_file_chunks }

process handlePoemChunks {

    echo true

    input:
    file(chunk) from ch_file_chunks

    script:
    """
    rev ${chunk}
    """

}