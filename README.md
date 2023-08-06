# swc-paths-bug

`base` contians the main test project.
`tmp` contains some nested folders with a symlink to `base`.
`swc_out_*` contains the 'compiled' files of swc.
`build.bash` contains the commands which I ran for creating the outputs.

The output in `swc_out_real` `swc_out_sym` is correct because swc was not invoked at the root but at the correct project root (base).

The output in `swc_out` is not correct because invoked at real root. 
