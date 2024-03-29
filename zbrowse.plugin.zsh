# -*- mode: zsh; sh-indentation: 2; indent-tabs-mode: nil; sh-basic-offset: 2; -*-
# vim: ft=zsh sw=2 ts=2 et
#
# No plugin manager is needed to use this file. All that is needed is adding:
#   source {where-zbrowse-is}/zbrowse.plugin.zsh
#
# to ~/.zshrc.
#
# https://wiki.zshell.dev/community/zsh_plugin_standard#zero-handling
0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"

# https://wiki.zshell.dev/community/zsh_plugin_standard#standard-plugins-hash
typeset -gA Plugins
Plugins[ZBROWSE_REPO_DIR]="${0:h}"

if (( ZI[SOURCED] )); then
  Plugins[ZBROWSE_DATA]="${ZI[CONFIG_DIR]}/zbrowse"
  [[ -d $Plugins[ZBROWSE_DATA] ]] || command mkdir -p $Plugins[ZBROWSE_DATA]
else
  Plugins[ZBROWSE_DATA]="${XDG_DATA_HOME:-$HOME/.local/share}/zi/zbrowse"
  [[ -d $Plugins[ZBROWSE_DATA] ]] || command mkdir -p $Plugins[ZBROWSE_DATA]
fi

# https://wiki.zshell.dev/community/zsh_plugin_standard#functions-directory
if [[ $PMSPEC != *f* ]]; then
  fpath+=( "${0:h}/functions" )
fi

autoload zbrowse
zle -N zbrowse
bindkey '^B' zbrowse

zmodload zsh/parameter || { echo "No zsh/parameter module, z-shell/zbrowse not registering itself"; return 0 }

# Holds 1) all defined parameters, 2) ZBROWSE_IPARAMS'
# values, both at preexec. Keys are "types", "values"
typeset -gAH ZBROWSE_BEFORE

# Holds interactively defined parameters
typeset -gaUH ZBROWSE_IPARAMS

# Holds parameters that changed recently, order matters
typeset -gaUH ZBROWSE_CHANGED_IPARAMS

# Holds types of parameters after change
typeset -gH ZBROWSE_IPARAMS_POST

# Holds black-listed parameters
typeset -gaH ZBROWSE_BLACK_LIST
ZBROWSE_BLACK_LIST=(
  '?' '*' '$' '#' '!' '@'

  ZUI_PB_WORDS
  ZUI_PB_LEFT
  ZUI_PB_WORDS_BEGINNINGS
  ZUI_PB_RIGHT
  ZUI_PB_SPACES
  ZUI_PB_SELECTED_WORD

  ZUILIST_NONSELECTABLE_ELEMENTS
  ZUILIST_HOP_INDICES
  ZUILIST_ACTIVE_SEGMENTS

  zcurses_attrs
  zcurses_keycodes
  zcurses_windows
  zcurses_colors
  ZCURSES_COLORS
  ZCURSES_COLOR_PAIRS

  _ZSH_HIGHLIGHT_PRIOR_CURSOR
  _ZSH_HIGHLIGHT_PRIOR_BUFFER

  ZCALCPROMPT
)

# Ran before command
__zbrowse_preexec() {
  ZBROWSE_BEFORE[types]="${(j: :)${(qkv)parameters[@]}}"
  ZBROWSE_BEFORE[values]=""
  local -a __elems
  local __param __param2 __value_str __text __last
  for __param in "${ZBROWSE_CHANGED_IPARAMS[@]}"; do
    if [[ "${(Pt)__param}" = *association* ]]; then
      __elems=( "${(Pkv@)__param}" )
      __last="${__elems[-1]}"
      __elems=( "${(@)__elems[1,50]}" )
      __text="${__elems[*]}"
    elif [[ "${(Pt)__param}" = *array* ]]; then
      __param2="${__param}[-1]"
      __last="${(P)__param2}"
      __param2="${__param}[1,50]"
      __elems=( "${(@P)__param2}" )
      __text="${__elems[*]}"
    else
      __text="${(P)__param}"
      __last="${__text[-10,-1]}"
      __text="${__text[1,300]}"
    fi
    __value_str="$__text$__last"
    # Matches hash dump-format - keys and values alternating
    ZBROWSE_BEFORE[values]+="${(q)__param} ${(q)__value_str} "
  done

  return 0
}

