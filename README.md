Splint-UI
=========

The generate_batch is a script written by perl to generate a batch which to parse all the *.c/*.h files under a directory.

* Make sure that you have [Perl](http://www.perl.org/) installed.


<pre><code>USAGE
       perl generate_batch.pl \<dir\> \<options\>
OPTIONS
       \<dir\>
           Directory of source code to replace.
       \<options\>
           A file listing strings of the options for splint.exe
EXAMPLES
       perl generate_batch.pl c:\project\source\ -I"c:\project\source\inc"

generate_batch v1.0
</pre></code>

TODO
----
* Make a GUI to use Splint better easy.
