let _ =
  Sys.command (Format.sprintf "cp vendor/result/`ocaml vendor/result/which_result.ml %s` vendor/result/result.ml" Sys.ocaml_version)

let build_bytecode () =
  print_endline "ocamlc -c vendor/result/result.ml";
  print_endline "ocamlc -I vendor/cmdliner/src -I vendor/result unix.cma -o opam-depext `ocamldep -sort vendor/cmdliner/src/*.ml*` depext.ml"

let build_native () =
  print_endline "ocamlopt -c vendor/result/result.ml";
  print_endline "ocamlopt -I vendor/cmdliner/src -I vendor/result unix.cmxa -o opam-depext `ocamldep -sort vendor/cmdliner/src/*.ml*` depext.ml"

let usage () =
  Printf.eprintf "Usage: ocaml build.ml [byte|native]\n\nDefaults to 'native' build.\n%!";
  exit 1

let _ =
  match Sys.argv with
  | [| _; "byte" |] -> build_bytecode ()
  | [| _; "native" |] | [| _ |] -> build_native ()
  | _ -> usage ()
