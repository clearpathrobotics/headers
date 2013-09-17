headers
=======

Easy script to apply license headers to source files. Set me up in ~/.headers like so:

    wget https://raw.github.com/mikepurvis/headers/master/setup.bash -O - | bash

Select headers to use:

    use_headers bsd

And then apply them to known filetypes in a list or tree:

    apply_headers file1 file2 file3
    apply_headers *  
    apply_headers --recursive

