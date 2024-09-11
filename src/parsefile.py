import argparse
import os

# parsefile.py


def main():
    # Parse command-line arguments
    parser = argparse.ArgumentParser(description='Calculate the character count and file size of a text file, and output them to a TSV file.')
    parser.add_argument('input_path', type=str, help='Path to the input text file')
    parser.add_argument('output_path', type=str, help='Path to the output TSV file')
    args = parser.parse_args()

    # Calculate the character count and file size of the input file
    with open(args.input_path, 'r', encoding='utf-8') as file:
        content = file.read()
        char_count = len(content)
        file_size = os.path.getsize(args.input_path)

    # Output the results to a TSV file
    with open(args.output_path, 'w', encoding='utf-8') as tsv_file:
        tsv_file.write(f"Character Count\tFile Size\n")
        tsv_file.write(f"{char_count}\t{file_size}\n")

if __name__ == "__main__":
    main()
