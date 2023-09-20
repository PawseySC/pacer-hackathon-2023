# Define the input samples as a list of sample indices

SAMPLES = ["00001", "00002", "00003"]
AWS_ENDPOINT_URL="https://projects.pawsey.org.au"
AWS_PROFILE="director2187"
from snakemake.remote.S3 import RemoteProvider as S3RemoteProvider
S3 = S3RemoteProvider(
    access_key_id="x", 
    secret_access_key="x", 
    host="https://projects.pawsey.org.au", 
    keep_local=True, 
    stay_on_remote=True)

outlist= expand("results/output_{sample_index}.txt", sample_index=SAMPLES)

# Create a list of all sample rules
rule all:
    input:
        outlist

# Define a function to generate S3 URLs for each sample
def s3_url(sample_index):
    return f"aws --endpoint-url=https://projects.pawsey.org.au --profile=director2187 s3 cp s3://pharokka/phage_contigs_batch{sample_index}.fasta -"


# Define a rule to run mega.py on each sample
rule run_ms3_to_pipe:
    params:
        lambda wildcards: s3_url(wildcards.sample_index)
    output:
        pipe("named_pipe{sample_index}.fasta")
    shell:
        """
        {params} > {output}
        """
    
rule named_pipe:
    input:
        "named_pipe{sample_index}.fasta"
    output:
        "results/output_{sample_index}.txt"
    shell:
        "cat {input} > {output}"