# Ran after command
__zbrowse_precmd() {
  builtin setopt localoptions extendedglob

  local ZBROWSE_TYPES_AFTER="${(j: :)${(qkv)parameters[@]}}"

  # Paranoid defence against the parameters being only spaces
  [[ "${ZBROWSE_BEFORE[types]}" != *[$'! \t']* || "$ZBROWSE_TYPES_AFTER" != *[$'! \t']* ]] && return 0

  # De-concatenated parameters
  local -A params_before params_after
  params_before=( "${(z)ZBROWSE_BEFORE[types]}" )
  params_after=( "${(z)ZBROWSE_TYPES_AFTER}" )
  ZBROWSE_BEFORE[types]=""

  # Iterate through all existing keys, before or after diff,
  # i.e. after all variables that were somehow live across
  # the diffing process
  local __key
  typeset -aU __keys
  __keys=( "${(k)params_after[@]}" "${(k)params_before[@]}" );
  for __key in "${__keys[@]}"; do
    __key="${(Q)__key}"
    # Checks if given parameter is from black-list
    [[ -n "${ZBROWSE_BLACK_LIST[(er)$__key]}" || "${(Pt)__key}" = *special* ]] && continue
    if [[ -z "${params_before[$__key]}" ]]; then
      ZBROWSE_IPARAMS+=( "$__key" )
      ZBROWSE_CHANGED_IPARAMS[1,0]=( "$__key" )
    elif [[ "${params_after[$__key]}" != "${params_before[$__key]}" ]]; then
      ZBROWSE_CHANGED_IPARAMS[1,0]=( "$__key" )
    fi
  done

  local -A __before_values
  if [[ -n "${ZBROWSE_BEFORE[values]}" ]]; then
    __before_values=( "${(z)ZBROWSE_BEFORE[values]}" )
    __before_values=( "${(Qkv)__before_values[@]}" )
  fi

  local __size_limit
  zstyle -s ':plugin:zbrowse' var-size-limit __size_limit || __size_limit="2048"

  local -a __elems __all_elems
  local __param __param2 __value_str __text __all_text __last
  for __param in "${ZBROWSE_CHANGED_IPARAMS[@]}"; do
    if [[ "${(Pt)__param}" = *association* ]]; then
      __all_elems=( "${(Pkv@)__param}" )
      __all_text="${(j::)__all_elems}"
      __last="${__all_elems[-1]}"
      __elems=( "${(@)__all_elems[1,50]}" )
      __text="${__elems[*]}"
      __all_elems=( "${(qqqq@)__all_elems}" )
      [[ -z "$__text" ]] && continue
      [[ "${#__all_text}" -gt "$__size_limit" ]] && continue
      [[ "$__text$__last" != "${__before_values[$__param]}" ]] && \
        print -r -- "association ${(q)__param} ${__all_elems[*]}" >>! "$Plugins[ZBROWSE_DATA]"/param.log
    elif [[ "${(Pt)__param}" = *array* ]]; then
      __all_text="${(Pj::)__param}"
      __param2="${__param}[-1]"
      __last="${(P)__param2}"
      __param2="${__param}[1,50]"
      __text="${(Pj: :)__param2}"
      [[ -z "$__text" ]] && continue
      [[ "${#__all_text}" -gt "$__size_limit" ]] && continue
      __all_elems=( "${(P@)__param}" )
      __all_elems=( "${(qqqq@)__all_elems}" )
      [[ "$__text$__last" != "${__before_values[$__param]}" ]] && \
        print -r -- "array ${(q)__param} ${__all_elems[*]}" >>! "$Plugins[ZBROWSE_DATA]"/param.log
    else
      __all_text="${(P)__param}"
      [[ "${#__all_text}" -gt "$__size_limit" ]] && continue
      __last="${__all_text[-10,-1]}"
      __text="${__all_text[1,300]}"
      __all_text="${(qqqq)__all_text}"
      [[ -z "$__text" ]] && continue
      [[ "$__text$__last" != "${__before_values[$__param]}" ]] && \
        print -r -- "scalar ${(q)__param} ${__all_text}" >>! "$Plugins[ZBROWSE_DATA]"/param.log
    fi
  done
}

autoload -Uz add-zsh-hook
add-zsh-hook preexec __zbrowse_preexec
add-zsh-hook precmd __zbrowse_precmd
