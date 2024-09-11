import snakemake.io


configfile: "config.yaml"

storage: 
    provider="s3",
    max_requists_per_second=10,

S3_BUCKET = config["s3"]
FILES = config["files"]
IN_DIR = config["input_dir"]
OUT_DIR = config["output_dir"]


rule all:
    input:
        storage(
            expand(
                "s3://{s3bucket}/{outdir}/{files}-calc.txt",
                s3bucket=S3_BUCKET,
                outdir=OUT_DIR,
                files=FILES,
            )
        ),


rule step1:
    input:
        storage(f"s3://{S3_BUCKET}/{IN_DIR}/{{files}}"),
    output:
        "output-{files}",
    shell:
        "python src/parsefile.py {input} {output}"


rule step2:
    input:
        rules.step1.output,
    output:
        storage(f"s3://{S3_BUCKET}/{OUT_DIR}/{{files}}-calc.txt"),
    shell:
        "python src/parsefile.py {input} {output}"
