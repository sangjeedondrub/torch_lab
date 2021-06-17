CMD="jupyter lab --allow-root --ip=0.0.0.0 --no-browser"

if [[ -v PASSWORD ]]; then
  PASSWORD=$(python -c "import IPython; print(IPython.lib.security.passwd('$PASSWORD'))")
  CMD="$CMD --NotebookApp.token='' --NotebookApp.password='${PASSWORD}'"
fi

echo
exec $CMD "$@"