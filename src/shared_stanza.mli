open Import

module Env : sig
  type config =
    { flags          : Ordered_set_lang.Unexpanded.t
    ; ocamlc_flags   : Ordered_set_lang.Unexpanded.t
    ; ocamlopt_flags : Ordered_set_lang.Unexpanded.t
    }

  type pattern =
    | Profile of string
    | Any

  type t =
    { loc   : Loc.t
    ; rules : (pattern * config) list
    }

  val t : t Sexp.Of_sexp.t
end

type Stanza.t +=
  | Env of Env.t
