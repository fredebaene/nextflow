#!/usr/bin/env nextflow

/*
================================================================================
Retrieve Versions
--------------------------------------------------------------------------------
For each process, the version of the used software tool is piped into a text 
file. The name of the text file is structured as follows:

    <<software-tool>>_version.txt

This text file can be found in the work directory of the process itself. The 
last process, i.e., createVersionFile, will collect all of the text files 
containing the versions of the used software tools and concatenate them into 
one text file.
================================================================================
*/

process createFastQCFiles {

    publishDir path: "${projectDir}", mode: "copy"

    output:
    file("*_version.txt") into ch_fastqc_version_file

    script:
    """
    fastqc --version > fastqc_version.txt
    """

}

process createMultiQCReport {

    publishDir path: "${projectDir}", mode: "copy"

    output:
    file("*_version.txt") into ch_multiqc_version_file

    script:
    """
    multiqc --version > multiqc_version.txt
    """

}

process createVersionFile {

    publishDir path: "${projectDir}", mode: "copy"

    input:
    file(fastqc_version_file) from ch_fastqc_version_file.collect().ifEmpty([])
    file(multiqc_version_file) from ch_multiqc_version_file.collect().ifEmpty([])

    output:
    file("version_file.txt") into ch_version_file

    script:
    """
    find . -name "*_version.txt" -exec cat {} > version_file.txt +
    """

}