import sys

def main(argv):
    if len(sys.argv) != 2:
        print("Usage: python3 convert_to_charcode.py <string_to_convert>")
        return

    string = sys.argv[1]
    js_code = string_to_fromcharcode(string)
    print(js_code)

def string_to_fromcharcode(string):
    return 'String.fromCharCode({})'.format(', '.join([str(ord(c)) for c in string]))

if __name__ == "__main__":
    main(sys.argv[1:])
