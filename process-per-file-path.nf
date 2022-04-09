#!/usr/bin/env nextflow

Channel
    .fromPath( "data/*.fastq", checkIfExists: true )
    .set { ch_fastq_files }

process processEachFastqFile {

    tag "${fastq_file.simpleName}"
    publishDir path: "output", mode: "copy"

    input:
    file(fastq_file) from ch_fastq_files

    output:
    file("*") into ch_text_files

    script:
    """
    echo ${fastq_file.simpleName} > ${fastq_file.getSimpleName()}.txt
    """

}