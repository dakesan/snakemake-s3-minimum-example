# Snakemake s3 minimum example

This is a minimal Snakemake workflow example using s3-storage plugin.

## Install plugins

First you need to install dependencies.

```sh
mamba create -n snakemake snakemake
mamba activate snakemake
pip install snakemake-storage-plugin-s3
```

## Run

```sh
snakemake --cores 1
```

## License

MIT

## Credits

Hiro Odake (2024)