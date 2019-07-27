precmd_decorator() {
    STRING=""
    for i in $PRECMD_ENRICHER_DECORATOR_VENVS; do
        STRING+="${i}: ${(P)i} | "
    done
    if [ -z "$STRING" ]; then
    else
        echo ${STRING}
    fi
}

if [[ ${precmd_functions[(ie)precmd_decorator]} -le ${#precmd_functions} ]]; then
    echo precmd_decorator already loaded
else
    precmd_functions+=(precmd_decorator)
fi
