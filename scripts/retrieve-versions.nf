!/usr/bin/env nextflow

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